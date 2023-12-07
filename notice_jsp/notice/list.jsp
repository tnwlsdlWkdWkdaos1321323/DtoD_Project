<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header include -->
<%@include file="../includes/header.jsp" %> 
    
    <!-- user notice link -->
    <!-- reset CSS -->
    <link href="/resources/css/reset.css" rel="sytlesheet">
    <!-- user notice css -->
    <link href="/resources/notice_css/user_notice_list.css" rel="stylesheet">
    
    <!-- bootstrap 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	
</head>

<!-- nav include -->
<%@ include file="../includes/nav.jsp"%>

<div class="container">
<div id="wrapper">
        
       <!-- jQuery를 header.jsp에서 선언해 두면, 작성하는 JSP에서 자유롭게 사용할 수
                      있기 때문에 아래와 같이 jQuery를 적용해 줍니다. -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<div class="row">
		<div class="col-lg-12" id="untitle">
			<h1 class="page-header pointFont">공지사항</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row" id="unlist">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<!-- /.panel-heading -->
				<div id="unBody" class="panel-body">
					<table width=""
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr class="unTr">
								<th class="unTrCon">번호</th>
								<th class="unTrTitle">제목</th>
								<th class="unTrCon">작성자</th>
								<th class="unTrCon">등록일</th>
							</tr>
						</thead>
						<c:forEach items="${list}" var="notice">
							<tr class="unTrList">
								<td class="unTdNum"><c:out value="${notice.nobno}"></c:out></td>
								<!-- Page314 : 이벤트 처리를 위한 a 태그에 class 속성 move를 적용해 줍니다. -->
								<!-- Page486 views 폴더 내 board/list.jsp 파일의 일부에 댓글의 숫자 표시를 반영해 줍니다. -->
								<td class="unTdTitle"><a class="move" href='<c:out value="${notice.nobno}"/>'><c:out value="${notice.notitle}" /></a></td>
								<td class="unTd"><c:out value="${notice.nowriter}"></c:out></td>
								<td class="unTd"><fmt:formatDate value="${notice.nodate}"
										pattern="yyyy-MM-dd" />
							</tr>
						</c:forEach>
	
					</table>
					<!-- /.table-responsive -->
					
					<div class="row">
						<div class="col-lg-12">
							<form action="/notice/list" id="searchForm" method="get">
								<select name="type" class="unselectBtn">
									<option value=""
										<c:out value="${pageMaker.cri.type == null?'selectrd':''}"/>
									>검색 조건을 선택하세요</option>
									<option value="T"
										<c:out value="${pageMaker.cri.type eq 'T'?'selectrd':''}"/>
									>제목
									<option value="C"
										<c:out value="${pageMaker.cri.type eq 'C'?'selectrd':''}"/>
									>내용</option>
									<option value="W"
										<c:out value="${pageMaker.cri.type eq 'W'?'selectrd':''}"/>
									>작성자</option>
									<option value="TC"
										<c:out value="${pageMaker.cri.type eq 'TC'?'selectrd':''}"/>
									>제목 or 내용</option>
									<option value="TW"
										<c:out value="${pageMaker.cri.type eq 'TW'?'selectrd':''}"/>
									>제목 or 작성자</option>
									<option value="TWC"
										<c:out value="${pageMaker.cri.type eq 'TWC'?'selectrd':''}"/>
									>제목 or 내용 or 작성자</option>
								</select>
								<input type="text" name="keyword" class="unSearchBtn" value="<c:out value="${pageMaker.cri.keyword}"/>"/>
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
								<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
								<button class="btn unBtn">검색(Search)</button>
							</form>
						</div>
					</div>
	
					<!-- Page308 pagination 붙여넣기 적용 후에 Ctrl + Shift + F 클릭 적용해 줌 -->
					<div class='pull-right paging row'>
						<ul class="pagination col-lg-4">
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a href="${ pageMaker.startPage -1}">Previous</a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="paginate_button"><a href="${num}">${num}</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<li class="paginate_button next"><a href="${ pageMaker.endPage +1}">Next</a></li>
							</c:if>				
						</ul>
					</div> <!-- end Pagination -->
					
					<!-- Page311 : 실제 페이지를 클릭하면 동작을 하는 부분은 별도의 form 태그를 이용해서 처리하도록 합니다! -->
					<form action="/notice/list" id="actionForm" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="type" value="<c:out value="${pageMaker.cri.type}"/>"/>
						<input type="hidden" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>"/>
					</form>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

</div>
<!-- /#wrapper -->
</div>
<!-- container -->

<!-- jQuery -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/resources/dist/js/sb-admin-2.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->  
<script type="text/javascript">

	$(document).ready(
			function() {
				var result = '<c:out value="${result}" />';

				// 모달창 관련 자바스크립트 소스 코딩(시작)	
				// checkModal() 함수는 파라미터에 따라서 모달창을 보여주거나 내용을 수정한 뒤
				// 보이도록 처리합니다. checkModal()에서는 새로운 게시글이 작성되는 경우
				// RedirectAttributes로 게시물의 번호가 전송되므로 이를 이용해서 모달창의 내용을
				// 수정 처리합니다. $("#modal").modal('show')를 호출하면 모달창이 보이게 됩니다.
				// 실행 확인은 웹 프로젝트 실행 후 '/board/register'를 이용해서 새로운 게시물을 작성하고
				// 나면 자동으로 '/board/list'로 이동하면서 모달창이 보이게 됩니다.		
				checkModal(result);

				history.replaceState({}, null, null);

				function checkModal(result) {
					if (result === '') {
						return;
					}

					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글 " + parseInt(result) + " 번이 등록되었습니다!");
					}
					$("#myModal").modal("show");
				}
				// 모달창 관련 자바스크립트 소스 코딩(종료)
				
				// Page312 a 태그가 원래의 동작을 못하도록 JavaScript 처리를 합니다.
				var actionForm = $("#actionForm");
				
				$(".paginate_button a").on("click", function(e) {
					
					e.preventDefault();
					
					console.log('click');
					
					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					actionForm.submit();
				});
				
				// Page315 : list.jsp 게시물 조회를 위한 이벤트 처리 추가
				$(".move").on("click", function(e) {
					e.preventDefault();
					actionForm.append("<input type='hidden' name='nobno' value='"+$(this).attr("href")+"'>");
					actionForm.attr("action", "/notice/get");
					actionForm.submit();
				});
				
				//page342 자바스크립트 소스 코딩 시작
				var searchForm = $("#searchForm");
				
				$("#searchForm button").on("click", function(e) {
					if (!searchForm.find("option:selected").val()) {
						alert("검색 종류를 선택해 주시기 바랍니다!");
						return false;
					}
					if (!searchForm.find("input[name='keyword']").val()) {
						alert("키워드를 입력해 주시기 바랍니다!");
						return false;
					}
					
					//여러 종류들 중에서 검색 버튼을 클릭하면
					//기본 검색 결과 페이지는 1페이지가 되도록 수정 처리 합니다
					searchForm.find("input[name='pageNum']").val("1");
					// 브라우저에서 검색 버튼을 클릭하면 form 태그의 전송은 막고,
		            // 페이지의 번호는 1이 되도록 처리합니다.
		            // 화면에서 키워드가 없다면 검색을 하지 않도록 제어합니다.
					
					e.preventDefault();
					searchForm.submit();
				});
				//page342 자바스크립트 소스 코딩 끝
			});
</script>

<!-- footer include -->
<%@ include file="../includes/footer.jsp"%>

