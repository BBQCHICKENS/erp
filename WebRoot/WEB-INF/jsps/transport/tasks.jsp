<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#query").click(function() {
			$("[name='pageNum']").val(1);
			$("form:first").submit();
		});
        var orderState = $("#orderState").val();
        if(orderState == "1"){
            $("#li1").css("background","#8ECC3D");
        }
        if(orderState == "3"){
            $("#li2").css("background","#8ECC3D");
        }
	});
    function transportBuying(orderId) {
        var diag = new Dialog();
        diag.Width = 850;
        diag.Height = 400;
        diag.ShowButtonRow=true;
        diag.Title = "未采购";
        diag.URL = "${path}/assignTask_taskDetail?order.orderId="+orderId;
        diag.OKEvent = function(){
            var win = diag.innerFrame.contentWindow;
            var result = win.transportBuying();
            if(result == "success"){
                diag.close();
                window.location.href = "${path}/assignTask_tasks?query.orderType=2&query.orderState=1";
            }
        };
        diag.show();
        diag.okButton.value="马上采购";
    }
    function transportFinnish(orderId) {
        var diag = new Dialog();
        diag.Width = 850;
        diag.Height = 400;
        diag.ShowButtonRow=true;
        diag.Title = "采购中";
        diag.URL = "${path}/assignTask_taskDetail?order.orderId="+orderId;
        diag.OKEvent = function(){
            var win = diag.innerFrame.contentWindow;
            var result = win.transportFinish()
            if(result == "success"){
                diag.close();
                window.location.href = "${path}/assignTask_tasks?query.orderType=2&query.orderState=3";
            }

        };
        diag.show();
        diag.okButton.value="采购完成";
    }
</script>
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
			<span class="page_title">任务查询</span>
		</div>
	</div>
	<div class="content-text">
		<form action="${path}/assignTask_tasks" method="post">
			<input type="hidden" name="query.orderType" value="<s:property value="query.orderType"/>">
			<input id="orderState" type="hidden" name="query.orderState" value="<s:property value="query.orderState"/>">
			<div class="square-o-top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td width="8%">供&nbsp;应&nbsp;商:</td>
						<td width="29%">
							<s:select list="#suppliers" name="query.supplierId" cssStyle="width:137px" headerKey="" headerValue="----请-选-择----" listKey="supplierId" listValue="name"></s:select>
						</td>
						<td width="8%">发货方式:</td>
						<td width="45%">
							<s:select  list="#{'1':'自提','2':'送货'}" name="query.needs" cssStyle="width:137px"  headerKey="" headerValue="----请选择----" />
						</td>
						<td width=""><a id="query"> 
							<img src="${path}/images/can_b_01.gif" border="0" /> </a>
						</td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<ul>
					<li id="li1"><a href="${path}/assignTask_tasks?query.orderType=2&query.orderState=1" style="text-decoration: none;color: black">待采购</a></li>
					<li id="li2"><a href="${path}/assignTask_tasks?query.orderType=2&query.orderState=3" style="text-decoration: none;color: black">采购中</a></li>
				</ul>
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(${path}/images/table_bg.gif) repeat-x;">
						<td width="8%" height="30">订单类别</td>
						<td width="10%">供应商</td>
						<td width="14%">发货方式</td>
						<td width="6%">联系人</td>
						<td width="12%">联系方式</td>
						<td width="30%">地址</td>
						<td width="20%">操作</td>
					</tr>
					<s:iterator value="#page.list" var="order">
						<tr align="center" bgcolor="#FFFFFF">
							<td height="30"><e:orderTypetext orderType="${orderType}"/></td>
							<td><s:property value="#order.supplier.name"/></td>
							<td><s:property value="#order.supplier.needs==1?'自取':'送货'"/></td>
							<td><s:property value="#order.supplier.contact"/></td>
							<td><s:property value="#order.supplier.tel"/></td>
							<td align="left">&nbsp;<s:property value="#order.supplier.address"/></td>
							<td>
								<s:if test="#order.orderState == 1">
									<a  onclick="transportBuying(<s:property value="#order.orderId"/>)" href="javascript:void(0)"><img src="${path}/images/icon_3.gif"/>详情</a>
								</s:if>
								<s:else>
									<a onclick="transportFinnish(<s:property value="#order.orderId"/>)"  href="javascript:void(0)"><img src="${path}/images/icon_3.gif"/>详情</a>
								</s:else>
							</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</form>
	</div>
	<div class="content-bbg"></div>
</div>
