package egovframework.let.cop.bbs.web;


import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.cop.bbs.service.Contact;
import egovframework.let.cop.bbs.service.ContactService;
import egovframework.let.cop.bbs.service.ContactVO;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

@Controller
public class ContactController {

    @Resource(name = "ContactService")
    private ContactService contactService;

    @Resource(name="egovIdGnrService")
    private EgovIdGnrService egovIdGnrService;


    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Autowired
    private DefaultBeanValidator beanValidator;


    /**
     * 문의글 작성 페이지로 이동
     * @param model
     * @param contactVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cop/bbs/contactWrite.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String addContact(Model model, ContactVO contactVO) throws Exception
    {
        // view의 contactForm 어트리뷰트
        model.addAttribute("contactForm",contactVO);
        return "main/ContactRegist";
    }

    /**
     * 문의글을 등록한다.
     * @param vo
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cop/bbs/contactRegist.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String insertContact(@ModelAttribute("contactForm") ContactVO vo) throws Exception {
                                // view에서 contactForm 에 잇는데이터가져오기

        // 가져온데이터 넣기
        contactService.insertContact(vo);
        return "redirect:/cop/bbs/contactWrite.do";
    }


    /**
     * 문의글 목록
     * @param contactVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/contactList.do")
    public String selectContactList(@ModelAttribute("searchVO")ContactVO contactVO
                                    , ModelMap model) throws Exception
    {
        LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

        contactVO.setPageUnit(propertyService.getInt("pageUnit"));
        contactVO.setPageSize(propertyService.getInt("pageSize"));

        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(contactVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(contactVO.getPageUnit());
        paginationInfo.setPageSize(contactVO.getPageSize());

        contactVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        contactVO.setLastIndex(paginationInfo.getLastRecordIndex());
        contactVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        Map<String, Object> map = contactService.selectContactList(contactVO);
        int totCnt = Integer.parseInt((String)map.get("resultCnt"));
        paginationInfo.setTotalRecordCount(totCnt);

        //List<ContactVO> resultList = contactService.selectContactList(contactVO);
       // model.addAttribute("resultList", resultList);
        model.addAttribute("resultList", map.get("resultList"));
        model.addAttribute("resultCnt", map.get("resultCnt"));
        model.addAttribute("paginationInfo", paginationInfo);

        return "main/ContactList";

    }


    /**
     * 문의글 한건 조회
     * @param contactVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/cop/bbs/contactListDetail.do" ,method = { RequestMethod.POST, RequestMethod.GET})
    public String selectContactDetail(@ModelAttribute("resultList") ContactVO contactVO
            , ModelMap model) throws Exception
    {

        ContactVO vo = contactService.selectContactDetail(contactVO);
        model.addAttribute("contactDetail", vo);
        return "main/ContactDetail";
    }




    /**
     *  문의글 삭제
     * @param contactVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/contactDelete.do")
    public String contactDelete(@ModelAttribute("contactDetail")ContactVO contactVO, ModelMap model) throws Exception
    {
        /* 해당 게시판 게시글 존재 체크 */
        ContactVO paramVO = new ContactVO();
        paramVO.setContactUniqId(contactVO.getContactUniqId());
        contactService.deleteContact(paramVO);
        model.addAttribute("resultMessage", "success.common.delete");
        model.addAttribute("redirectUri", "/cop/bbs/contactList.do");

        return "redirect:/cop/bbs/contactList.do";
    }



}
