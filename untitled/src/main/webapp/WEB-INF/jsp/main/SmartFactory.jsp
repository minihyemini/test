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
    <link href="<c:url value='/'/>css/style.css" rel="stylesheet" type="text/css" >

</head>
<body>

    <%@include file="/WEB-INF/jsp/main/header.jsp" %>
    <section class="banner">
        <div class="container">
            <div class="row justify-content-center text-center">
                <div class="text-center article-title">
                    <h1>
                        스마트공장이란
                    </h1>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h4>개요</h4>
                        <div class="content">
                            <p>기획·설계 → 생산 → 유통·판매 등 전 과정을 IoT·AI·빅데이터등으로 통합하여 자동화·디지털화 구현하여 최소 비용·시간으로 고객맞춤형 제품 생산</p>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-bordered text-center">
                            <tr>
                                <th  class="text-center">기획·설계</th>
                                <td>제품 성능 시뮬레이션 → 제작기간 단축, 맞춤형 제품 개발</td>
                            </tr>
                            <tr>
                                <th  class="text-center">생산</th>
                                <td>설비-자재-시스템간 통신 → 다품종 대량생산, 에너지, 설비 효율 제고</td>
                            </tr>
                            <tr>
                                <th class="text-center">유통·판매</th>
                                <td>모기업-협력사간 실시간 연동 → 재고 비용 감소, 품질, 물류 등 全분야 협력</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h4>스마트 공장 수준별 단계</h4>

                    </div>

                        <table class="table table-bordered">
                            <thead>
                            <th class="text-center">단계</th>
                            <th colspan="2" class="text-center">단계별 내용</th>
                            </thead>
                            <tr>
                                <td>고도화</td>
                                <td>IoT·CPS 기반<br>
                                    맞춤형 유연생산</td>
                                <td>설비, 자재, 시스템 유무선 네트워크로 연결(loT/CPS) 스스로 판단하는 지능형 설비, 시스템을 통한 자율적공장운영 전 제조 과정의 통합 운영</td>
                            </tr>
                            <tr>
                                <td>중간수준2</td>
                                <td>IT·SW 기반<br>
                                    실시간 자율제어</td>
                                <td>관리 시스템을 통한 설비 자동 제어 ⇒ 실시간 생산 최적화 분야별 관리 시스템간 실시간 연동<br>
                                    개발 ↔ 생산 ↔ 자원관리</td>
                            </tr>
                            <tr>
                                <td>중간수준1</td>
                                <td>광범위한 생산정보<br>
                                    실시간 집계·모니터링</td>
                                <td>설비 정보 자동집계 ⇒ 실시간 공장 운영 모니터링, 품질분석 분야별 관리 시스템간 부분적 연계<br>
                                    ex) 기준정보·엔지니어링 정보 생성, 수주정보 ⇒ 생산계획</td>
                            </tr>
                            <tr>
                                <td>기초수준</td>
                                <td>생산이력 추적관리</td>
                                <td>생산실적 정보 자동집계 ⇒ 자재흐름 실시간 파악, Lot-tracking 부분적 관리 시스템 운영(설계, 영업, 재고, 회계 등)</td>
                            </tr>
                            <tr>
                                <td>ICT 미적용</td>
                                <td colspan="2" class="text-center">Excel 정도 활용, 시스템을 갖추고 있지 못한 상태</td>
                            </tr>
                        </table>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h4>적용범위</h4>
                        <p>스마트공장은 제품개발부터 양산까지, 시장 수요 예측 및 모기업의 주문에서 부터 완제품 출하까지의 모든 제조 관련 과정을 포함</p>
                        <img src="<c:url value='/'/>images/smartfactory.png">
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h4>구축효과</h4>
                        <p>스마트공장을 통하여 생산성개선, 매출증가, 비용절감 등의 효과를 볼 수 있습니다.</p>
                        <img src="<c:url value='/'/>images/effect.png">
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
