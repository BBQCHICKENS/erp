<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<script type="text/javascript">
	function inStoreProduct(storeDetailId,productId) {
	    var orderId =$('#orderId').val();
        var diag = new Dialog();
        diag.Width = 850;
        diag.Height = 100;
        diag.ShowButtonRow=true;
        diag.Title = "入库";
        diag.URL = "${path}/store_inStoreProduct";
        diag.OKEvent = function(){
            var win = diag.innerFrame.contentWindow;
            //调用提交表单的方法获得返回值
            var result = win.inStoreProduct1(storeDetailId,productId);
            //如果成功页面要刷新
            if(result == "success"){
                diag.close();
                window.location.href = "${path}/assignTask_inDetail?order.orderId="+orderId;
            }
        };
        diag.show();
    }
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">入库</span>
		</div>
	</div>
	<div class="content-text">
			<div class="square-o-top">
				<input type="hidden" id="orderId" value="<s:property value="order.orderId"/>">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td>订 单 号:</td>
						<td class="order_show_msg"><s:property value="order.orderNum"/></td>
						<td>商品总量:</td>
						<td class="order_show_msg"><s:property value="order.totalNum"/></td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<center id="inOrderTitle" style="text-decoration:underline;font-size:16px; font-weight:bold; font-family:"黑体";">&nbsp;&nbsp;&nbsp;&nbsp;单&nbsp;&nbsp;据&nbsp;&nbsp;明&nbsp;&nbsp;细&nbsp;&nbsp;&nbsp;&nbsp;</center>
				<br/>
				<table id="inOrder" width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(${path}/images/table_bg.gif) repeat-x;">
						<td width="20%" height="30">商品名称</td>
						<td width="30%">总数量</td>
						<td width="10%">已入库数量</td>
						<td width="30%">剩余数量</td>
						<td width="10%">入库</td>
					</tr>
					<s:iterator value="order.details" var="dets">
						<tr aa="bb" align="center" bgcolor="#FFFFFF">
							<td height="30"><s:property value="#dets.product.name"/></td>
							<td><s:property value="#dets.detailNum"/></td>
							<td><s:property value="#dets.detailNum - #dets.surplus"/></td>
							<td><s:property value="#dets.surplus"/></td>
							<s:if test="#dets.surplus !=0 ">
								<td><button href="javascript:void(0)" onclick="inStoreProduct(<s:property value="#dets.orderDetailId"/>,<s:property value="#dets.product.productId"/>)" class="xiu">入库</button></td>
							</s:if>
							<s:else>
								<td><button>over</button></td>
							</s:else>
						</tr>
					</s:iterator>
				</table>
			</div>
	</div>
	<div class="content-bbg"></div>
</div>
