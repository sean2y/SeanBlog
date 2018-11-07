<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>博客管理</title>
<%@include file="common/head.jspf" %>
<script type="text/javascript">
	function formatTitle(val, row) {
		return "<a target='_blank' href='${pageContext.request.contextPath}/blog/articles/"+row.blogId+"'>"+val+"</a>";
	}
	
	function formatBlogType(val, row) {
		return val.typeName;
	} 
	
	function searchBlog() {
		$("#dg").datagrid("load", {
			"blogTitle":$("#searchTitle").val()
		});
	}
	
	function deleteBlog() {
		var selectedRows = $("#dg").datagrid("getSelections");
		if(selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据");
			return;
		}
		var idsStr = [];
		for(var i = 0; i < selectedRows.length; i++) {
			idsStr.push(selectedRows[i].blogId);
		}
		var ids = idsStr.join(","); //1,2,3,4
		$.messager.confirm("系统提示", "<font color=red>您确定要删除选中的"+selectedRows.length+"条数据么？</font>", function(r) {
			if(r) {
				$.post("${pageContext.request.contextPath}/admin/blog/delBlog",
						{ids: ids}, function(result){
							if(result.success) {
								$.messager.alert("系统提示", "数据删除成功！");
								$("#dg").datagrid("reload");
							} else {
								$.messager.alert("系统提示", "数据删除失败！");
							}
						}, "json");
			}
		});
	}
	
	function openBlogModifyTab() {
		var selectedRows = $("#dg").datagrid("getSelections");
		if(selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一个要修改的博客");
			return;
		}
		var row = selectedRows[0];
		window.parent.addTab("修改博客","modifyBlog.jsp?blogId=" + row.blogId, "icon-writeblog");
	}
	
	function reload() {
		$("#dg").datagrid("reload");
	}
</script>
</head>
<body>
	<table id="dg" title="博客管理" class="easyui-datagrid" fit="true" fitColumns="true" pagination="true"
	url="${pageContext.request.contextPath}/admin/blog/listBlog" toolbar="#tb" >
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="blogId" width="20" align="center">编号</th>
				<th field="blogTitle" width="200" formatter="formatTitle">标题</th>
				<th field="blogDate" width="100" align="center">发布日期</th> 
				<th field="blogType" width="100" align="center" formatter="formatBlogType">博客类型</th>
			</tr>

		</thead>
	</table>
	<div id="tb" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			标题：<input type="text" id="searchTitle"
				onkeydown="if(event.keyCode==13) searchBlog()" /> <a
				href="javascript:searchBlog()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a> <a
				href="javascript:deleteBlog()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a> <a
				href="javascript:openBlogModifyTab()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:reload()" class="easyui-linkbutton"
				iconCls="icon-reload" plain="true">刷新</a>
		</div>

	</div>
</body>
</html>