<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>写博客页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="common/head.jspf" %>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
	
<script type="text/javascript">
	<%-- 实例化编辑器 --%>
	var ue = UE.getEditor('editor');
	ue.addListener("ready", function(){
		//通过UE自己封装的ajax请求数据
		UE.ajax.request("${blog}/blogger/getBloggerById",
				{
					method: "post",
					async: false,
					data: {},
					onsuccess: function(result) { 
						result = eval("(" + result.responseText + ")");
						$("#userName").val(result.userName);
						$("#userPassword").val(result.userPassword);
						UE.getEditor('editor').setContent(result.userProfile);
					}
				});
	});
	
	function submitData() {
		var userName = $("#userName").val();
		var userPassword = $("#userPassword").val();
		var userProfile = UE.getEditor('editor').getContent();

		if (userName == null || userName == '') {
			$.messager.alert("系统提示", "请输入昵称！ ");
		} else if (userPassword == null || userPassword == '') {
			$.messager.alert("系统提示", "请输入密码 ");
		} else if (userProfile == null || userProfile == '') {
			$.messager.alert("系统提示", "请编辑个性内容！ ");
		} else {
			$.post("${blog}/blogger/updBlogger", {
				'userId' : 1,
				'userName' : userName,
				'userPassword' : userPassword,
				'userProfile' : userProfile,
			}, function(result) {
				if (result.success) {
					$.messager.alert("系统提示", "博主修改成功！");
				} else {
					$.messager.alert("系统提示", "博主修改失败！");
				}
			}, "json");
		}
	}
</script>
</head>

<body>
	<div class="easyui-panel" title="修改博主信息" style="width: 400px"
		data-options="fit:true,border:false">
		<div style="padding: 10px 60px 20px 60px">
			<table cellpadding="5">
				<tr>
					<td>昵称:</td>
					<td><input class="easyui-textbox" type="text" name="userName" id="userName"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input class="easyui-textbox" type="text" name="userPassword" id="userPassword"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>个性内容:</td>
					<td><script id="editor" name="userProfile" type="text/plain"
							style="width: 900px; height: 500px;">
							</script></td>
				</tr>

			</table>
			<div style="text-align: left; padding: 5px">
				<a href="javascript:submitData()" class="easyui-linkbutton"
					data-options="iconCls:'icon-submit'">修改信息</a>
			</div>
		</div>
	</div>
</body>
</html>
