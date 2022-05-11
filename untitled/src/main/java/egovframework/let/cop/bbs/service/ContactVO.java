package egovframework.let.cop.bbs.service;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.Serializable;


@Getter
@Setter
@Configuration
public class ContactVO extends Contact implements Serializable {
    private static final long serialVersionUID = 3698823648499933214L;


    // 문의하기 유니크아이디
    private String contactUniqId;

    // 문의하기 이름
    private String contactName;

    //문의하기 이메일
    private String contactEmail;

    //문의하기 제목
    private String contactTitle;

    //문의하기 내용
    private String contactContents;

    //문의하기 연락처
    private String contactPhone;

    //문의하기 작성일
    private String contactDate;

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** 첫페이지 인덱스 */
    private int firstIndex = 1;

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;

    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 10;

    /** 정렬순서(DESC,ASC) */
    private long sortOrdr = 0L;

    /** 레코드 번호 */
    private int rowNo = 0;

    private int contactIndexNumber=1;

    /** 검색조건 */
    private String searchCnd = "";

    /** 검색단어 */
    private String searchWrd = "";


    public static ContactVO insertContact(String contactUniqId, String contactName,String contactEmail, String contactTitle, String contactContents, String contactPhone, String contactDate, int contactIndexNumber)
    {
        ContactVO contactVO = new ContactVO();
        contactVO.contactUniqId = contactUniqId;
        contactVO.contactName = contactName;
        contactVO.contactEmail = contactEmail;
        contactVO.contactTitle = contactTitle;
        contactVO.contactContents = contactContents;
        contactVO.contactPhone = contactPhone;
        contactVO.contactDate = contactDate;
        contactVO.contactIndexNumber = contactIndexNumber;
        return contactVO;
    }
}
