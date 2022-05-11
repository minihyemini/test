<%--
  Created by IntelliJ IDEA.
  User: 01cli
  Date: 2022-04-18
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>기업 비즈니스 | 지성소프트</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Construction Html5 Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
    <link href="<c:url value='/'/>plugins/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/fontawesome/css/all.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/animate-css/animate.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick-theme.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css" >


    <link href="<c:url value='/'/>css/animate.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/style2.css" rel="stylesheet">
    <link href="<c:url value='/'/>constra/css/style.css" rel="stylesheet" type="text/css" >


</head>
<body>
<%@include file="/WEB-INF/jsp/main/header.jsp" %>
<section class="banner">
    <div class="container">
        <div class="row justify-content-center text-center">
            <div class="text-center article-title">
                <h1>
                    SYSTEM 영역 - 기업 비즈니스
                </h1>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h4>ERP</h4>
                    <div class="content">
                        <img src="<c:url value='/'/>images/erp.png">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="ibox-title">
                    <h4>CRM</h4>
                    <img src="<c:url value='/'/>images/erp2.png">
                </div>

            </div>
            <div class="col-lg-6">
                <div class="ibox-title">
                    <h4>PLM</h4>
                    <img src="<c:url value='/'/>images/erp3.png">
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="ibox-title">
                    <h4>APS</h4>
                    <img src="<c:url value='/'/>images/erp4.png">
                </div>

            </div>
            <div class="col-lg-6">
                <div class="ibox-title">
                    <h4>E-Procurement</h4>
                    <img src="<c:url value='/'/>images/erp5.png">
                </div>

            </div>
        </div>



    </div>

    </div>
</section>

<%@include file="/WEB-INF/jsp/main/footer.jsp" %>

<script>

</script>
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

</body>
</html>
