<%@ page import="egovframework.com.cmm.LoginVO" %><%--
  Created by IntelliJ IDEA.
  User: 01cli
  Date: 2022-04-18
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring-commons-validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인 | 지성소프트</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Construction Html5 Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">



    <link href="<c:url value='/'/>plugins/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/fontawesome/css/all.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/animate-css/animate.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick-theme.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css" >

    <link href="<c:url value='/'/>css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/'/>font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/plugins/summernote/summernote-bs3.css" rel="stylesheet">

    <link href="<c:url value='/'/>css/animate.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/style2.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/style.css" rel="stylesheet" type="text/css" >
    <!-- Sweet Alert -->
    <link href="<c:url value='/'/>css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>
<body class="gray-bg" onload="fnInit()">
<%--<%@include file="/WEB-INF/jsp/main/header.jsp" %>--%>




<%
    LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
    if(loginVO != null){
%>
<script>alert("잘못된 접근입니다.");
        history.back();
</script>

<% } %>

<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">JS+</h1>

        </div>
        <h3>Welcome to JisungSoft</h3>
        <p>지성소프트에 오신것을 환영합니다.
            <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
        </p>
       <%-- <p>지성소프트는 고객이 원하는 최상의 서비스를 드릴것을 약속합니다.</p>--%>

        
        <%--@elvariable id="loginVO" type="egovframework.com.cmm.LoginVO"--%>
        <form:form modelAttribute="loginVO" name="loginVO" method="post" action="#LINK" cssClass="m-t" >
           <div class="form-group">
                <form:input path="id" cssClass="form-control" autocomplete="true" id="id" placeholder="아이디" />
            </div>
            <div class="form-group">
                <form:password path="password" cssClass="form-control" id="password" placeholder="비밀번호" />
            </div>
            <button type="button" class="btn btn-primary block full-width m-b" onclick="javascript:actionLogin()">Login</button>
            <a href="#"><small>Forgot password?</small></a>
            <p class="text-muted text-center"><small>Do not have an account?</small></p>
            <a class="btn btn-sm btn-white btn-block" href="register.html">Create an account</a>
            <input type="hidden" name="message" value="${message}" />
            <input type="hidden" name="userSe"  value="USR"/>
        </form:form>
        <p class="m-t"> <small>Inspinia we app framework base on Bootstrap 3 &copy; 2014</small> </p>
    </div>
</div>

<script>
    function actionLogin() {


        if ( document.loginVO.id.value =="" ) {
            alert("아이디를 입력하세요");
            return false;
        } else if ( document.loginVO.password.value == "" ) {
            alert("비밀번호를 입력하세요");
            return false;
        } else {
            document.loginVO.action="<c:url value='/uat/uia/actionLogin.do'/>";
            //document.loginVO.action="<c:url value='/j_spring_security_check'/>";
            document.loginVO.submit();
        }
    }

    function fnInit() {
        var message = document.loginVO.message.value;
        if (message != "") {
            swal({
                title: "로그인실패",
                text: "로그인 정보가 올바르지 않습니다."
            });
        }
        getid(document.loginVO);
    }

</script>
<%--<%@include file="/WEB-INF/jsp/main/footer.jsp" %>--%>
<!-- Mainly scripts -->
<script src="<c:url value='/'/>js/jquery-2.1.1.js"></script>
<script src="<c:url value='/'/>js/bootstrap.min.js"></script>
<script src="<c:url value='/'/>js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<c:url value='/'/>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="<c:url value='/'/>js/inspinia.js"></script>
<script src="<c:url value='/'/>js/plugins/pace/pace.min.js"></script>


<!-- Flot -->
<script src="<c:url value='/'/>js/plugins/flot/jquery.flot.js"></script>
<script src="<c:url value='/'/>js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="<c:url value='/'/>js/plugins/flot/jquery.flot.resize.js"></script>

<!-- ChartJS-->
<script src="<c:url value='/'/>js/plugins/chartJs/Chart.min.js"></script>

<!-- Peity -->
<script src="<c:url value='/'/>js/plugins/peity/jquery.peity.min.js"></script>
<!-- Peity demo -->
<script src="<c:url value='/'/>js/demo/peity-demo.js"></script>
<!-- Sweet alert -->
<script src="<c:url value='/'/>js/plugins/sweetalert/sweetalert.min.js"></script>
</body>
</html>
