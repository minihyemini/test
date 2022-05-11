package egovframework.let.cop.bbs.service;

import java.util.List;
import java.util.Map;

public interface ContactService {

    /**
     * 문의글 목록을 조회한다.
     * @param contactVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectContactList(ContactVO contactVO) throws Exception;

    /**
     * 문의글 한건의 내용을 조회한다.
     * @param contactVO
     * @return
     * @throws Exception
     */
    public ContactVO selectContactDetail(ContactVO contactVO) throws Exception;


    /**
     * 문의글을 등록한다.
     * @param contact
     * @throws Exception
     */
    public void insertContact(ContactVO contact) throws Exception;

    /**
     * 문의글을 삭제한다.
     * @param contact
     * @throws Exception
     */
    public void deleteContact(Contact contact) throws Exception;
}
