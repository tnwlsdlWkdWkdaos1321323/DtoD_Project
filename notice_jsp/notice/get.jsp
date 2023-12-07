<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header include -->
<%@include file="../includes/header.jsp" %> 

<link rel="stylesheet" href="/resources/notice_css/user_notice_get.css">

</head>

<!-- nav include -->
<%@ include file="../includes/nav.jsp"%>

<!-- user notice 시작 -->
<div class="container">

<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <!-- /.panel-heading -->
         <div class="panel-body">
               
               <div class="form-group unGetT">
                  <div class="form-control unGetTitle" name="title" value='<c:out value="${notice.notitle}" />' readonly="readonly">${notice.notitle}</div>
                  <div class="unGetDate"><fmt:formatDate value="${notice.nodate}" pattern="yyyy-MM-dd" /></div>
               </div>
            <div class="form-group">
              	 <div class="form-control unGetContent" name="content" readonly="readonly" ><c:out value="${notice.nocontent}" /></div>
            </div>
            <div class="offset-md-10">
               <button data-oper='list' class="btn unGetBtn" onclick="location.href='/notice/list'">목록보기</button>
            </div>
         </div> <!-- end panel-body -->
      </div> <!-- end panel-default -->
   </div> <!-- end col-lg-12 -->   
</div> <!-- end row -->
</div>

<!--  Page400 아래 1줄 소스 코딩 추가 -->
<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
   $(document).ready(function() {
      
      var operForm = $("#operForm");
      
      $("button[data-oper='list']").on("click",function(e) {
            // 사용자가 수정 버튼을 누르는 경우에는 bno 값을 같이 전달하고,
            // <form> 태그를 submit 시켜서 처리합니다.
            // 만일 사용자가 list로 이동하는 경우에는 아직 아무런 데이터도 필요하지 않으므로
            // <form> 태그 내의 bno 태그를 지우고 submit() 메서드를 통해서
            // 리스트 페이지로 이동합니다.
            operForm.find("#bno").remove();
            operForm.attr("action", "/notice/list")
            operForm.submit();
      });
   });
   
</script>
<!-- user notice 끝 -->

<!-- footer include -->
<%@ include file="../includes/footer.jsp"%>