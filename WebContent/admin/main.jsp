<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SeanWay后台管理系统</title>
<%@include file="common/head.jspf"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/echarts.js"></script>
<script type="text/javascript">
	
	function addTab(title, url, iconCls) {
		if ($('#tabs').tabs('exists', title)) {
			$('#tabs').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="'
					+ url + '" style="width:100%;height:100%;"></iframe>';
			$('#tabs').tabs('add', {
				title : title,
				content : content,
				iconCls : iconCls,
				closable : true
			});
		}
	}


	function refreshSystemCache() {
		$.post(
			"${pageContext.request.contextPath}/admin/system/refreshSystemCache",
			{}, function(result) {
				if (result.success) {
					$.messager.alert("系统提示", "已成功刷新系统缓存！");
				} else {
					$.messager.alert("系统提示", "刷新系统缓存失败！");
				}
			}, 
		"json");
	}
</script>
<script>
$(function(){
	var myChart = echarts.init(document.getElementById('main'));
	 /* 
	 	data1 表示每个博客类型
    	data2 表示每个博客类型的统计结果
	 */
	var data1 = [];
	var data2 = [];
	var array = [];
	
	$.ajax({
		type :"post",
		url : "${pageContext.request.contextPath}/admin/blogType/showChart",
		data : {},
		cache : false,
		async: false,
        dataType:"json",
        success : function (result){
        	for(var i in result){
            	data1.push(result[i].typeName);
                data2.push(result[i].blogNum);
                var map={};
                map.name=result[i].typeName;
                map.value=result[i].blogNum;
                array[i]=map;
            }
            myChart.setOption({ //加载数据图表
                title : {
                    text: '博客信息统计',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient : 'vertical',
                    x : 'left',
                    data:data1
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {
                            show: true,
                            type: ['pie', 'funnel'],
                            option: {
                                funnel: {
                                    x: '25%',
                                    width: '50%',
                                    funnelAlign: 'left',
                                    max: 1548
                                }
                            }
                        },
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                series : [{
                        name:'统计结果:',
                        type:'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:array
                }]
            });
        },
        error : function(result) {
            //请求失败时执行该函数
            alert("图表请求数据失败!");
            myChart.hideLoading();
        }
	});
})
</script> 
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="background: #B3DFDA; padding: 10px">
		<h3>SeanWay</h3>
	</div>
	<div data-options="region:'center'">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" align="center" data-options="iconCls:'icon-home'">
			
			    <div id="main"  style="width: 100%;height:100%;"></div>
				
			</div>
		</div>
	</div>
	<div data-options="region:'west',split:true,title:'导航菜单'"
		style="width: 200px;">
		<div class="easyui-accordion" style="width: 200px;"
			data-options="fit:true,border:false">
			<div title="常用操作" data-options="iconCls:'icon-item'"
				style="overflow: auto; padding: 10px;">
				<a href="javascript:addTab('写博客','writeBlog.jsp','icon-writeblog')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-writeblog'"
					style="width: 150px;">写博客</a> <a
					href="javascript:addTab('评论审核','commentReview.jsp','icon-review')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-review'"
					style="width: 150px;">评论审核</a>
			</div>
			<div title="博客管理" data-options="iconCls:'icon-bkgl'"
				style="overflow: auto; padding: 10px;">
				<a href="javascript:addTab('写博客','writeBlog.jsp','icon-writeblog')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-writeblog'"
					style="width: 150px;">写博客</a> <a
					href="javascript:addTab('博客信息管理','blogManager.jsp','icon-bkgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bkgl'" style="width: 150px;">博客信息管理</a>
			</div>
			<div title="博客类别管理" data-options="iconCls:'icon-bklb'"
				style="overflow: auto; padding: 10px;">
				<a
					href="javascript:addTab('博客类别信息管理','blogTypeManager.jsp','icon-bklb')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">博客类别信息管理</a>
			</div>
			<div title="评论管理" data-options="iconCls:'icon-plgl'"
				style="overflow: auto; padding: 10px;">
				<a
					href="javascript:addTab('评论审核','commentReview.jsp','icon-review')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-review'"
					style="width: 150px;">评论审核</a> <a
					href="javascript:addTab('评论信息管理','commentManager.jsp','icon-plgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-plgl'" style="width: 150px;">评论信息管理</a>
			</div>
			<div title="个人信息管理" data-options="iconCls:'icon-grxx'"
				style="overflow: auto; padding: 10px;">
				<a href="javascript:addTab('修改个人信息','modifyInfo.jsp','icon-grxxxg')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-grxxxg'"
					style="width: 150px;">修改个人信息</a>
			</div>
			<div title="系统管理" data-options="iconCls:'icon-system'"
				style="overflow: auto; padding: 10px;">
				 <a	href="javascript:refreshSystemCache()" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-refresh'"
					style="width: 150px;">刷新系统缓存</a> 
			</div>
		</div>
	</div>

	<div id="dlg-buttons">
		<div>
			<a href="javascript:modifyPassword()" class="easyui-linkbutton"
				iconCls="icon-ok" plain="true">保存</a> <a
				href="javascript:closePasswordModifyDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel" plain="true">关闭</a>
		</div>
	</div>
</body>
</html>