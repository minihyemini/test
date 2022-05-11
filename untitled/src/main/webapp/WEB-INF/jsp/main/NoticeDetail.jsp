<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring-commons-validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%--
  Created by IntelliJ IDEA.
  User: 01cli
  Date: 2022-04-18
  Time: 오후 1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공지사항</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Construction Html5 Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">


<%--
    <link href="<c:url value='/'/>plugins/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/'/>plugins/fontawesome/css/all.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/animate-css/animate.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick-theme.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/style2.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/style.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>constra/css/style.css" rel="stylesheet" >
    <link href="<c:url value='/'/>css/animate.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="<c:url value='/'/>css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
--%>

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

</head>

<body>
<%@include file="/WEB-INF/jsp/main/header.jsp" %>

<section id="main-container" class="main-container">
    <div class="container">
        <div class="row">
            <%--<h4>공지사항</h4>--%>
            <div class="col-md-12">
                <form name="noticeResult" method="post" action="/cop/bbs/noticeDelete.do">
                    <input type="hidden" name="bbsId" value="<c:out value="${noticeResult.bbsId}"/>"/>
                    <input type="hidden" name="nttId" value="<c:out value="${noticeResult.nttId}"/>"/>

                <div class="mail-box-header">
                    <div class="pull-right tooltip-demo">
                        <%
                            /* LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");*/
                            if(loginVO == null){
                        %>
                        <% }else { %>
                        <form name="articleForm" action="cop/bbs/forUpdateBoardArticle.do" method="post" style="float:left;">


                            <input type="hidden" name="parnts" value="<c:out value='${noticeResult.parnts}'/>" >
                            <input type="hidden" name="sortOrdr" value="<c:out value='${noticeResult.sortOrdr}'/>" >
                            <input type="hidden" name="replyLc" value="<c:out value='${noticeResult.replyLc}'/>" >
                            <input type="hidden" name="nttSj" value="<c:out value='${noticeResult.nttSj}'/>" >
                            <input name="nttId" type="hidden" value="<c:out value="${noticeResult.nttId}" />">
                            <input name="ntcrNm" type="hidden" value="<c:out value="${noticeResult.ntcrNm}" />">
                            <%--<input name="bbsId" type="hidden" value="<c:out value="${brdMstrVO.bbsId}" />">--%>
                            <button type="button" class="btn btn-white btn-sm" onclick="javascript:fn_update_notice();"><i class="fa fa-edit"></i> Edit</button><!-- 수정 -->
                        </form>
<%--
                            <a href="#" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Reply"><i class="fa fa-edit"></i> Edit</a>
--%>



                        <button type="button" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Move to trash"  onclick="fn_delete_notice()"><i class="fa fa-trash-o"></i>Remove</button>
<%--
                            <a href="mailbox.html" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Move to trash" onclick="fn_delete_notice(<c:out value='${noticeResult.bbsId}'/>,<c:out value='${noticeResult.nttId}'/>)"><i class="fa fa-trash-o"></i> </a>
--%>
                        <% } %>
                    </div>
                    <h4>
                        공지사항
                    </h4>
                    <div class="mail-tools tooltip-demo m-t-md">
                        <h3>
                            <span class="font-noraml"></span><c:out value="${noticeResult.nttSj}"/>
                        </h3>
                        <h5>
                            <span class="pull-right font-noraml"><c:out value="${noticeResult.ntcrNm}"/></span>
                            <span class="font-noraml"><c:out value="${noticeResult.frstRegisterPnttm}"/></span>
                        </h5>
                    </div>
                </div>
                <div class="mail-box">
                    <div class="mail-body">
                        <c:out value="${noticeResult.nttCn}"/>
                    </div>

                    <div class="mail-body text-right tooltip-demo">
                        <a class="btn btn-sm btn-white" href="javascript:history.back();"><i class="fa fa-reply"></i> Back to List</a>
                        <%--<a class="btn btn-sm btn-white" href="mail_compose.html"><i class="fa fa-arrow-right"></i> Forward</a>--%>


                        <%
                            /* LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");*/
                            if(loginVO == null){
                        %>
                        <% }else { %>
                        <button title="" type="button"  onclick="javascript:fn_delete_notice();" data-placement="top" data-toggle="tooltip" data-original-title="Trash" class="btn btn-sm btn-white"><i class="fa fa-trash-o"></i> Remove</button>

                    <%--
                        <button title="" type="button"  onclick="javascript:fn_delete_notice(<c:out value='${noticeResult.bbsId}'/>,<c:out value='${noticeResult.nttId}'/>);" data-placement="top" data-toggle="tooltip" data-original-title="Trash" class="btn btn-sm btn-white"><i class="fa fa-trash-o"></i> Remove</button>
--%>
                        <% } %>








<%--
                        <button title="" type="button"  onclick="javascript:fn_delete_notice(<c:out value='${noticeResult.bbsId}'/>,<c:out value='${noticeResult.nttId}'/>);" data-placement="top" data-toggle="tooltip" data-original-title="Trash" class="btn btn-sm btn-white"><i class="fa fa-trash-o"></i> Remove</button>
--%>
                    </div>
                    <div class="clearfix"></div>
                </div>
                </form>
            </div>
        </div>
    </div>
</section>

<%@include file="/WEB-INF/jsp/main/footer.jsp" %>
<script>

    /*function fn_delete_notice() {

        if(!confirm('삭제하시겠습니까?')){
            return false;
        }else {

            document.noticeResult.action = "<c:url value='/cop/bbs/noticeDelete.do' />";
            document.noticeResult.submit();
            alert('삭제되었습니다.');
        }

    }*/

    function fn_update_notice()
    {
        document.noticeResult.action="<c:url value='/cop/bbs/forUpdateNotice.do' />"
        document.noticeResult.submit();
    }


    function fn_delete_notice(){
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
            setTimeout(function (){
                document.noticeResult.action="<c:url value='/cop/bbs/noticeDelete.do' />";
                document.noticeResult.submit();
            },2000);
        });
    }




/*    function fn_delete_notice(bbsId,nttId) {


        if(!confirm('삭제하시겠습니까?')){
            return false;
        }else {

            document.noticeResult.bbsId.value = bbsId;
            document.noticeResult.nttId.value = nttId;
            document.noticeResult.action = "<c:url value='/cop/bbs/noticeDelete.do' />";
            document.noticeResult.submit();
            alert('삭제되었습니다.');
        }

    }*/
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
<!-- Sweet alert -->
<script src="<c:url value='/'/>js/plugins/sweetalert/sweetalert.min.js"></script>



    </body>
    </html>
