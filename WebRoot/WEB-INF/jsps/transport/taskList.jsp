<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<script type="text/javascript">
	$(function() {
		$("#query").click(function() {
			$("[name='pageNum']").val(1);
			$("form:first").submit();
		});
	});
	function assignCompeter() {
        var orderId =$('#orderId').val();
        var diag = new Dialog();
        diag.Width = 850;
        diag.Height = 400;
        diag.ShowButtonRow=true;
        diag.Title = "指派任务";
        diag.URL = "${path}/assignTask_assignTask?order.orderId="+orderId;
        diag.OKEvent = function(){
            var win = diag.innerFrame.contentWindow;
            var result = win.assignEmp()
            if(result == "success"){
                diag.close();
                window.location.href = "${path}/assignTask_taskList?query.orderType=1&query.orderState=2";
            }

        };
        diag.show();
    }
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">商品运输管理</span>
		</div>
	</div>
	<div class="content-text">
		<form action="${path}/assignTask_taskList" method="post">
            <input type="hidden" name="query.orderType" value="1">
            <input type="hidden" name="query.orderState" value="2">
			<div class="square-o-top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td>下单时间:</td>
						<td>
							<s:textfield name="query.minCreateTime" type="text" size="10" onfocus="c.showMoreDay=false;c.show(this);" readonly="true"/>
						</td>
						<td>到</td>
						<td>
							<s:textfield name="query.maxCreateTime" type="text" size="10" onfocus="c.showMoreDay=false;c.show(this);" readonly="true"/>
						</td>
						<td>供&nbsp;应&nbsp;商:</td>
						<td>
							<s:select list="#suppliers" name="query.supplierId" cssStyle="width:115px" headerKey="" headerValue="----请-选-择----" listKey="supplierId" listValue="name"></s:select>
						</td>
						<td>下单人:</td>
						<td><td><s:textfield name="query.createrName" type="text" size="10" /></td></td>
						<td>&nbsp;</td>
						<td><a id="query"> 
							<img src="${path}/images/can_b_01.gif" border="0" /> </a>
						</td>
					</tr>
					<tr>
						<td>审核时间:</td>
						<td>
							<s:textfield name="query.minCheckTime" type="text" size="10" onfocus="c.showMoreDay=false;c.show(this);" readonly="true"/>
						</td>
						<td>到</td>
						<td>
							<s:textfield name="query.maxCheckTime" type="text" size="10" onfocus="c.showMoreDay=false;c.show(this);" readonly="true"/>
						</td>

						<td>发货方式:</td>
						<td>
							<s:select  list="#{'1':'自提','2':'送货'}" name="query.needs" cssStyle="width:115px"  headerKey="" headerValue="----请选择----" />
						</td>
						<td>审核人:</td>
						<td><td> <s:textfield name="query.checkterName" type="text" size="10" /> <td></td>
					<%--	<td>跟单人:</td>
						<td><td><s:textfield name="query.compterName" type="text" size="10" /><td></td>--%>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(${path}/images/table_bg.gif) repeat-x;">
						<td width="10%" height="30">订单类别</td>
						<td width="13%">下单时间</td>
						<td width="13%">制单人</td>
						<td width="13%">审核时间</td>
						<td width="13%">审核人</td>
						<td width="15%">供应商</td>
						<td width="13%">发货方式</td>
						<td width="10%">跟单人</td>
					</tr>

                    <s:iterator value="#page.list" var="order">
                        <tr align="center" bgcolor="#FFFFFF">
							<c:set var="orderType" value="${order.orderType}"/>
                            <td height="30"><e:orderTypetext orderType="${orderType}"/></td>
                            <td><s:property value="#order.createTime"/></td>
                            <td><s:property value="#order.orderCreater.name"/></td>
                            <td><s:property value="#order.checkTime"/></td>
                            <td><s:property value="#order.orderChecker.name"/></td>
                            <td><s:property value="#order.supplier.name"/></td>
                            <td><s:property value="#order.supplier.needs==1?'自取':'送货'"/></td>
                            <td>
							  <img src="${path}/images/icon_3.gif" />
								<input value="<s:property value="#order.orderId"/>" type="hidden" id="orderId"/>
							    <span style="line-height:12px; text-align:center;"> <a onclick="assignCompeter()" href="javascript:void(0)" class="xiu">任务指派</a></span>
							</td>
                        </tr>
                    </s:iterator>
				</table>
                <%@ include file="../tools/paging.jsp"%>
			</div>
		</form>
	</div>
	<div class="content-bbg"></div>
</div>
