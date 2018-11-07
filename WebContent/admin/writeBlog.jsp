<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>写博客</title>
<%@include file="common/head.jspf" %>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	var ue = UE.getEditor('editor');
	/* , {
	toolbars: [
	['fullscreen', 'source', 'undo', 'redo', 'bold']
	],
	autoHeightEnabled: true,
	autoFloatEnabled: true
	}); */
	function submitData() {
		var title = $("#blogTitle").val();
		var blogTypeId = $("#blogTypeId").combobox("getValue");
		var content = UE.getEditor('editor').getContent();
		var summary = UE.getEditor('editor').getContentTxt().substr(0, 25);
		

		if (title == null || title == '') {
			$.messager.alert("系统提示", "请输入标题！");
		} else if (blogTypeId == null || blogTypeId == '') {
			$.messager.alert("系统提示", "请选择博客类型！");
		} else if (content == null || content == '') {
			$.messager.alert("系统提示", "请编辑博客内容！");
		} else {
			$.post("${pageContext.request.contextPath}/admin/blog/addBlog",
					{
						'blogTitle' : title,
						'blogType.typeId' : blogTypeId,
						'blogContent' : content,
						'blogSummary' : summary,
					}, function(result) {
						if (result.success) {
							$.messager.alert("系统提示", "博客发布成功！");
							clearValues();
						} else {
							$.messager.alert("系统提示", "博客发布失败！");
						}
					}, "json");
		}
	}
	function clearValues() {
		$("#blogTitle").val("");
		$("#blogTypeId").combobox("setValue", "");
		UE.getEditor("editor").setContent("");
	}
</script>
</head>
<body>
	<div class="easyui-panel" title="编写博客文章" style="width: 400px"
		data-options="fit:true,border:false">
		<div style="padding: 10px 60px 20px 60px">
			<table cellpadding="5">
				<tr>
					<td>博客标题:</td>
					<td><input class="easyui-textbox" type="text" name="blogTitle" id="blogTitle"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>所属类别:</td>
					<td><select id="blogTypeId" class="easyui-combobox" name="blogType.typeId" panelHeight="auto" editable="false">
							<option value="">请选择文章分类......</option>
							<c:forEach items="${typeList}" var="type">
								<option value="${type.typeId}">${type.typeName}</option>
							</c:forEach>
							
					</select></td>
				</tr>
				<tr>
					<td>博客内容:</td>
					<td><script id="editor" name="content" type="text/plain"
							style="width: 900px; height: 500px;">
							</script></td>
				</tr>

			</table>
			<div style="text-align: left; padding: 5px">
				<a href="javascript:submitData()" class="easyui-linkbutton"
					data-options="iconCls:'icon-submit'">发布博客</a>
			</div>
		</div>
	</div>

</body>
</html>