package egovframework.let.cop.bbs.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.cop.bbs.service.*;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class NoticeController {


    @Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;

    @Resource(name = "EgovBBSAttributeManageService")
    private EgovBBSAttributeManageService bbsAttrbService;

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;

    @Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Autowired
    private DefaultBeanValidator beanValidator;

    /**
     * 공지사항 목록
     * @param boardVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/notice.do")
    public String getNoticeList(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception
    {
        LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        boardVO.setBbsId("BBSMSTR_AAAAAAAAAAAA");
        boardVO.setBbsNm("공지사항");
        boardVO.getNtcrNm();
        BoardMasterVO vo = new BoardMasterVO();
        vo.setBbsId(boardVO.getBbsId());
        vo.setUniqId(user.getUniqId());
        BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);
        boardVO.setPageUnit(propertyService.getInt("pageUnit"));
        boardVO.setPageSize(propertyService.getInt("pageSize"));
        PaginationInfo paginationInfo = new PaginationInfo();

        //현재페이지 위치                          //페이지 인덱스
        paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
        // 페이지당 레코드 갯수                        // 페이지개수(기본값10)
        paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
        // 페이지 사이즈(??)
        paginationInfo.setPageSize(boardVO.getPageSize());

        // 첫페이지 인덱스
        boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        // 마지막페이지 인덱스
        boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
        //페이지당 레코드 개수
        boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
        int totCnt = Integer.parseInt((String)map.get("resultCnt"));
        paginationInfo.setTotalRecordCount(totCnt);

        model.addAttribute("resultList", map.get("resultList"));
        model.addAttribute("resultCnt", map.get("resultCnt"));
        model.addAttribute("boardVO", boardVO);
        model.addAttribute("brdMstrVO", master);
        model.addAttribute("paginationInfo", paginationInfo);

        return "main/JisungNoticeList";
    }

    /**
     * 공지사항 리스트 페이징 처리
     */
    @RequestMapping("/pageList.do")
    public void list(BoardVO vo, Model model) throws Exception {

    }

    /**
     * 공지사항에 대한 상세 정보를 조회한다.
     *
     * @param boardVO
     * @param
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectNotice.do")
    public String selectNoticeArticle(@ModelAttribute("resultList") BoardVO boardVO, ModelMap model) throws Exception {

        // 조회수 증가 여부 지정
        boardVO.setPlusCount(true);
        //---------------------------------
        // 2009.06.29 : 2단계 기능 추가
        //---------------------------------
        if (!boardVO.getSubPageIndex().equals("")) {
            boardVO.setPlusCount(false);
        }
        ////-------------------------------

        BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

        model.addAttribute("noticeResult", vo);
        model.addAttribute("articleVO", vo);
        //----------------------------
        // template 처리 (기본 BBS template 지정  포함)
        //----------------------------
        BoardMasterVO master = new BoardMasterVO();

        master.setBbsId(boardVO.getBbsId());

        BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

        model.addAttribute("brdMstrVO", masterVo);

        return "main/NoticeDetail";
    }

    /**
     *  공지 삭제
     * @param
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/noticeDelete.do")
    public String contactDelete(@ModelAttribute("noticeResult")Board board, ModelMap model) throws Exception
    {
        Board id = new Board();
        id.setNttId(board.getNttId());
        id.setBbsId(board.getBbsId());
        bbsMngService.deleteBoardArticle(id);
        return "redirect:/cop/bbs/notice.do";
    }


    /**
     * 공지글 작성 페이지로 이동
     * @param model
     * @param
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cop/bbs/noticeWrite.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String addNotice(Model model, Board board) throws Exception
    {
        // view의 contactForm 어트리뷰트
        model.addAttribute("boardForm",board);
        return "main/NoticeRegist";
    }

    /**
     * 공지글을 등록한다.
     * @param vo
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cop/bbs/noticeRegist.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String insertNotice(@ModelAttribute("boardForm") BoardVO vo) throws Exception {
        // view에서 contactForm 에 잇는데이터가져오기

        // 가져온데이터 넣기
        vo.setBbsId("BBSMSTR_AAAAAAAAAAAA");
        vo.setBbsNm("공지사항");
        vo.setNtcrNm("운영자");
        bbsMngService.insertBoardArticle(vo);
        return "redirect:/cop/bbs/notice.do";
    }

    /**
     * 공지글을 수정하는 페이지로 이동
     */
    @RequestMapping("/cop/bbs/forUpdateNotice.do")
    public String selectNoticeForUpdt(@ModelAttribute("board") BoardVO boardVO, @ModelAttribute("searchVO") BoardVO vo, ModelMap model)
            throws Exception {


        LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        boardVO.setFrstRegisterId(user.getUniqId());

        BoardMaster master = new BoardMaster();
        BoardMasterVO bmvo = new BoardMasterVO();
        BoardVO bdvo = new BoardVO();

        vo.setBbsId(boardVO.getBbsId());

        master.setBbsId(boardVO.getBbsId());
        master.setUniqId(user.getUniqId());

        if (isAuthenticated) {
            bmvo = bbsAttrbService.selectBBSMasterInf(master);
            bdvo = bbsMngService.selectBoardArticle(boardVO);
        }

        model.addAttribute("result", bdvo);
        model.addAttribute("bdMstr", bmvo);

        //----------------------------
        // 기본 BBS template 지정
        //----------------------------
        if (bmvo.getTmplatCours() == null || bmvo.getTmplatCours().equals("")) {
            bmvo.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
        }

        model.addAttribute("boardMasterVO", bmvo);
        ////-----------------------------
        model.addAttribute("board",boardVO);

        return "main/NoticeUpdate";
    }


    /**
     * 공지글을 수정한다.
     */
    @RequestMapping("/cop/bbs/UpdateNotice.do")
    public String updateNotice(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
                                     @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model,
                                     SessionStatus status) throws Exception {

        // 사용자권한 처리
        if(!EgovUserDetailsHelper.isAuthenticated()) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "cmm/uat/uia/EgovLoginUsr";
        }

        LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        String atchFileId = boardVO.getAtchFileId();

        beanValidator.validate(board, bindingResult);
        /*if (bindingResult.hasErrors()) {

            boardVO.setFrstRegisterId(user.getUniqId());

            BoardMaster master = new BoardMaster();
            BoardMasterVO bmvo = new BoardMasterVO();
            BoardVO bdvo = new BoardVO();

            master.setBbsId(boardVO.getBbsId());
            master.setUniqId(user.getUniqId());

            bmvo = bbsAttrbService.selectBBSMasterInf(master);
            bdvo = bbsMngService.selectBoardArticle(boardVO);

            model.addAttribute("result", bdvo);
            model.addAttribute("bdMstr", bmvo);

            return "cop/bbs/EgovNoticeUpdt";
        }*/

       /* if (isAuthenticated) {*/
            final Map<String, MultipartFile> files = multiRequest.getFileMap();
            if (!files.isEmpty()) {
                if ("".equals(atchFileId)) {
                    List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, "");
                    atchFileId = fileMngService.insertFileInfs(result);
                    board.setAtchFileId(atchFileId);
                } else {
                    FileVO fvo = new FileVO();
                    fvo.setAtchFileId(atchFileId);
                    int cnt = fileMngService.getMaxFileSN(fvo);
                    List<FileVO> _result = fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "");
                    fileMngService.updateFileInfs(_result);
                }
            }

            board.setLastUpdusrId(user.getUniqId());

            board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

            bbsMngService.updateBoardArticle(board);
        /*}*/

        return "forward:/cop/bbs/notice.do";
    }

    /**
     * XSS 방지 처리.
     *
     * @param data
     * @return
     */
    protected String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }

        String ret = data;

        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;
    }

}
