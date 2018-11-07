<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<div id="fh5co-page">
		<jsp:include page="common/left.jsp"></jsp:include>
		<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md">
					<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
						<img class="img-responsive" src="${pageContext.request.contextPath}/static/images/img_bg_1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					</div>
					<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
						<h2 class="fh5co-heading">About Me</h2>
						
						<h4 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">${blogger.userName }</h4>
						<div class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">${blogger.userProfile }</div>
						<div class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">
							<hr>
							<a href="https://weibo.com/u/2872538217">
								<img width="30px" height="30px" src="${pageContext.request.contextPath}/static/images/weibo.png" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
							</a>
							<a href="https://github.com/sean2y">
								<img width="30px" height="30px" src="${pageContext.request.contextPath}/static/images/github.png" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
							</a>
						</div>
					</div>
				</div>
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