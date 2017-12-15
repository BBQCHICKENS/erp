<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../taglibs.jsp" %>
<style>
li{
	list-style-type: none;
	float: left;
	padding: 3px;
	border: 1px solid #8ECC3D;
	width: 80px;
	text-align: center;
	margin-left: 1px;
	font-size: 15px;
	
}
</style>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">进货订单管理</span>
		</div>
	</div>
	<div class="content-text">
		<form action="${path }/consoleLog_list" method="post">
		     <input type="hidden" name="query.entityId" value="<s:property value="query.entityId"/>">
			<input type="hidden" name="query.tableName" value="<s:property value="query.tableName"/>">
			<input type="hidden" name="query.optType" value="<s:property value="query.optType"/>">
			<div class="square-order">
				<div style="border: 1px solid #8ECC3D;clear: left;"></div>
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(${path}/images/table_bg.gif) repeat-x;">
						<td width="25%" height="30">审核人</td>
						<td width="9%">审核意见</td>
						<td width="10%">审核时间</td>
					</tr>
					
					<s:iterator value="#page.list" var="log">
						<tr align="center" bgcolor="#FFFFFF">
							<td><s:property value="#log.orderChecker.name"/></td>
							<td><s:property value="#log.note"/></td>
							<td><s:property value="#log.optTime"/></td>
						</tr>
					</s:iterator>
				</table>
				<%@ include file="../../tools/paging.jsp" %>
			</div>
		</form>
	</div>
	<div class="content-bbg"></div>
</div>
