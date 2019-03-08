<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="resources/plugins/bootstrap-3.3.0/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="resources/plugins/material-design-iconic-font-2.2.0/css/material-design-iconic-font.min.css" rel="stylesheet"/>
	<link href="resources/plugins/bootstrap-table-1.11.0/bootstrap-table.min.css" rel="stylesheet"/>
	<link href="resources/plugins/waves-0.7.5/waves.min.css" rel="stylesheet"/>
	<link href="resources/plugins/jquery-confirm/jquery-confirm.min.css" rel="stylesheet"/>
	<link href="resources/plugins/select2/css/select2.min.css" rel="stylesheet"/>
	<link href="resources/css/common.css" rel="stylesheet"/>
 	<style>
 		.fixed-table-toolbar{
 			height: 40px;
 		}
 		.topSelect{
	 		    font-size: 15px;
			    width: 91px;
			    display: inline-block;
			    height: 28px;
			    text-align: center;
			    color: #000000c9;
			    border-radius: 3px;
			    margin: 7px;
			    line-height: 28px;
			    background: #eaeaea;
 		}
 		.topSelect:hover{
 			background:#0f7562;
 			color:white;
 		}
 	</style>
  </head>
  
  <body>
   <script>
   var arr = [];
   </script>
   <div style="background: #fafafa;">
	   					<a href="showListreturnMaterialBill?id=1" class="topSelect">待审核</a>
					   	<a href="showListreturnMaterialBill?id=2" class="topSelect">已审核</a>					  
		</div>
   <form action="findbyNameclient" method="post" style="position:absolute;top:58px;right:187px;">
	   <p class="columns pull-right search-button">
		    <button class="btn btn-default" type="submit" name="refresh" title="查询" style="padding: 9px;margin-right: 10px;margin-left: -3px;">
		   	 	<i class="glyphicon glyphicon-search icon-search"></i>
		    </button>
	    </p>
	    <p class="columns pull-right search-input">
	   		<input class="form-control" name="client.clientName"  type="text" placeholder="搜索">
	   </p>
   </form>
				   
<div id="main">
	<div id="toolbar">
		<a class="waves-effect waves-button" href="addPrereturnMaterialBill"><i class="zmdi zmdi-plus"></i> 新增退料单</a>
	</div>
	<table id="table"></table>
  </div>				   
				    
	   	   	<c:forEach items="${list}" var="returnMaterial">
				<script>
					 var id = ${returnMaterial.returnbillId};
			    	 var returnbillNo = "${returnMaterial.billNo}";
			    	 var billNo = "${returnMaterial.orderBill.billNo}";
			    	 var fromPrincipal = "${returnMaterial.employee.name}";
			    	 var warehousePrincipal = "${returnMaterial.mwareHouse.wareNo}";
			    	 var billTime = "${returnMaterial.billTime}";
			    	 var returnReason = "${returnMaterial.returnReason}";
			    	 var billState = "${returnMaterial.billState}";
			    	 var auditAt = "${returnMaterial.auditAt}";
			    	 var auditBy = '<%=ActionContext.getContext().getSession().get("name")%>';
			    	 if(auditAt == null||auditAt ==''){
				 		auditAt = "尚未审核";
					 }
			    	 if(returnReason == 1){
			    	 	returnReason = "生产退料";
			    	 }else if(returnReason == 2){
			    	 	returnReason = "研发退料";
			    	 }
			    	 if(billState == 1){
			    	 	billState = "待审核";
			    	 }else if(billState == 2){
			    	 	billState = "已审核";			    
			    	 }
			    	 var obj = {
			    	 	id : id,
			    	 	returnbillNo:returnbillNo,
			    	 	billNo : billNo,			   
			    	 	fromPrincipal:fromPrincipal,
			    	 	warehousePrincipal : warehousePrincipal,
			    	 	billTime : billTime,
			    	 	returnReason : returnReason,
			    	 	billState : billState,
			    	 	auditAt : auditAt,
			    	 	auditBy : auditBy
			    	 };
			    	 arr.push(obj);
				</script>
		    </c:forEach>
	<script>
    		var jsonlist = JSON.stringify(arr);
    		var jj = JSON.parse(jsonlist);
    	</script>
