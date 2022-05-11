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
    <title>MES | 지성소프트</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Construction Html5 Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">

    <link href="<c:url value='/'/>css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/'/>constra/plugins/fontawesome/css/all.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>constra/plugins/animate-css/animate.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>constra/plugins/slick/slick.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>constra/plugins/slick/slick-theme.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>constra/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css" >

    <link href="<c:url value='/'/>css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="<c:url value='/'/>css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/animate.css" rel="stylesheet">
    <link href="<c:url value='/'/>constra/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">


    <link href="<c:url value='/'/>font-awesome/css/font-awesome.css" rel="stylesheet">


    <link href="<c:url value='/'/>css/style2.css" rel="stylesheet">

    <link href="<c:url value='/'/>css/style.css" rel="stylesheet" >
    <link href="<c:url value='/'/>constra/css/style.css" rel="stylesheet">
    <%--<link href="<c:url value='/'/>plugins/fontawesome/css/all.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/animate-css/animate.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick-theme.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css" >

    <link href="<c:url value='/'/>plugins/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >

    <link href="<c:url value='/'/>css/animate.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/style2.css" rel="stylesheet">
    <link href="<c:url value='/'/>constra/css/style.css" rel="stylesheet" type="text/css" >--%>

<%--
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
    <link href="<c:url value='/'/>css/style.css" rel="stylesheet" type="text/css" >--%>
