package egovframework.let.cop.bbs.service;


import lombok.Data;
import lombok.Setter;
import lombok.ToString;
import org.springframework.context.annotation.Configuration;

import java.io.Serializable;

@Data
public class Contact implements Serializable {

    private static final long serialVersionUID = 7353215926853317589L;
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
    /**
     * 정렬순서
     */
    private long sortOrdr = 0L;

    private int contactIndexNumber=1;

}
