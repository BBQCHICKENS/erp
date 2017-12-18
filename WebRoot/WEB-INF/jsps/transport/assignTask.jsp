<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<script type="text/javascript">
	$(function() {
		$("#task").click(function() {
			$("form:first").submit();
		});

	});
	function  assignEmp() {
		var empId =$('#orderCompeter').val();
		var orderId =$('#orderId').val();
        var result = ""
        $.ajax({
            url:"${path}/ajax_orderModel_assign",
            type:"post",
            data:{
                "order.orderId":orderId,
                "order.completer":empId,
            },
            async:false,
            dataType:"text",
            success:function(responseText){
                result = responseText;
            }
        });
        return  result;
    }
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">任务指派</span>
		</div>
	</div>
	<div class="content-text">
			<div class="square-o-top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td height="30">企业名称:</td>
						<td class="order_show_msg"><s:property value="order.supplier.name"/></td>
						<td height="30">订单类别:</td>
						<td class="order_show_msg"><e:orderTypetext orderType="${order.orderType}"/></td>
						<td>提货方式:</td>
						<td class="order_show_msg"><s:property value="order.supplier.needs==1?'自取':'送货'"/></td>
						<td>订 单 号:</td>
						<td class="order_show_msg" colspan="2"><s:property value="order.orderNum"/></td>
					</tr>
					<tr>
						<td>联&nbsp;系&nbsp;人:</td>
						<td class="order_show_msg"><s:property value="order.supplier.contact"/></td>
						<td>联系方式:</td>
						<td class="order_show_msg"><s:property value="order.supplier.tel"/></td>
						<td>商品总量:</td>
						<td class="order_show_msg"><s:property value="order.totalNum"/></td>
						<td>地&nbsp;&nbsp;&nbsp;&nbsp;址:</td>
						<td class="order_show_msg"><s:property value="order.supplier.address"/></td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<center style="text-decoration:underline;font-size:16px; font-weight:bold; font-family:"黑体";">&nbsp;&nbsp;&nbsp;&nbsp;单&nbsp;&nbsp;据&nbsp;&nbsp;明&nbsp;&nbsp;细&nbsp;&nbsp;&nbsp;&nbsp;</center>
				<br/>
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(../../images/table_bg.gif) repeat-x;">
						<td width="20%" height="30">商品类别</td>
						<td width="30%">商品名称</td>
						<td width="10%">数量</td>
						<td width="20%">单价</td>
						<td width="20%">合计</td>
					</tr>
					<s:iterator value="order.details" var="det">
						<tr align="center" bgcolor="#FFFFFF">
							<td height="30"><s:property value="#det.product.productType.name"/></td>
							<td><s:property value="#det.product.name"/></td>
							<td><s:property value="#det.detailNum"/></td>
							<td><s:property value="#det.detailPrice"/></td>
							<td><s:property value="#det.detailPrice*#det.detailNum"/>元</td>
						</tr>
					</s:iterator>
					<tr align="right">
						<td height="30" width="80%" colspan="4">总计</td>
						<td width="20%" align="center"><s:property value="order.totalPrice"/>元</td>
					</tr>
					<tr align="right">
						//隐藏域存储订单id
						<input id="orderId" type="hidden" value="${order.orderId}"/>

						<td height="30" width="80%" colspan="4">指派人:</td>
						<td width="20%" align="center">
							<s:select id="orderCompeter" list="#emp"  listKey="empId" listValue="name"/>
						</td>
					</tr>
				</table>
			</div>
	</div>
	<div class="content-bbg"></div>
</div>