<script src="resources/plugins/jquery.1.12.4.min.js"></script>
<script src="resources/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/bootstrap-table.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="resources/plugins/waves-0.7.5/waves.min.js"></script>
<script src="resources/plugins/jquery-confirm/jquery-confirm.min.js"></script>
<script src="resources/plugins/select2/js/select2.min.js"></script>
<script src="resources/js/common.js"></script>
<script>
var $table = $('#table');
$(function() {
	$(document).on('focus', 'input[type="text"]', function() {
		$(this).parent().find('label').addClass('active');
	}).on('blur', 'input[type="text"]', function() {
		if ($(this).val() == '') {
			$(this).parent().find('label').removeClass('active');
		}
	});
	// bootstrap table初始化
	// http://bootstrap-table.wenzhixin.net.cn/zh-cn/documentation/
	$table.bootstrapTable({
		data: jj,
		height: getHeight(),
		striped: true,
		search: false,
		searchOnEnterKey: true,
		showRefresh: true,
		showToggle: true,
		showColumns: true,
		minimumCountColumns: 2,
		showPaginationSwitch: true,
		clickToSelect: true,
		detailView: false,
		detailFormatter: 'detailFormatter',
		pagination: false,
		paginationLoop: false,
		classes: 'table table-hover table-no-bordered',
		//sidePagination: 'server',
		//silentSort: false,
		smartDisplay: false,
		idField: 'id',
		sortName: 'id',
		sortOrder: 'desc',
		escape: true,
		searchOnEnterKey: true,
		idField: 'systemId',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'returnbillNo', title: '退料单号', sortable: false, halign: 'center'},
			{field: 'fromPrincipal', title: '退料人', sortable: false, halign: 'center'},
			{field: 'warehousePrincipal', title: '退料仓库', sortable: false, halign: 'center'}, 
			{field: 'billNo', title: '订单号', sortable: false, halign: 'center'},
			{field: 'billTime', title: '创建时间', sortable: false, halign: 'center'},
			{field: 'returnReason', title: '退料原因', sortable: false, halign: 'center'},
			{field: 'billState', title: '退料单状态', sortable: false, halign: 'center',formatter:actionFormatter2},
			{field: 'auditAt', title: '审核时间', sortable: false, halign: 'center'},
			{field: 'auditBy', title: '操作', events:actionEvents,formatter:actionFormatter,halign: 'center'},
			
		]
	}).on('all.bs.table', function (e, name, args) {
		$('[data-toggle="tooltip"]').tooltip();
		$('[data-toggle="popover"]').popover();  
	});
});
function actionFormatter(value, row, index) {
    return [
        /* '<a class="like" href="javascript:void(0)" data-toggle="tooltip" title="Like"><i class="glyphicon glyphicon-heart"></i></a>　', */
        '<a class="edit ml10" href="prepupreturnMaterialBill?returnbillId='+ row.id +'" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
        '<a class="remove ml10" href="deletereturnMaterialBill?returnbillId='+ row.id +'" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}
function actionFormatter2(value, row, index) {
	if(row.billState == '待审核'){
		//弹出框
		return [
	        '<a style="color:red" href="myalertreturnMaterialBill?returnbillId='+ row.id +'">'+row.billState+'</a>　',
	    ].join('');
	}else{
		return [
        	'<span>'+row.billState+'</span>　',
    	].join('');
	}
    
}
window.actionEvents = {
    /* 'click .like': function (e, value, row, index) {
        alert('You click like icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    }, */
    'click .edit': function (e, value, row, index) {
        /* alert('You click edit icon, row: ' + JSON.stringify(row)); */
        console.log(row.product_id);
    },
    'click .remove': function (e, value, row, index) {
       /*  alert('You click remove icon, row: ' + JSON.stringify(row)); */
        console.log(value, row, index);
    }
};
function detailFormatter(index, row) {
	var html = [];
	$.each(row, function (key, value) {
		html.push('<p><b>' + key + ':</b> ' + value + '</p>');
	});
	return html.join('');
}


</script>
  </body>
</html>
