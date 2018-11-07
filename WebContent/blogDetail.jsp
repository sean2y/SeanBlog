<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	
<%@ include file="common/head.jspf" %>
<!-- Modernizr JS -->
<script src="${pageContext.request.contextPath}/static/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/static/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	
	function addComment(){
		$.ajax({
			url : '${pageContext.request.contextPath}/comment/addComment',
			type : 'post',
			data : {
				'commenterName' : commenterName.value,
				'commentContent' : commentContent.value,
				'blog.blogId' : ${blog.blogId }
			},
			dataType : 'json',
			
			success : function(){
				alert("留言发送成功！后台系统已收到！");
				$("#commenterName").val("");
				$("#commentContent").val("");
			},
			error : function(){
				alert("error");
				$("#commenterName").val("");
				$("#commentContent").val("");
			}
			
		});
	}
</script>
</head>
<body>
	<div id="fh5co-page">
		<jsp:include page="common/left.jsp"></jsp:include>

		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">${blog.blogTitle }</h2>
				<p class="fh5co-heading animate-box" data-animate-effect="fadeInLeft" style="font-size: 16px">${blogger.userName} / ${blog.blogDateStr }</p>
				<div class=" animate-box" data-animate-effect="fadeInLeft" style="color: black;">${blog.blogContent }</div>
				<div class="animate-box" data-animate-effect="fadeInLeft">
					<hr>
					<h5>评论信息：</h5>	
					<c:if test="${empty commentList }">
						<p>暂无评论</p><hr>
					</c:if>
					<c:forEach items="${commentList }" var="commentList">
						<div>${commentList.commenterName } / 发表于${commentList.commentDateStr }</div>
						<p style="width: 500px">${commentList.commentContent }</p><hr>
					</c:forEach>
					
				</div>
				<form>
					<div class="row fh5co-heading animate-box" data-animate-effect="fadeInLeft">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" name="commenterName" id="commenterName" class="form-control" placeholder="你想留下的名字">
									</div>
									<div class="form-group">
										<textarea name="commentContent" id="commentContent" cols="30" rows="7" class="form-control" placeholder="你想留下的信息"></textarea>
									</div>
									<div class="form-group">
										<input type="button" class="btn btn-primary btn-md" onclick="return addComment()" value="发送">
									</div>
									
								</div>
							</div>
						</div>
						
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/static/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/static/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="${pageContext.request.contextPath}/static/js/jquery.flexslider-min.js"></script>
	
	
	<!-- MAIN JS -->
	<script src="${pageContext.request.contextPath}/static/js/main.js"></script>
</body>
</html>