<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 01cli
  Date: 2022-04-18
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>협력업체 작성 | 지성소프트</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Construction Html5 Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">

    <!-- Favicon
  ================================================== -->
    <link rel="icon" type="image/png" href="images/favicon.png">

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
    <link href="<c:url value='/'/>src/sweetalert.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="<c:url value='/'/>css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

</head>
<body>
<%@include file="/WEB-INF/jsp/main/header.jsp" %>
<section id="main-container" class="main-container">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="column-title">구축사례 수정</h3>

                <%--@elvariable id="board" type="egovframework.let.cop.bbs.service.BoardVO"--%>
                <form:form modelAttribute="board" name="board" method="post" enctype="multipart/form-data"  >
                    <%--<form action="<c:url value='/'/>cop/bbs/historyRegist.do" method="post" name="boardForm">--%>

                    <c:if test="${not empty result.atchFileId}">
                            <input type="hidden" name="returnUrl" value="/cop/bbs/forUpdateHistory.do"/>

                            <table>
                                <tr>
                                    <th height="23"><spring:message code="cop.atchFileList" /></th>
                                    <td colspan="3">
                                        <c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
                                            <c:param name="param_atchFileId" value="${result.atchFileId}" />
                                        </c:import>
                                    </td>
                                </tr>
                            </table>
                    </c:if>
                    <div class="error-container"></div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>회사명</label>
                                <form:input path="nttSj" cssClass="form-control form-control-text" value="${result.nttSj}" />
                                    <%--<input name="nttSj" value="${nttSj}" type="text" class="form-control form-control-text">--%>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>홈페이지</label>
                                <form:input path="homepage" cssClass="form-control form-control-text" value="${result.homepage}" />
                                    <%--<input name="homepage" value="${homepage}" type="text" class="form-control form-control-text">--%>
                            </div>
                        </div>
                        <table class="col-md-4">
                            <tr>
                                <th height="23"><label for="egovComFileUploader"><spring:message code="cop.atchFile" /></label></th>
                                <td colspan="3">
                                    <input name="file_1" id="egovComFileUploader" type="file" />
                                    <div id="egovComFileList"></div>
                                </td>
                            </tr>
                        </table>

                    </div>

                    <div class="form-group">
                        <label>내용</label>
                        <textarea name="nttCn" rows="10" class="form-control form-control-message"><c:out value="${result.nttCn}" escapeXml="false" default="${result.nttCn}"/></textarea>                            <%--<textarea name="nttCn" value="${nttCn}" rows="10" class="form-control form-control-message" ></textarea>--%>
                    </div>


                    <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
                    <input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
                    <input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
                    <input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
                    <input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
                    <input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
                    <input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
                    <input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
                    <input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
                    <input type="hidden" name="ntcrNm" value="<c:out value='${result.ntcrNm}'/>" />
                    

                    <div class="text-right"><br>
                        <button class="btn btn-primary solid blank" type="button" name="submitHis" id="submitHis" data-target="add"
                                onclick="javascript:updateHistory();"> 수정완료</button>
                    </div>

                </form:form>


            </div>
        </div>
    </div>
</section>


<%@include file="/WEB-INF/jsp/main/footer.jsp" %>

<script type="text/javascript">


/*
    var maxFileNum = document.board.posblAtchFileNumber.value;
    if(maxFileNum==null || maxFileNum==""){
        maxFileNum = 3;
    }
    var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
    multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
*/
    async function updateHistory() {

        var data = $("#submitHis").data('target');


        if (document.board.nttSj.value == "") {
            swal({
                title: "",
                text: "제목을 입력하세요."
            });
            return false;
        } else if (document.board.nttCn.value == "") {
            swal({
                title: "",
                text: "내용을 입력하세요."
            });
            return false;
        } else if (data == 'add') {

            await swal({
                title: "완료",
                text: "수정이 완료되었습니다.",
                type: "success"
            });
            $(".confirm").click(function () {
                document.board.action = "<c:url value='/cop/bbs/UpdateHistory.do' />";
                document.board.submit();
            });

        }

    }
    function fn_egov_check_file(flag) {
        if (flag=="Y") {
            document.getElementById('file_upload_posbl').style.display = "block";
            document.getElementById('file_upload_imposbl').style.display = "none";
        } else {
            document.getElementById('file_upload_posbl').style.display = "none";
            document.getElementById('file_upload_imposbl').style.display = "block";
        }
    }
var existFileNum = document.board.fileListCnt.value;
    var maxFileNum = document.board.posblAtchFileNumber.value;

    if (existFileNum=="undefined" || existFileNum ==null) {
        existFileNum = 0;
    }
    if (maxFileNum=="undefined" || maxFileNum ==null) {
        maxFileNum = 0;
    }
    var uploadableFileNum = maxFileNum - existFileNum;
    if (uploadableFileNum<0) {
        uploadableFileNum = 0;
    }
    if (uploadableFileNum != 0) {
        fn_egov_check_file('Y');
        var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), uploadableFileNum );
        multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
    } else {
        fn_egov_check_file('N');
    }

</script>

<!-- Mainly scripts -->
<script src= " <c:url value='/' />js/jquery-2.1.1.js" ></script>
<script src="<c:url value='/'/>js/bootstrap.min.js"></script>
<script src="<c:url value='/'/>js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<c:url value='/'/>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="<c:url value='/'/>js/inspinia.js"></script>
<script src="<c:url value='/'/>js/plugins/pace/pace.min.js"></script>

<!-- Jasny -->
<script src="<c:url value='/'/>js/plugins/jasny/jasny-bootstrap.min.js"></script>

<!-- DROPZONE -->
<script src="<c:url value='/'/>js/plugins/dropzone/dropzone.js"></script>

<!-- CodeMirror -->
<script src="<c:url value='/'/>js/plugins/codemirror/codemirror.js"></script>
<script src="<c:url value='/'/>js/plugins/codemirror/mode/xml/xml.js"></script>
<script type="text/javascript" src="<c:url value='/'/>js/egovframework/cmm/fms/EgovMultiFile.js" ></script>

<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>

<!-- Sweet alert -->
<script src="<c:url value='/'/>js/plugins/sweetalert/sweetalert.min.js"></script>

</body>
</html>
