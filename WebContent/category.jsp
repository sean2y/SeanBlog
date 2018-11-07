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
				<h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">CATEGORY</h2>
				<div class="row row-bottom-padded-md">
					<c:forEach items="${typeList}" var="typeList">
						<div class="col-md-3 col-sm-6 col-padding text-center animate-box">
							<a href="${pageContext.request.contextPath}/blog/category/${typeList.typeId}" class="work image-popup" style="background-image: url(${typeList.typeImage })" >
								<div class="desc">
									<h3>${typeList.typeName }</h3>
									<span>编号：${typeList.typeOrderNum }</span>
								</div>
							</a>
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