</head>
<body>
<%@include file="/WEB-INF/jsp/main/header.jsp" %>
<section class="banner">
    <div class="container">
        <div class="row justify-content-center text-center">
            <div class="text-center article-title">
                <h1>
                    MES(제조실행시스템)
                </h1>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h4>MES란? (MES : Manufacturing Execution System)</h4>
                    <div class="content">
                        <p>MES는 입고부터 납품까지의 전 생산활동을 전사적으로 관리/통제하는 제조실행시스템입니다.</p>
                        <p>제품을 생산하는 현장에서 시시각각 발생하는 생산정보를 4M(자재, 설비, 작업방법, 작업자)을 통해 직간접적으로 수집 및 집계하고, 실시간으로 정보를 처리함으로써 현장 작업자에서 경영층에 이르기까지 생산현장의 실시간 정보를 공유할 수 있는 시스템 환경을 제공합니다.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox-title">
                    <h4>ERP (Enterprise Resource Planning) 전사적 자원관리 (기업전반의 업무 프로세스)</h4>
                </div>
                <div class="ibox-content">
                    <table class="table table-bordered">
                        <thead class="text-center">
                        <th class="text-center">시스템/기준정보</th>
                        <th class="text-center">자재/외주관리</th>
                        <th class="text-center">생산관리</th>
                        <th class="text-center">품질관리</th>
                        <th class="text-center">영업관리</th>
                        <th class="text-center">금형관리</th>
                        </thead>
                        <tr>
                            <td>
                                <ul>
                                    <li>권한체크</li>
                                    <li>사용자관리</li>
                                    <li>권한관리</li>
                                    <li>환경설정</li>
                                    <li>코드관리</li>
                                    <li>실적수집정보관리</li>
                                    <li>품목코드</li>
                                    <li>거래처코드</li>
                                    <li>BOM</li>
                                    <li>문서관리</li>
                                    <li>단가관리</li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li>발주관리</li>
                                    <li>입하/입고내역조회</li>
                                    <li>출고내역조회</li>
                                    <li>매입관리</li>
                                    <li>매입현황</li>
                                    <li>자재재고현황</li>
                                    <li>자재입고금액조회</li>
                                    <li>시점재고조회</li>
                                    <li>외주 입출고내역조회</li>
                                    <li>외주재고관리</li>
                                    <li>외주입출금액조회</li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li>작업지시관리</li>
                                    <li>생산실적현황</li>
                                    <li>일별,월별 생산현황</li>
                                    <li>지시대비실적</li>
                                    <li>가동/비가동현황</li>
                                    <li>불량현황</li>
                                    <li>LOT이력조회</li>
                                    <li>재공재고조회</li>
                                    <li>바코드출력내역조회</li>
                                    <li>RAW DATA 조회</li>
                                    <li>투입공수현황</li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li>SPEC등록</li>
                                    <li>검사내역등록</li>
                                    <li>X-BAR R 관리도</li>
                                    <li>수입검사내역조회</li>
                                    <li>출하검사내역조회</li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li>수주등록</li>
                                    <li>제품출고내역조회</li>
                                    <li>제품재고현황</li>
                                    <li>수주대비진행현황</li>
                                    <li>제품출고금액조회</li>
                                    <li>매출관리</li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li>금형마스터등록</li>
                                    <li>금형타입별품번등록</li>
                                    <li>금형등록</li>
                                    <li>금형수리(연마)내역</li>
                                    <li>금형타발수조회</li>
                                    <li>금형검사기준(SPEC)</li>
                                    <li>금형검사데이타</li>
                                    <li>금형SET구성</li>
                                    <li>금형수리(연마)등록</li>
                                </ul>
                            </td>
                        </tr>
                        <thead class="text-center">
                        <th class="text-center">설비관리</th>
                        <th class="text-center">경영정보</th>
                        <th class="text-center">생산공정관리</th>
                        <th class="text-center">자동실적수집</th>
                        <th class="text-center">스마트폰</th>
                        <th class="text-center">SCM</th>
                        </thead>
                        <tr>
                            <td>
                                <ul>
                                    <li>설비등록</li>
                                    <li>수리내역관리</li>
                                    <li>S/P관리</li>
                                    <li>체크시트관리</li>
                                    <li>설비관리(현장용)</li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li>실적현황모니터링</li>
                                    <li>월별매입현황</li>
                                    <li>주간생산계획</li>
                                    <li>납품계획</li>
                                    <li>납품배차계획</li>
                                    <li>공정간재고현황</li>
                                    <li>재고추이</li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li>기능선택</li>
                                    <li>로그인</li>
                                    <li>생산실적처리</li>
                                    <li>LOT추적관리</li>
                                    <li>현장물류관리</li>
                                    <ul>
                                        <li>입하등록</li>
                                        <li>출고등록</li>
                                        <li>재고관리</li>
                                    </ul>
                                    <li>검사</li>
                                    <li>가동현황조회</li>
                                    <li>로케이션관리</li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li>생산실적수집</li>
                                    <ul>
                                        <li>생산실적수집</li>
                                        <li>작업조건수집</li>
                                    </ul>
                                </ul>
                            </td>
                            <td>
                                <li>모니터링</li>
                                <li>출고관리</li>
                            </td>
                            <td>
                                <li>로그인</li>
                                <li>발주내역조회</li>
                                <li>외주라벨발행</li>
                                <li>외주라벨재발행</li>
                                <li>외주거래명세서발행</li>
                                <li>반입증출력</li>
                                <li>재고내역조회</li>
                                <li>납품내역조회</li>
                                <li>LOT이력조회</li>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox-content">
                    <table class="table table-bordered text-center">
                        <thead>
                        <th colspan="8" class="text-center">생산현장 실시간 데이터 수집</th>
                        </thead>
                        <tr>
                            <td>작업지시</td>
                            <td>자재투입</td>
                            <td>공정진척</td>
                            <td>설비상태</td>
                            <td>재공실적</td>
                            <td>생산실적</td>
                            <td>불량내역</td>
                            <td>출하실적</td>
                        </tr>
                    </table>
                    <table class="table table-bordered text-center">
                        <tr>
                            <td>RFID</td>
                            <td>PDA</td>
                            <td>바코드</td>
                            <td>PLC</td>
                            <td>터치스크린</td>
                            <td>작업자입력</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox-title">
                    <h4>특징 및 장점</h4>
                    <div class="ibox-content">
                        <div class="col-lg-4">
                            <table class="table table-bordered">
                                <thead>
                                <th class="text-center" >제조 경쟁력 확보</th>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <ul>
                                            <li>오작업이나 불량감소 등 품질개선</li>
                                            <li>생산활동에 대한 실시간 추적 및 관리</li>
                                            <li>생산계획 배포방법 및 수입체계 확립</li>
                                            <li>비용절감 치 제품원가정보 수집가능</li>
                                        </ul>
                                    </td>

                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-lg-4">
                            <table class="table table-bordered">
                                <thead>
                                <th class="text-center">업무표준화로 관리수준 향상</th>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <ul>
                                            <li>업무프로세스 정립</li>
                                            <li>기준정보 관리체계정립(ERP연계)</li>
                                            <li>정확한 작업지시 및 생산체계 확립</li>
                                            <li>생산공정과 기능개선 유도</li>
                                        </ul>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-lg-4">
                            <table class="table table-bordered">
                                <thead>
                                <th class="text-center">신속 유연한 현장대응</th>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <ul>
                                            <li>현장에서 발생하는 최신정보를 제공</li>
                                            <li>공정별 재고보유량 및 상세재고파악</li>
                                            <li>설비가동, 비가동, 고장정보 등 설비관리</li>
                                            <li>실시간 공정모니터링 통한 긴급오더</li>
                                        </ul>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="ibox-title">
                    <h4>ERP & MES</h4>
                    <div class="ibox-content">
                        <div class="col-lg-4">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row justify-content-center text-center">
            <div class="text-center article-title">
                <h1>
                    <img src="<c:url value='/'/>images/erpmes.png">
                </h1>
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

</body>
</html>
