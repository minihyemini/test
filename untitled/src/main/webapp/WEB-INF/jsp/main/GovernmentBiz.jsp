<%--
  Created by IntelliJ IDEA.
  User: 01cli
  Date: 2022-04-18
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>정부사업 | 지성소프트</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Construction Html5 Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">

<%--    <link href="<c:url value='/'/>plugins/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
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

    <link href="<c:url value='/'/>css/style.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>contstra/css/style2.css" rel="stylesheet">--%>


    <link href="<c:url value='/'/>plugins/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/fontawesome/css/all.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/animate-css/animate.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick-theme.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>css/style.css" rel="stylesheet" type="text/css" >
</head>
<body>
<%@include file="/WEB-INF/jsp/main/header.jsp" %>
<section class="banner">
    <div class="container">
        <div class="row justify-content-center text-center">
            <div class="text-center article-title">
                <h1>
                    정부지원사업
                </h1>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h4>개요</h4>
                    <div class="content">
                        <p>스마트 팩토리는 정보통신기술(ICT)을 이용해 생산공정, 제품개발, 공급체계 및 자원 관리 등을 첨단화한 지능형 공장을 말합니다.<br>
                            중소/중견기업 제조업을 대상으로 제조현장의 경쟁력 제고를 위해 사업비의 50%를 지원하여 스마트공장으로 구축 지원하고 있습니다.<br>
                            2022년까지 중소기업 스마트공장 3만개 구축예정
                        </p>
                        <img src="<c:url value='/'/>images/government.png">
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h4>지원분야 및 내용</h4>
                            <p>제품설계 · 생산 공정 개선 등을 위한 IoT 등 첨단기술이 적용된 스마트공장 솔루션 구축 및 연동 자동화장비· 제어기 · 센서 등 구입지원</p>
                        </div>
                        <table class="table table-bordered">
                            <thead>
                            <th>지원</th>
                            <th>대표솔루션</th>
                            <th>지원내용</th>
                            <th>예상효과</th>
                            </thead>
                            <tr>
                                <td>현장자동화⁄ 공장운영</td>
                                <td>MES</td>
                                <td>솔루션 및 연동 디지털 자동화 장비</td>
                                <td>품질개선, 생산성 향상</td>
                            </tr>
                            <tr>
                                <td>제품 개발</td>
                                <td>PLM</td>
                                <td>솔루션 및 연동 CAD/CAM 등</td>
                                <td>설계 개발 리드타임 단축</td>
                            </tr>
                            <tr>
                                <td>에너지관리</td>
                                <td>FEMS</td>
                                <td>솔루션 및 연동 자동화 관리</td>
                                <td>에너지 절감</td>
                            </tr>
                            <tr>
                                <td>공급사슬 관리</td>
                                <td>SCM</td>
                                <td>솔루션 및 연동 바코드 또는 RFID시스템</td>
                                <td>납기준수율 향상</td>
                            </tr>
                            <tr>
                                <td>기업자원 관리</td>
                                <td>ERP</td>
                                <td>솔루션 및 연동 바코드 또는 RFID시스템</td>
                                <td>업무프로세스 개선</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h4>지원사업 종류</h4>
                    </div>
                </div>
                <div class="row justify-content-center text-center">
                    <div class="text-center article-title">
                        <table class="table table-bordered">
                            <thead>
                            <th>사업명</th>
                            <th>지원유형</th>
                            <th>지원내용</th>
                            <th>정부지원액<br>(총사업비의 50%, 최대)</th>
                            <th>모집기간</th>
                            </thead>
                            <tr>
                                <td rowspan="2">스마트공장 구축 및 고도화</td>
                                <td>신규구축</td>
                                <td>스마트공장 미구축 기업대상, 솔루션 및 연동 설비 구축 지원</td>
                                <td>1억원</td>
                                <td>수시</td>
                            </tr>
                            <tr>
                                <td>고도화</td>
                                <td>스마트공장 기구축 기업 대상, 스마트공장 고도화 지원</td>
                                <td>(기초) 1억원<br>
                                    (중간1이상) 1.5억원</td>
                                <td>수시</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h4>신청자격</h4>
                        <div class="content">
                            <p>국내 중소⋅중견 제조기업</p>
                            <p> * ｢독점규제 및 공정거래에 관한 법률｣ 제14조제1항에 따른 상호출자제한기업 집단에 속하는 기업(대기업)은 제외</p>
                            <p> * 정부 또는 민간(대기업 등) 지원을 통해 스마트공장을 기구축한 기업은 제외(기 구축 기업은 생산현장디지털화 사업에 참여 가능)</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h4>지원절차</h4>

                </div>
            </div>
        </div>
        <div class="row justify-content-center text-center">
            <div class="text-center article-title">
                <h1>
                    <img src="<c:url value='/'/>images/government2.png">
                </h1>
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

</body>
</html>
