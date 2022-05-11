package egovframework.let.uat.uia.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.ResponseCode;
import egovframework.com.cmm.service.ResultVO;
import egovframework.let.uat.uia.service.EgovLoginService;
import org.egovframe.rte.fdl.cmmn.trace.LeaveaTrace;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;


@RestController
public class LoginAPIController {
    /** EgovLoginService */
    @Resource(name = "loginService")
    private EgovLoginService loginService;

    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** TRACE */
    @Resource(name = "leaveaTrace")
    LeaveaTrace leaveaTrace;

    /**
     * 일반 로그인을 처리한다
     * @param  - 아이디, 비밀번호가 담긴 LoginVO
     * @param request - 세션처리를 위한 HttpServletRequest
     * @return result - 로그인결과(세션정보)
     * @exception Exception
     */
    @RequestMapping(value = "/uat/uia/actionLoginAPI.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
//	@Consumes({"text/html;charset=UTF-8","application/json;charset=UTF-8"})
    public @ResponseBody
    HashMap<String, Object> actionLogin(@RequestBody LoginVO loginVO, HttpServletRequest request) throws Exception {
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        // 1. 일반 로그인 처리
        LoginVO loginResultVO = loginService.actionLogin(loginVO);

        boolean loginPolicyYn = true;

        if (loginResultVO != null && loginResultVO.getId() != null && !loginResultVO.getId().equals("") && loginPolicyYn) {

            request.getSession().setAttribute("LoginVO", loginResultVO);
            resultMap.put("resultVO",loginResultVO);
            resultMap.put("resultCode", "200");
            resultMap.put("resultMessage", "성공 !!!");
        } else {
            resultMap.put("resultVO",loginResultVO);
            resultMap.put("resultCode", "300");
            resultMap.put("resultMessage", egovMessageSource.getMessage("fail.common.login"));
        }

        return resultMap;

    }

    @RequestMapping(value = "/uat/uia/actionLoginJWT.do")
    public @ResponseBody HashMap<String, Object> actionLoginJWT(@RequestBody LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {
        // 1. 일반 로그인 처리
        LoginVO resultVO = loginService.actionLogin(loginVO);

        boolean loginPolicyYn = true;
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("") && loginPolicyYn) {

            request.getSession().setAttribute("LoginVO", resultVO);
            resultMap.put("resultVO",resultVO);
            resultMap.put("resultCode", "0");
            resultMap.put("resultMessage", "성공 !!!");
        } else {
            resultMap.put("resultVO",resultVO);
            resultMap.put("resultCode", "100");
            resultMap.put("resultMessage", egovMessageSource.getMessage("fail.common.login"));
        }
        return resultMap;
    }

    /**
     * 로그아웃한다.
     * @return String
     * @exception Exception
     */
    @RequestMapping(value = "/uat/uia/actionLogoutAPI.do")
    public @ResponseBody
    ResultVO actionLogoutJSON(HttpServletRequest request) throws Exception {
        ResultVO resultVO = new ResultVO();

        RequestContextHolder.getRequestAttributes().removeAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);

        resultVO.setResultCode(ResponseCode.SUCCESS.getCode());
        resultVO.setResultMessage(ResponseCode.SUCCESS.getMessage());

        return resultVO;
    }
}
