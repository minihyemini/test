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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class HistoryController {

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
     * 협력업체 작성 페이지로 이동
     * @param model
     * @param
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cop/bbs/historyWrite.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String addHistory(Model model, @ModelAttribute("board") Board board) throws Exception
    {
        board.setBbsId("BBSMSTR_DDDDDDDDDDDD");
        // view의 contactForm 어트리뷰트
        model.addAttribute("board",board);
        return "main/AddHistory";
    }
/**
     * 협력업체를 등록한다.
     * @param
     * @return
     * @throws Exception
     */


    @RequestMapping("/cop/bbs/historyRegist.do")
    public String insertHistory(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
                                     @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, SessionStatus status,
                                     ModelMap model) throws Exception {
        // 사용자권한 처리
        if(!EgovUserDetailsHelper.isAuthenticated()) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "cmm/uat/uia/EgovLoginUsr";
        }

        LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        beanValidator.validate(board, bindingResult);
        if (bindingResult.hasErrors()) {

            BoardMasterVO master = new BoardMasterVO();
            BoardMasterVO vo = new BoardMasterVO();

            vo.setBbsId(boardVO.getBbsId());
            vo.setUniqId(user.getUniqId());

            master = bbsAttrbService.selectBBSMasterInf(vo);

            model.addAttribute("bdMstr", master);

            //----------------------------
            // 기본 BBS template 지정
            //----------------------------
            if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
                master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
            }

            model.addAttribute("brdMstrVO", master);
            ////-----------------------------

            return "main/AddHistory";
        }

        if (isAuthenticated) {
            List<FileVO> result = null;
            String atchFileId = "";

            final Map<String, MultipartFile> files = multiRequest.getFileMap();
            if (!files.isEmpty()) {
                result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
                atchFileId = fileMngService.insertFileInfs(result);
            }
            board.setAtchFileId(atchFileId);
            board.setFrstRegisterId(user.getUniqId());
            board.setBbsId("BBSMSTR_DDDDDDDDDDDD");

            board.setNtcrNm("운영자");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
            board.setPassword("0000");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
            //board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

            bbsMngService.insertBoardArticle(board);
        }


        //status.setComplete();
        return "redirect:/cop/bbs/historyWrite.do";
    }




    /**
     * 협력업체 리스트를 조회한다.
     */
    @RequestMapping("/cop/bbs/history.do")
    public String getHistory(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception
    {

        LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        boardVO.setBbsId("BBSMSTR_DDDDDDDDDDDD");
        boardVO.setBbsNm("협력업체");
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
        paginationInfo.setRecordCountPerPage(8);
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

        String atchFileId = boardVO.getAtchFileId();

        return "main/History";
    }

    /**
     * 삭제한다.
     */
    @RequestMapping("/cop/bbs/historyDelete.do")
    public String contactDelete(@ModelAttribute("board")Board board, ModelMap model) throws Exception
    {

        bbsMngService.deleteBoardArticle(board);
        return "redirect:/cop/bbs/history.do";
    }

    /**
     * 협력업체 수정하는 페이지로 이동한다.
     * @param board
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/forUpdateHistory.do")
    public String selectHistoryForUpdt(@ModelAttribute("board")BoardVO board, ModelMap model) throws Exception
    {
        LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        board.setFrstRegisterId(user.getUniqId());
        BoardMaster master = new BoardMaster();
        BoardMasterVO bmvo = new BoardMasterVO();
        BoardVO bdvo = new BoardVO();



        master.setBbsId(board.getBbsId());
        master.setUniqId(user.getUniqId());

        bmvo = bbsAttrbService.selectBBSMasterInf(master);
        bdvo = bbsMngService.selectBoardArticle(board);

        model.addAttribute("result", bdvo);
        model.addAttribute("bdMstr", bmvo);

        model.addAttribute("boardMasterVO", bmvo);
        ////-----------------------------
        model.addAttribute("board",board);

        return "main/HistoryUpdt";
    }

    /**
     * 협력업체를 수정한다.
     */
    @RequestMapping("/cop/bbs/UpdateHistory.do")
    public String updateNotice(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
                               @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") BoardVO board, BindingResult bindingResult, ModelMap model,
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
        BoardMasterVO vo = new BoardMasterVO();
        vo.setBbsId(boardVO.getBbsId());
        Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());

        model.addAttribute("resultList", map.get("resultList"));
        board.setLastUpdusrId(user.getUniqId());

        board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

        bbsMngService.updateBoardArticle(board);


        return "forward:/cop/bbs/history.do";
        /*return "main/History";*/
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
