package egovframework.let.cop.bbs.service.impl;

import egovframework.let.cop.bbs.service.Contact;
import egovframework.let.cop.bbs.service.ContactService;
import egovframework.let.cop.bbs.service.ContactVO;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("ContactService")
public class ContactServiceImpl extends EgovAbstractServiceImpl implements ContactService {

    @Resource(name = "ContactDAO")
    private ContactDAO contactDAO;

    @Resource(name = "egovIdGnrService")
    private EgovIdGnrService egovIdGnrService;


    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpServletResponse response;

    /**
     *  문의글 리스트 조회한다.
     * @param param
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectContactList(ContactVO param) throws Exception
    {
        List<ContactVO> list = contactDAO.selectContactList(param);
        List<ContactVO> result = list;
        //result = list;
        int cnt = contactDAO.selectContactListCount(param);

        Map<String, Object> map = new HashMap<>();

        map.put("resultList" , result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }

    /**
     * 문의글 한건을 조회한다.
     * @param paramVO
     * @return
     * @throws Exception
     */
    @Override
    public ContactVO selectContactDetail (ContactVO paramVO) throws Exception
    {
        return contactDAO.selectContactDetail(paramVO);
    }

    /**
     *  문의글 등록한다.
     * @param contact
     * @throws Exception
     */
    @Override
    public void insertContact(ContactVO param) throws Exception{

        ContactVO vo = ContactVO.insertContact(String.valueOf(egovIdGnrService.getNextIntegerId()), param.getContactName(), param.getContactEmail(), param.getContactTitle(), param.getContactContents(), param.getContactPhone(), param.getContactDate(), param.getContactIndexNumber());
        contactDAO.insertContact(vo);
    }

    /**
     *  문의글 삭제한다.
     * @param contact
     * @throws Exception
     */
    @Override
    public void deleteContact(Contact contact) throws Exception {
        contactDAO.deleteContact(contact);
    }


}
