<%@ page import="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 01cli
  Date: 2022-04-18
  Time: 오후 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="copyright">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-12">
                <div class="copyright-info text-center">
              <%--<span>Copyright &copy; <script>
                  document.write(new Date().getFullYear())
                </script>, Designed &amp; Developed by <a href="<c:url value='/'/>https://themefisher.com">Themefisher</a></span>--%>
                </div>
            </div>

            <div class="col-md-12">
                <div class="copyright-info text-center">
                    <%--<span>Distributed by <a href="<c:url value='/'/>https://themewagon.com/">Themewagon</a></span>--%>

                        대표 : 권하준
                          주소 : 경상북도 구미시 야은로 730, (33빌딩 5층)
                          대표전화 : 054-461-0170
                          FAX : 054-461-0240
                          E-MAIL : jisungsoft@jisungsoft.com

                          Copyright ⓒ JISUNGSOFT. All Rights Reserved.
                </div>
            </div>

            <div class="col-md-12">
                <div class="footer-menu text-center">
                    <ul class="list-unstyled mb-0">



                        <%
                           /* LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");*/
                            if(loginVO == null){
                        %>
                            <li><a href="<c:url value='/'/>uat/uia/egovLoginUsr.do">Login</a></li>
                        <% }else { %>
                        <c:set var="loginName" value="<%= loginVO.getName()%>"/>
                            <li><a href="<c:url value='/'/>uat/uia/actionLogout.do" onclick="javascript:alert('로그아웃되었습니다. 메인페이지로 이동합니다.')">Logout</a></li>
                        <% } %>

                        <%--<li><a href="<c:url value='/'/>team.html">Our people</a></li>
                        <li><a href="<c:url value='/'/>faq.html">Faq</a></li>
                        <li><a href="<c:url value='/'/>news-left-sidebar.html">Blog</a></li>
                        <li><a href="<c:url value='/'/>pricing.html">Pricing</a></li>--%>
                    </ul>
                </div>
            </div>
        </div><!-- Row end -->

        <div id="back-to-top" data-spy="affix" data-offset-top="10" class="back-to-top position-fixed">
            <button class="btn btn-primary" title="Back to Top">
                <i class="fa fa-angle-double-up"></i>
            </button>
        </div>

    </div><!-- Container end -->
</div><!-- Copyright end -->

<%--<footer id="footer" class="footer">
    <div class="copyright">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-12">
                    <div class="copyright-info text-center">
              <span>Copyright &copy; <script>
                  document.write(new Date().getFullYear())
                </script>, Designed &amp; Developed by <a href="<c:url value='/'/>https://themefisher.com">Themefisher</a></span>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="copyright-info text-center">
                        <span>Distributed by <a href="<c:url value='/'/>https://themewagon.com/">Themewagon</a></span>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="footer-menu text-center">
                        <ul class="list-unstyled mb-0">
                            <li><a href="<c:url value='/'/>about.html">About</a></li>
                            <li><a href="<c:url value='/'/>team.html">Our people</a></li>
                            <li><a href="<c:url value='/'/>faq.html">Faq</a></li>
                            <li><a href="<c:url value='/'/>news-left-sidebar.html">Blog</a></li>
                            <li><a href="<c:url value='/'/>pricing.html">Pricing</a></li>
                        </ul>
                    </div>
                </div>
            </div><!-- Row end -->

            <div id="back-to-top" data-spy="affix" data-offset-top="10" class="back-to-top position-fixed">
                <button class="btn btn-primary" title="Back to Top">
                    <i class="fa fa-angle-double-up"></i>
                </button>
            </div>

        </div><!-- Container end -->
    </div><!-- Copyright end -->
</footer><!-- Footer end -->--%>


</body>
</html>
