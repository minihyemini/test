<%--
  Created by IntelliJ IDEA.
  User: 01cli
  Date: 2022-04-18
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<html>
<head>
    <title>구축사례 | 지성소프트</title>


    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Construction Html5 Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">

    <link href="<c:url value='/'/>css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/'/>plugins/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/fontawesome/css/all.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/animate-css/animate.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick-theme.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css" >


    <link href="<c:url value='/'/>css/animate.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/style2.css" rel="stylesheet">
    <link href="<c:url value='/'/>constra/css/style.css" rel="stylesheet" type="text/css" >

    <!-- Sweet Alert -->
    <link href="<c:url value='/'/>css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="<c:url value='/'/>font-awesome/css/font-awesome.css" rel="stylesheet">

    <style>
        .btnn-custom {
            color: inherit;
            background: white;
            border: 1px solid #e7eaec;
        }

        .product-imitation table > tbody > tr > td {
            height: 328px;
        }

        .product-imitation table > tbody > tr > td > img {
            object-fit:cover;
            max-width: 100%;

        }

        .product-box
        {


        }

        .product-desc
        {
            height: 170px;
        }
        .product-box
        {

        }

         .pagination > li > strong , .pagination > li > span {
             /* background-color: #FFFFFF;*/
             background: #ffb600;
             border: 1px solid #DDDDDD;
             color: inherit;
             float: left;
             line-height: 1.42857;
             margin-left: -1px;
             margin-right: 10px;
             padding: 4px 10px;
             position: relative;
             text-decoration: none;

    </style>

</head>
<body>
<script>
    function boardInfo(bbsId){
        document.board.bbsId.value = bbsId;
        document.board.action = "<c:url value='/cop/bbs/historyWrite.do'/>";
        document.board.submit();
    }
</script>
<!-- Header start -->
<%@include file="/WEB-INF/jsp/main/header.jsp" %>

<section id="main-container" class="main-container">
    <div class="container">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-md-6 pull-left ">
                    <%
                        if(loginVO != null){
                    %>
                    <%--@elvariable id="board" type="egovframework.let.cop.bbs.service.Board"--%>
                    <form name="board" action="/cop/bbs/historyWrite.do" method="post">
                        <input type="hidden" name="bbsId" value="${bbsId}" />
                        <button type="button" class="btn btn-outline btn-default"
                                onclick="javascript:boardInfo(${bbsId})">write</button>
                    </form>
                    <% } %>

                </div>
                <div class="col-md-6 pull-right ">
                    <form name="frm" action ="<c:url value='/cop/bbs/history.do'/>" method="post">
                        <input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
                        <input type="hidden" name="nttId"  value="0" />
                        <input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
                        <input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
                        <input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
                        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
                        <input type="submit" value="실행" onclick="fn_egov_select_noticeList('1'); return false;" id="invisible" class="invisible" />

                        <fieldset>
                            <button type="button" class="btn btn-outline btn-default pull-right" style="margin: 30px 0 0 0;" onclick="javascript:fn_egov_select_noticeList('1'); return false;" >검색</button>
                            <input type="text" name="searchWrd" value='<c:out value="${searchVO.searchWrd}"/>' class="form-control col-md-4 pull-right" style="margin: 20px;">
                        </fieldset>
                    </form>

                </div>

            </div>


            <div class="row">



                <c:forEach items="${resultList}" varStatus="status" var="resultList">


                    <div class="col-md-3">
                        <div class="ibox">
                            <div class="ibox-content product-box">
                                <div class="product-imitation" style="padding: 0px;">
                                    <c:import url="/cmm/fms/selectImageFileInfs.do" charEncoding="utf-8">
                                        <c:param name="atchFileId" value="${resultList.atchFileId}" />
                                    </c:import>
                                </div>
                                <div class="product-desc">
                                    <a href="#" class="product-name"> ${resultList.nttSj}</a>
                                    <div class="small m-t-xs">
                                                ${resultList.nttCn}
                                    </div>
                                    <div class="m-t text-righ">
                                        <a href="${resultList.homepage}">
                                            <button type="button" value="홈페이지" class="btnn-custom"
                                                    onclick="location.href='<c:url value='${resultList.homepage}'/>'" >홈페이지</button>
                                        </a>

                                            <%
                                                /* LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");*/
                                                if(loginVO == null){
                                            %>
                                            <% }else { %>

                                            <div class="pull-right tooltip-demo">
                                                <form name="articleForm" action="/cop/bbs/forUpdateHistory.do" method="post" style="float:left;">

                                                    <input name="nttId" type="hidden" value="<c:out value="${resultList.nttId}" />" />
                                                    <input name="bbsId" type="hidden" value="BBSMSTR_DDDDDDDDDDDD" />
                                                    <input type="hidden" name="parnts" value="<c:out value='${resultList.parnts}'/>" >
                                                    <input type="hidden" name="sortOrdr" value="<c:out value='${resultList.sortOrdr}'/>" >
                                                    <input type="hidden" name="replyLc" value="<c:out value='${resultList.replyLc}'/>" >
                                                    <input name="ntcrNm" type="hidden" value="<c:out value="${resultList.ntcrNm}" />">
                                                    <button type="button" class="btn btn-white btn-sm" onclick="javascript:fn_update_history(this.form);"><i class="fa fa-edit"></i></button><!-- 수정 -->
                                                </form>

                                                <form name="formDelete" action="<c:url value='/cop/bbs/historyDelete.do'/>" method="post" style="float:left; margin:0 0 0 3px;">

                                                        <input name="nttId" type="hidden" value="<c:out value="${resultList.nttId}" />" />
                                                        <input name="bbsId" type="hidden" value="BBSMSTR_DDDDDDDDDDDD" />
                                                        <button type="button" class="btn btn-danger" title="Move to trash" onclick="fn_egov_delete_article(this.form); return false;" ><i class="fa fa-trash-o"></i></button><!-- 삭제 -->
<%--
                                            <button type="button" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Move to trash"  onclick="fn_delete_history();"><i class="fa fa-trash-o"></i></button>
--%>
                                                </form>

                                            </div>



                                                        <% } %>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:forEach>


                <table class="table">
                    <tr>
                        <td colspan="5" class="footable-visible" >
                            <ul class="pagination pull-right">
                                <li class="footable-page">
                                    <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_historyList" />
                                </li>

                            </ul>
                        </td>
                    </tr>
                </table>

                <%--<div class="col-md-3">
                    <div class="ibox">
                        <div class="ibox-content product-box">

                            <div class="product-imitation" style="padding: 0px;">
                                <img class="img-fluid" src="<c:url value='/'/>logo-images/jisungfood.png" style=" object-fit:cover;">

                            </div>
                            <div class="product-desc">
&lt;%&ndash;
                                <small class="text-muted">Category</small>
&ndash;%&gt;
                                <a href="#" class="product-name"> 지성식품</a>



                                <div class="small m-t-xs">
                                    <br />식품제조가공, 농산물 가공품 수출.입
                                    <br />
                                </div>
                                <div class="m-t text-righ">

                                    <button type="button" value="홈페이지" class="btnn-custom" onclick="location.href='http://jisungfood.kr/';" >홈페이지</button>
                                    &lt;%&ndash;<a href="#" class="btn btn-xs btn-outline btn-primary">홈페이지 <i class="fa fa-long-arrow-right"></i> </a>&ndash;%&gt;
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="ibox">
                        <div class="ibox-content product-box">

                            <div class="product-imitation" style="padding:0px; object-fit:contain">
                                <img class="img-fluid" src="<c:url value='/'/>logo-images/koreacns.jpg" style=" object-fit:cover;" />

                            </div>

                            <div class="product-desc">
&lt;%&ndash;
                                <small class="text-muted">Category</small>
&ndash;%&gt;
                                <a href="#" class="product-name"> 한국씨엔에스</a>



                                <div class="small m-t-xs">
                                    합성고무제조업/특수윤활유,산업용윤활유첨가제/탈취제
                                </div>
                                <div class="m-t text-righ">
                                    <button type="button" value="홈페이지" class="btnn-custom" onclick="location.href='http://www.hankookcs.com/';" >홈페이지</button>
&lt;%&ndash;
                                    <a href="#" class="btn btn-xs btn-outline btn-primary">홈페이지 <i class="fa fa-long-arrow-right"></i> </a>
&ndash;%&gt;
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="ibox">
                        <div class="ibox-content product-box">

                            <div class="product-imitation" style="padding: 0px;">
                                <img class="img-fluid" src="<c:url value='/'/>logo-images/ildongimc.png" style=" object-fit:cover;">

                            </div>
                            <div class="product-desc">
&lt;%&ndash;
                                <small class="text-muted">Category</small>
&ndash;%&gt;
                                <a href="#" class="product-name"> 일동아이엠씨</a>



                                <div class="small m-t-xs">
                                    선별산업기계.설비제작,위생용종이제품 수출
                                </div>
                                <div class="m-t text-righ">
                                    <button type="button" value="홈페이지" class="btnn-custom" onclick="location.href='#';" >홈페이지</button>
                                    &lt;%&ndash;
                                                                        <a href="#" class="btn btn-xs btn-outline btn-primary">홈페이지 <i class="fa fa-long-arrow-right"></i> </a>
                                    &ndash;%&gt;
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="ibox">
                        <div class="ibox-content product-box">

                            <div class="product-imitation" style="padding: 0px;">
                                <img class="img-fluid" src="<c:url value='/'/>logo-images/inhapul.png" style=" object-fit:cover;">

                            </div>
                            <div class="product-desc">
&lt;%&ndash;
                                <small class="text-muted">Category</small>
&ndash;%&gt;
                                <a href="#" class="product-name"> 인하풀로지</a>



                                <div class="small m-t-xs">
                                    <br>마스크제조 수입및 판매업체
                                    <br>
                                </div>
                                <div class="m-t text-righ">
                                    <button type="button" value="홈페이지" class="btnn-custom" onclick="location.href='http://www.inhapoologi.co.kr/';" >홈페이지</button>
                                    &lt;%&ndash;
                                                                        <a href="#" class="btn btn-xs btn-outline btn-primary">홈페이지 <i class="fa fa-long-arrow-right"></i> </a>
                                    &ndash;%&gt;
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>



        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-md-3">
                    <div class="ibox">
                        <div class="ibox-content product-box">

                            <div class="product-imitation" style="padding: 0px;">
                                <img class="img-fluid" src="<c:url value='/'/>logo-images/woojin5.jpg" style=" object-fit:cover;">

                            </div>
                            <div class="product-desc">
&lt;%&ndash;
                                <small class="text-muted">Category</small>
&ndash;%&gt;
                                <a href="#" class="product-name"> 우진테크</a>



                                <div class="small m-t-xs">
                                    산업용기계,태양광발전업 임대
                                </div>
                                <div class="m-t text-righ">
                                    <button type="button" value="홈페이지" class="btnn-custom" onclick="location.href='http://www.woojintech.kr/';" >홈페이지</button>
                                    &lt;%&ndash;
                                                                        <a href="#" class="btn btn-xs btn-outline btn-primary">홈페이지 <i class="fa fa-long-arrow-right"></i> </a>
                                    &ndash;%&gt;
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="ibox">
                        <div class="ibox-content product-box">

                            <div class="product-imitation" style="padding: 82px 0 82px 0 ;" >
                                <img class="img-fluid" src="<c:url value='/'/>logo-images/guddi.jpg" >

                            </div>
                            <div class="product-desc">
&lt;%&ndash;
                                <small class="text-muted">Category</small>
&ndash;%&gt;
                                <a href="#" class="product-name"> 구띠</a>



                                <div class="small m-t-xs">
                                    직물검사,원단검사,포장섬유
                                </div>
                                <div class="m-t text-righ">
                                    <button type="button" value="홈페이지" class="btnn-custom"onclick="location.href='http://www.kuti.co.kr/';">홈페이지</button>
                                    &lt;%&ndash;
                                                                        <a href="#" class="btn btn-xs btn-outline btn-primary">홈페이지 <i class="fa fa-long-arrow-right"></i> </a>
                                    &ndash;%&gt;
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="ibox">
                        <div class="ibox-content product-box">

                            <div class="product-imitation" style="padding: 65px 0 65px 0 ;">
                                <img class="img-fluid" src="<c:url value='/'/>logo-images/jisungsystem.png" style=" object-fit:cover;">

                            </div>
                            <div class="product-desc">
                                <a href="#" class="product-name"> 지성시스템</a>



                                <div class="small m-t-xs">
                                    컨트롤 PCB 개발 및 컨트롤 BOX 제작
                                </div>
                                <div class="m-t text-righ">
                                    <button type="button" value="홈페이지" class="btnn-custom" onclick="location.href='http://www.ji-sung.com/';" >홈페이지</button>
                                    &lt;%&ndash;
                                                                        <a href="#" class="btn btn-xs btn-outline btn-primary">홈페이지 <i class="fa fa-long-arrow-right"></i> </a>
                                    &ndash;%&gt;
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="ibox">
                        <div class="ibox-content product-box">

                            <div class="product-imitation" style="padding:  0 ;">
                                <img class="img-fluid" src="<c:url value='/'/>logo-images/dongbo.png" style=" object-fit:cover;">

                            </div>
                            <div class="product-desc">

                                <a href="#" class="product-name"> 동보산업</a>



                                <div class="small m-t-xs">
                                    농자재,과일봉지 제조
                                </div>
                                <div class="m-t text-righ">
                                    <button type="button" value="홈페이지" class="btnn-custom" onclick="location.href='http://과일봉투.kr/';" >홈페이지</button>
                                    &lt;%&ndash;
                                                                        <a href="#" class="btn btn-xs btn-outline btn-primary">홈페이지 <i class="fa fa-long-arrow-right"></i> </a>
                                    &ndash;%&gt;
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
--%>











    </div><!-- Conatiner end -->
</section><!-- Main container end -->



<%@include file="/WEB-INF/jsp/main/footer.jsp" %>
<script>

    function fn_egov_select_noticeList(pageNo) {
        document.frm.pageIndex.value = pageNo;
        document.frm.action = "<c:url value='/cop/bbs/history.do'/>";
        document.frm.submit();
    }

    function fn_egov_delete_article(form){
        if(confirm("<spring:message code="common.delete.msg" />")){
            // Delete하기 위한 키값을 셋팅
            form.submit();
        }
    }
    function fn_update_history(form)
    {
        form.action="<c:url value='/cop/bbs/forUpdateHistory.do' />"
        form.submit();
    }

    function fn_egov_select_historyList(pageNo) {
        document.board.pageIndex.value = pageNo;
        document.board.action = "<c:url value='/cop/bbs/history.do'/>";
        document.board.submit();
    }



    /*function fn_delete_history(){
        swal({
            title: "삭제하시겠습니까?",
            text: "삭제후 복구불가",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "삭제",
            closeOnConfirm: false
        }, function (){
            swal("","삭제되었습니다.","success");
            document.board.action="<c:url value='/cop/bbs/historyDelete.do' />";
            document.board.submit();

        });
    }*/

    function fn_delete_history(){
        swal({
            title: "삭제하시겠습니까?",
            text: "삭제후 복구불가",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "삭제",
            closeOnConfirm: false
        }, function(){
            swal("","삭제되었습니다", "success");
                document.board.action="<c:url value='/cop/bbs/historyDelete.do' /> ";
                document.board.submit();

        });

    }
</script>

    <!-- Mainly scripts -->
<script src="<c:url value='/'/>js/jquery-2.1.1.js"></script>
<script src="<c:url value='/'/>js/bootstrap.min.js"></script>
<script src="<c:url value='/'/>js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<c:url value='/'/>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="<c:url value='/'/>js/plugins/dataTables/datatables.min.js"></script>
<!-- Custom and plugin javascript -->
<script src="<c:url value='/'/>js/inspinia.js"></script>
<script src="<c:url value='/'/>js/plugins/pace/pace.min.js"></script>

<!-- initialize jQuery Library -->
<script src="<c:url value='/'/>plugins/jQuery/jquery.min.js"></script>
<!-- Bootstrap jQuery -->
<script src="<c:url value='/'/>plugins/bootstrap/bootstrap.min.js" defer></script>
<!-- Slick Carousel -->
<script src="<c:url value='/'/>plugins/slick/slick.min.js"></script>
<script src="<c:url value='/'/>plugins/slick/slick-animation.min.js"></script>
<!-- Color box -->
<script src="<c:url value='/'/>plugins/colorbox/jquery.colorbox.js"></script>
<!-- shuffle -->
<script src="<c:url value='/'/>plugins/shuffle/shuffle.min.js" defer></script>

<!-- Sweet alert -->
<script src="<c:url value='/'/>js/plugins/sweetalert/sweetalert.min.js"></script>

<!-- Google Map API Key-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU" defer></script>
<!-- Google Map Plugin-->
<script src="<c:url value='/'/>google-map/map.js" defer></script>

<!-- Template custom -->
<script src="<c:url value='/'/>js/script.js"></script>
<!--/ Header end -->

<%--

<!-- initialize jQuery Library -->
<script src="<c:url value='/'/>plugins/jQuery/jquery.min.js"></script>
<!-- Bootstrap jQuery -->
<script src="<c:url value='/'/>plugins/bootstrap/bootstrap.min.js" defer></script>
<!-- Slick Carousel -->
<script src="<c:url value='/'/>plugins/slick/slick.min.js"></script>
<script src="<c:url value='/'/>plugins/slick/slick-animation.min.js"></script>
<!-- Color box -->
<script src="<c:url value='/'/>plugins/colorbox/jquery.colorbox.js"></script>
<!-- shuffle -->
<script src="<c:url value='/'/>plugins/shuffle/shuffle.min.js" defer></script>


<!-- Google Map API Key-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU" defer></script>
<!-- Google Map Plugin-->
<script src="<c:url value='/'/>plugins/google-map/map.js" defer></script>

<!-- Template custom -->
<script src="<c:url value='/'/>js/script.js"></script>
--%>


</body>
</html>
