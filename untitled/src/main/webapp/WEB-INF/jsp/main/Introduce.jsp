<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 01cli
  Date: 2022-04-18
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>스마트팩토리 | 지성소프트</title>
    <!-- Mobile Specific Metas
================================================== -->

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

    <style>
         
    </style>
</head>
<body>

<%@include file="/WEB-INF/jsp/main/header.jsp" %>
<section class="banner">
    <div class="container">
        <div class="row justify-content-center text-center">
            <div class="text-center article-title">
                <h1>
                    지성소프트는
                </h1>
            </div>
        </div>
        <div class="col-lg-12" >
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <div class="content">
                        <p>
                            지성소프트는 제조 업종에 특화된 ERP.MES 솔루션을 전문적으로 컨설팅합니다.
                        <br>
                            특히, 현업 실무 경험을 바탕으로 산업구별 특화된 기능 및 컨설팅 서비스를 제공하고 있습니다.
                        </p>
                    </div>
                </div>
                <div class="ibox-content"
                     style="background-image: url('<c:url value='/'/>images/introback.png');
                             background-size: contain;
                             background-repeat: no-repeat;
                             background-position: right;
                             "
                            >
                    <ul>
                        <h3><li>고객 이익 창출</li></h3>
                        <h3><li>고객 경쟁력 강화</li></h3>
                        <h3><li>고도의 생산성 향상</li></h3>
                        <h3><li>정보화 기반 기업혁신 컨설팅 회사 </li></h3>
                    </ul>
                    <br>
                    <p> 4차 산업혁명의 사회의 환경에서 경쟁력 우위를 점하기 위한 효과적인 고객지향적 Smart Factory 컨설팅 제공.</p>
                    <p> 고객사업의 가치를 높이고 완성시키는 최고의 파트너!</p>
                </div>
            </div>
        </div>
    </div>
</section>




<%@include file="/WEB-INF/jsp/main/footer.jsp" %>

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


<!-- Page-Level Scripts -->
<script>
    $(document).ready(function() {

        $('.footable').footable();
        $('.footable2').footable();

    });

</script>
</body>
</html>
