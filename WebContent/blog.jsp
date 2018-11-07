<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file="common/head.jspf" %>
	<!-- Modernizr JS -->
	<script src="static/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="static/js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
	<div id="fh5co-page">
		<jsp:include page="common/left.jsp"></jsp:include>

		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">Read My Blog</h2>
				<div class="row row-bottom-padded-md">
					<c:forEach items="${blogList }" var="blogList">
						<div class="col-md-3 col-sm-6 col-padding animate-box" data-animate-effect="fadeInLeft">
							<div class="blog-entry" style="width:235px;overflow:hidden; word-wrap:break-word;" >
								<a href="${pageContext.request.contextPath}/blog/articles/${blogList.blogId}" class="blog-img"><img src="${blogList.blogType.typeImage }" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
								<div class="desc">
									<h3><a href="${pageContext.request.contextPath}/blog/articles/${blogList.blogId}">${blogList.blogTitle }</a></h3>
									<span><small>${blogList.blogType.typeName }</small> / <small> ${blogList.blogDateStr } </small></span>
									<p>${blogList.blogSummary }</p>
									<a href="${pageContext.request.contextPath}/blog/articles/${blogList.blogId}" class="lead">Read More <i class="icon-arrow-right3"></i></a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="static/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="static/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="static/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="static/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="static/js/jquery.flexslider-min.js"></script>
	
	
	<!-- MAIN JS -->
	<script src="static/js/main.js"></script>

	</body>
</html>