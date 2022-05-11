package egovframework.let.cop.bbs.service.impl;


import egovframework.let.cop.bbs.service.Board;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.Contact;
import egovframework.let.cop.bbs.service.ContactVO;
import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository("ContactDAO")
public class ContactDAO  extends EgovAbstractMapper {

    /**
     *  문의글을 등록한다.
     * @param param
     * @throws Exception
     */
    public void insertContact(ContactVO param) throws Exception {
        int contactIndexNumber = (Integer)selectOne("ContactDAO.selectMaxIndexNumber");
        param.setContactIndexNumber(contactIndexNumber);
        insert("ContactDAO.insertContact", param);
    }

    /**
     * 문의글 목록을 조회한다.
     * @param contactVO
     * @return
     * @throws Exception
     */
    public List<ContactVO> selectContactList(ContactVO contactVO) throws Exception {
       return (List<ContactVO>) list("ContactDAO.selectContactList", contactVO);
    }

    /**
     * 조건에 맞는 게시물 목록에 대한 전체 건수를 조회 한다.
     *
     * @param contactVO
     * @return
     * @throws Exception
     */
    public int selectContactListCount(ContactVO contactVO) throws Exception {
        return (Integer)selectOne("ContactDAO.selectContactListCount", contactVO);
    }

    /**
     * 게시판에 대한 목록을 정렬 순서로 조회 한다.
     *
     * @param contact
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ContactVO> selectContactListForSort(Contact contact) throws Exception {
        return (List<ContactVO>) list("ContactDAO.selectContactListForSort", contact);
    }

    /**
     * 문의글 한건의 내용을 조회한다.
     * @param contactVO
     * @return
     * @throws Exception
     */
    public ContactVO selectContactDetail (ContactVO contactVO) throws Exception {
        return (ContactVO) selectOne("ContactDAO.selectContactDetail",contactVO);
    }

    /**
     * 문의글을 삭제한다.
     * @param contact
     * @throws Exception
     */
    public void deleteContact (Contact contact) throws Exception
    {
        delete("ContactDAO.deleteContact", contact);
    }

}
