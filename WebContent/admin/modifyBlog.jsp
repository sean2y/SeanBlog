<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改博客页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="common/head.jspf" %>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
	
<!-- 实例化编辑器 -->
<script type="text/javascript">
	var ue = UE.getEditor('editor');
	ue.addListener("ready", function() {
		//通过UE自己封装的ajax请求数据
		UE.ajax.request(
				"${pageContext.request.contextPath}/admin/blog/findBlogById", {
					method : "post",
					async : false,
					data : {
						"blogId" : "${param.blogId}"
					},
					onsuccess : function(result) { //根据id查询Blog，返回一个json格式的blog对象
						result = eval("(" + result.responseText + ")");
						$("#blogTitle").val(result.blogTitle);
						$("#blogTypeId").combobox("setValue",
								result.blogType.typeId);
						UE.getEditor('editor').setContent(result.blogContent);
					}
				});
	});

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
			$.post("${pageContext.request.contextPath}/admin/blog/addBlog", {
				'blogId' : '${param.blogId}',
				'blogTitle' : title,
				'blogType.typeId' : blogTypeId,
				'blogContent' : content,
				'blogSummary' : summary,
			}, function(result) {
				if (result.success) {
					$.messager.alert("系统提示", "博客修改成功！");
				} else {
					$.messager.alert("系统提示", "博客修改失败！");
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
					<td><script id="editor" name="blogContent" type="text/plain"
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
