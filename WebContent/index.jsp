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
</head>
<body>
	<div id="fh5co-page">
		<jsp:include page="common/left.jsp"></jsp:include>

		<div id="fh5co-main">
			<aside id="fh5co-hero" class="js-fullheight">
				<div class="flexslider js-fullheight">
					<ul class="slides">
						<li style="background-image: url(static/images/img_bg_1.jpg);">
							<div class="overlay"></div>
							<div class="container-fluid">
								<div class="row">
									<div
										class="col-md-8 col-md-offset-2 text-center js-fullheight slider-text">
										<div class="slider-text-inner">
											<h1>什么样的灵魂就要什么样的养料</h1>
											<!-- <p>
												<a class="btn btn-primary btn-demo popup-vimeo" href="">
													<i class="icon-monitor"></i> Live Preview
												</a> <a class="btn btn-primary btn-learn">Learn More<i
													class="icon-arrow-right3"></i></a>
											</p> -->
										</div>
									</div>
								</div>
							</div>
						</li>
						<li style="background-image: url(static/images/img_bg_2.jpg);">
							<div class="overlay"></div>
							<div class="container-fluid">
								<div class="row">
									<div
										class="col-md-8 col-md-offset-2 text-center js-fullheight slider-text">
										<div class="slider-text-inner">
											<h1>千灯万盏，我只有一轮月亮</h1>
											
										</div>
									</div>
								</div>
							</div>
						</li>
						<li style="background-image: url(static/images/img_bg_3.jpg);">
							<div class="overlay"></div>
							<div class="container-fluid">
								<div class="row">
									<div
										class="col-md-8 col-md-offset-2 text-center js-fullheight slider-text">
										<div class="slider-text-inner">
											<h1>失败只有一种，就是半途而废</h1>
											
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</aside>

			<div class="fh5co-narrow-content">
				<h2 class="fh5co-heading animate-box"
					data-animate-effect="fadeInLeft">Recent Blog</h2>
				<div class="row row-bottom-padded-md">
					<c:forEach items="${blogList }" var="blogList" begin="0" end="3" step="1">
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

	

</body>
</html>