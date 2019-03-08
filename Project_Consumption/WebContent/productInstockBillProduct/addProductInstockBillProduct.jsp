<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>添加消费记录</title>
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/easyui.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/base.css" />
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/easyui-lang-zh_CN.js"></script>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="logo" data-options="region:'north'" style="width:1024px;height:168px">
			</div>
			<div data-options="region:'west',split:true" title="系统菜单" style="width:165px;">
				<%@ include file="../menu.jsp" %>
			</div>
			<div data-options="region:'center',title:'欢迎使用',iconCls:'icon-ok'" style="height:100%;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">货品入库货品</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="saveproductInstockBillProduct" method="post">
				      
				      <div style="padding:3px;">
				        <label for="productInstockBillProduct.productInstockBill.billNo">货品入库单号：</label>
				        <input type="text" name="productInstockBillProduct.productInstockBill.billId" value="productInstockBillProduct.productInstockBill.billId" readonly/>
				       <%--  <select id="billId" name="productInstockBillProduct.productInstockBill.billId" class="easyui-validatebox textbox" style="width:180px;" onchange="aa()">
				          <option value="0">---请选择单号---</option>
				          <c:forEach items="${listProductInstockBill}" var="productInstockBill">				            
				                <option value="${productInstockBill.billId}" name="productInstockBillProduct.productInstockBill.billId">${productInstockBill.billNo}</option>				          
				          </c:forEach>
				        </select> --%>
				      </div>
				      
				       <div style="padding:3px;">
				       
				        <label for="productInstockBillProduct.product.productName">货品名称：</label>
				        
				        <select id="productId" name="productInstockBillProduct.product.productId" class="easyui-validatebox textbox" style="width:180px;">
				          <option value="0">---请选择货品---</option>
				          <c:forEach items="${listMaterial}" var="product">				            
				                <option value="${product.productId}" name="productInstockBillProduct.product.productId">${product.productName}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				       
				       <div style="padding:3px;">
				        <label for="productInstockBillProduct.remark">备注：</label>
				        <input id="productInstockBillProduct.remark" type="text" name="productInstockBillProduct.remark"  class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      				  
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" value="修改"/>
				      </div>
				      
				    </form>
				  </center>
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="../tail.jsp" %>
				</div>
			</div>
		</div>
  </body>
</html>