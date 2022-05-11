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
    <title>온라인문의</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Construction Html5 Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">

<%--

    <link href="<c:url value='/'/>plugins/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
--%>



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
</head>

<body>
<%@include file="/WEB-INF/jsp/main/header.jsp" %>

<section id="main-container" class="main-container">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <%--@elvariable id="contactDetail" type="egovframework.let.cop.bbs.service.ContactVO"--%>
                <form:form modelAttribute="contactDetail" method="post" name="contactDetail" action="/cop/bbs/contactDelete.do">
                    <input type="hidden" name="contactUniqId" value="<c:out value='${contactDetail.contactUniqId}'/>">
                    <input type="hidden" name="contactDate" value="<c:out value='${contactDetail.contactDate}'/>">
                    <input type="hidden" name="contactTitle" value="<c:out value='${contactDetail.contactTitle}'/>">
                    <input type="hidden" name="contactName" value="<c:out value='${contactDetail.contactName}'/>">
                    <input type="hidden" name="contactEmail" value="<c:out value='${contactDetail.contactEmail}'/>">
                    <input type="hidden" name="contactPhone" value="<c:out value='${contactDetail.contactPhone}'/>">
                    <input type="hidden" name="contactContents" value="<c:out value='${contactDetail.contactContents}'/>">
                    <div class="mail-box-header">
                        <div class="pull-right tooltip-demo">
<%--

                            <a href="#" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Print email"><i class="fa fa-print"></i> </a>
--%>

<%--
                            <a href="mail_compose.html" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Reply"><i class="fa fa-edit"></i> Edit</a>
--%>
                            <button class="btn btn-white btn-sm demo3" id="demo3" name="demo3" type="button" onclick="javascript:fn_delete_contact(<c:out value='${contactDetail.contactUniqId}'/>);" data-toggle="tooltip" data-placement="top" title="Move to trash"><i class="fa fa-trash-o demo3">Remove</i></button>

<%--
                            <a href="<c:url value='/'/>cop/bbs/contactDelete.do" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Move to trash"><i class="fa fa-trash-o"></i> </a>
--%>
                        </div>
                        <h5>
                            온라인문의
                        </h5>
                        <div class="mail-tools tooltip-demo m-t-md">
                            <h3>
                                <span class="font-noraml"><c:out value="${contactDetail.contactTitle}"/></span>
                            </h3>
                            <h5>
                                <span class="pull-right font-noraml"><c:out value="${contactDetail.contactDate}"/></span>
                                <span class="font-noraml">이름  <c:out value="${contactDetail.contactName}"/></span><br>
                                <span class="font-noraml">이메일  <c:out value="${contactDetail.contactEmail}"/></span><br>
                                <span class="font-noraml">전화번호 <c:out value="${contactDetail.contactPhone}"/> </span>
                            </h5>
                        </div>
                    </div>
                    <div class="mail-box">
                        <div class="mail-body">
                            <c:out value="${contactDetail.contactContents}"/>
                        </div>
                        <div class="mail-body text-right tooltip-demo">
                            <a class="btn btn-sm btn-white" href="javascript:history.back();"><i class="fa fa-reply"></i> Back to List</a>
                                <%--
                            <a class="btn btn-sm btn-white" href="mail_compose.html"><i class="fa fa-arrow-right"></i> Forward</a>
                            <button title="" data-placement="top" data-toggle="tooltip" type="button" data-original-title="Print" class="btn btn-sm btn-white "><i class="fa fa-print"></i> Print</button>--%>
                            <button title="" data-placement="top" type="button" data-toggle="tooltip" data-original-title="Trash" class="btn btn-sm btn-white demo3" onclick="javascript:fn_delete_contact(<c:out value='${contactDetail.contactUniqId}'/>);"><i class="fa fa-trash-o"></i> Remove</button>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</section>

<%@include file="/WEB-INF/jsp/main/footer.jsp" %>
<script>



    function fn_delete_contact(contactUniqId) {
        swal({
            title: "삭제하시겠습니까?",
            text: "삭제후 복구불가",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "삭제",
            closeOnConfirm: false
        }, function (){
            swal("", "삭제되었습니다.", "success");
            setTimeout(function (){
                document.contactDetail.contactUniqId.value = contactUniqId;
                document.contactDetail.action = "<c:url value='/cop/bbs/contactDelete.do' />";
                document.contactDetail.submit();
            },2000);
        });
    }


</script>

<!-- Mainly scripts -->
<script src="<c:url value='/'/>js/jquery-2.1.1.js"></script>
<script src="<c:url value='/'/>js/bootstrap.min.js"></script>
<script src="<c:url value='/'/>js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<c:url value='/'/>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="<c:url value='/'/>js/inspinia.js"></script>
<script src="<c:url value='/'/>js/plugins/pace/pace.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Peity -->
<script src="<c:url value='/'/>js/plugins/peity/jquery.peity.min.js"></script>
<!-- Peity demo -->
<script src="<c:url value='/'/>js/demo/peity-demo.js"></script>
<script src="<c:url value='/'/>js/vendors.bundle.js"></script>
<!-- Sweet alert -->
<script src="<c:url value='/'/>js/plugins/sweetalert/sweetalert.min.js"></script>
</body>
</html>
