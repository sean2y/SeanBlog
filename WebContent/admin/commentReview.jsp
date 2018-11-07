<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>评论审核页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="common/head.jspf" %>
<script type="text/javascript">
	function formatBlogTitle(val,row) {
		if(val == null) {
			return "<font color=red>该博客已删除</font>";
		} else {
			return "<a href='${blog}/blog/articles/"+val.blogId+"' target='_blank'>"+val.blogTitle+"</a>";
		}
	}
	
	function commentReview(state) {
		var selectedRows = $("#dg").datagrid("getSelections");
		if(selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要审核的评论");
			return;
		}
		var idsStr = [];
		for(var i = 0; i < selectedRows.length; i++) {
			idsStr.push(selectedRows[i].commentId);
		}
		var ids = idsStr.join(","); //1,2,3,4
		$.messager.confirm("系统提示", "<font color=red>您确定如此审核选中的"+selectedRows.length+"条数据吗？</font>", function(r) {
			if(r) {
				$.post("${blog}/comment/review",
						{ids: ids, state: state}, 
						function(result){
							if(result.success) {
								$.messager.alert("系统提示", "评论审核成功！");
								$("#dg").datagrid("reload");
							} else {
								$.messager.alert("系统提示", "评论审核失败！");
							}
						}, "json");
			}
		});
	}
	
	function reload() {
		$("#dg").datagrid("reload");
	}
</script>

</head>

<body>
<table id="dg" title="评论审核管理" class="easyui-datagrid" fit="true" fitColumns="true" pagination="true"
	url="${blog}/comment/listComment?type=0" toolbar="#tb">
	<thead>
		<tr>
			<th field="cb" checkbox="true" align="center"></th>
			<th field="commentId" width="20" align="center">编号</th>
			<th field="blog" width="200" align="center" formatter="formatBlogTitle">博客标题</th>
			<th field="commenterName" width="50" align="center">用户昵称</th> 
			<th field="commentContent" width="200" align="center">评论内容</th> 
			<th field="commentDate" width="50" align="center">评论日期</th> 
		</tr>
	</thead>
</table>
<div id="tb"> 
	<div>
		<a href="javascript:commentReview(1)" class="easyui-linkbutton" iconCls="icon-ok" plain="true">审核通过</a>
		<a href="javascript:commentReview(2)" class="easyui-linkbutton" iconCls="icon-no" plain="true">审核不通过</a>	
		<a href="javascript:reload()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>	
	</div>
</div>

</body>
</html>
