<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring-commons-validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%--
  Created by IntelliJ IDEA.
  User: 01cli
  Date: 2022-04-15
  Time: 오후 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>공지사항</title>



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



    <link href="<c:url value='/'/>font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/animate.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/style2.css" rel="stylesheet">
    <link href="<c:url value='/'/>constra/css/style.css" rel="stylesheet" type="text/css" >

<%--
    <link href="<c:url value='/'/>plugins/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/fontawesome/css/all.min.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/animate-css/animate.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/slick/slick-theme.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/'/>font-awesome/css/font-awesome.css" rel="stylesheet">


    <link href="<c:url value='/'/>css/animate.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/style2.css" rel="stylesheet">
    <link href="<c:url value='/'/>css/style.css" rel="stylesheet" type="text/css" >
    <link href="<c:url value='/'/>constra/css/style.css" rel="stylesheet" type="text/css" >
--%>

    <style>
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
        }
        .pagination > .footable-page > li > a > image{
            visibility : hidden;
        }
        .pagination > ul > li > a
        {
            display: inline-block;
            line-height: 12px;
            padding-left: 15px;
        }

        .pagination > ul>li > a:hover
        {
            color: #fff;
        }
    </style>

</head>
<body>

<%@include file="/WEB-INF/jsp/main/header.jsp" %>
<section id="main-container" class="main-container">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="row" style="height: content-box">
                        <div class="col-md-5 pull-left ">
                        </div>
                        <div class="col-md-6 pull-right ">
                            <form name="frm" action ="<c:url value='/cop/bbs/contactList.do'/>" method="post">
                                <input type="hidden" name="contactUniqId"  value="0" />
                                <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
                                <input type="submit" value="실행" onclick="fn_egov_select_contactList('1'); return false;" id="invisible" class="invisible" />

                                <fieldset>

                                    <button type="button" class="btn btn-outline btn-default pull-right" style="margin: 13px 0 0 13px;" onclick="javascript:fn_egov_select_contactList('1'); return false;" >검색</button>
                                    <input type="text" name="searchWrd" value='<c:out value="${searchVO.searchWrd}"/>' class="form-control col-md-4 pull-right" style="margin: 0px;">
                                    <select name="searchCnd" class="select pull-right" title="검색조건 선택" style="margin: 13px 13px 0 0;">
                                        <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
                                        <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
                                        <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
                                    </select>
                                </fieldset>
                            </form>

                        </div>

                    </div>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th class="text-center">제목</th>
                                <th class="text-center">글쓴이</th>
                                <th class="text-center">작성일</th>
                            </tr>
                            </thead>

                            <tbody>

                            <c:forEach varStatus="status" var="result" items="${resultList}" >
<%--
                                <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}' />" />
                                <input name="contactIndexNumber" type="hidden" value="<c:out value='${result.contactIndexNumber}' />" />
                                <input type="submit" value="실행" onclick="fn_egov_select_contactList('1'); return false;" id="invisible" class="invisible" />
--%>

                                <tr>
                                    <td>
                                    <c:out value="${(paginationInfo.totalRecordCount+1) - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/>
                                    </td>
                                    <%--@elvariable id="searchVO" type="egovframework.let.cop.bbs.service.ContactVO"--%>
                                    <form:form modelAttribute="searchVO" name="searchVO" method="post" action="/cop/bbs/contactListDetail.do">

                                        <td>
                                            <input type="hidden" name="contactUniqId" value="<c:out value='${result.contactUniqId}' />" />
                                            <input type="hidden" name="whatever" value="nothing" />
                                            <input type="submit" onclick="javascript:fn_contact_detail(${result.contactUniqId})"
                                                   style="border: 0px; background: transparent;"
                                                   value="<c:out value='${result.contactTitle}' />" />
                                        </td>
                                    </form:form>
                                    <td class="text-center">
                                        <c:out value="${result.contactName}" />
                                    </td>
                                    <td class="text-center">
                                        <c:out value="${result.contactDate}" />
                                    </td>
                                </tr>

                            </c:forEach>

                            </tbody>
                        </table>
                        <table class="table">
                            <tr>
                                <td colspan="5" class="footable-visible" >
                                    <ul class="pagination pull-right">
<%--
                                        <li class="footable-page-arrow disabled">
                                            <a data-page="first" href="#first">«</a>
                                        </li>
                                        <li class="footable-page-arrow disabled">
                                            <a data-page="prev" href="#prev">‹</a>
                                        </li>
--%>
<%--
                                        <li class="footable-page active">
                                            <a data-page="0" href="#">1</a>
                                        </li>
--%>
                                        <li class="footable-page" active><%--
                                            <a data-page="0" onclick="fn_egov_select_contactList()">--%>
                                                <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_contactList" />
                                          <%-- </a>--%>
                                        </li>
<%--
                                        <li class="footable-page-arrow">
                                            <a data-page="next" href="#next">›</a>
                                        </li>
                                        <li class="footable-page-arrow">
                                            <a data-page="last" href="#last">»</a>
                                        </li>
--%>
                                    </ul>
                                </td>
                            </tr>
                        </table>

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
<script src="<c:url value='/'/>js/plugins/dataTables/datatables.min.js"></script>
<!-- Custom and plugin javascript -->
<script src="<c:url value='/'/>js/inspinia.js"></script>
<script src="<c:url value='/'/>js/plugins/pace/pace.min.js"></script>

<script>
    function fn_contact_detail(contactUniqId) {
        document.searchVO.contactUniqId.value = contactUniqId;
        document.searchVO.action = "<c:url value='/cop/bbs/contactListDetail.do'/>";
        document.searchVO.submit();
    }

    function fn_egov_select_contactList(pageNo) {
        document.frm.pageIndex.value = pageNo;
        document.frm.action = "<c:url value='/cop/bbs/contactList.do'/>";

        document.frm.submit();
    }

    function pageAlgo(total, bottomSize, listSize, cursor)
    {
        let totalPageSize = Math.ceil(total/listSize);
        let firstBottomNumber = cursor - cursor % bottomSize +1; // 하단 최초 숫자
        let lastBottomNumber = cursor - cursor % bottonSize + bottomSize; // 하단 마지막숫자

        if(lastBottomNumber > totalPageSize) lastBottomNumber = totalPageSize; //총갯수보다 큰 경우 방지
        return {
            firstBottomNumber,
            lastBottomNumber,
            totalPageSize,
            total,
            bottomSize,
            listSize,
            cursor
        }
    }



</script>
</body>
</html>
