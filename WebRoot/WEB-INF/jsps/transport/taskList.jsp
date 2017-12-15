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
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">商品运输管理</span>
		</div>
	</div>
	<div class="content-text">
		<form action="taskList.jsp" method="post"> 
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
						<td><td><s:textfield name="query.orderCreater.name" type="text" size="10" /></td></td>
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
							<s:select  list="#{'1':'送货','2':'自提'}" name="query.supplier.needs" cssStyle="width:115px"  headerKey="" headerValue="----请选择----" />
						</td>
						<td>审核人:</td>
						<td><td><s:textfield name="query.orderChecker.name" type="text" size="10" /></td></td>
						<td>跟单人:</td>
						<td><input type="text" size="10" /></td>
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
						<tr align="center" bgcolor="#FFFFFF">
							<td height="30">采购</td>
							<td>2014-01-01</td>
							<td>张三</td>
							<td>2014-01-04</td>
							<td>李四</td>
							<td>七匹狼</td>
							<td>自提</td>
							<td>
									<img src="${path}/images/icon_3.gif" />
									<span style="line-height:12px; text-align:center;"> 
										<a href="assignTask.jsp" class="xiu">任务指派
										</a> 
									</span>
							</td>
						</tr>
						<tr align="center" bgcolor="#FFFFFF">
							<td height="30">采购</td>
							<td>2014-01-01</td>
							<td>张三</td>
							<td>2014-01-04</td>
							<td>李四</td>
							<td>七匹狼</td>
							<td>自提</td>
							<td>
									张送货
							</td>
						</tr>
						<tr align="center" bgcolor="#FFFFFF">
							<td height="30">采购</td>
							<td>2014-01-01</td>
							<td>张三</td>
							<td>2014-01-04</td>
							<td>李四</td>
							<td>七匹狼</td>
							<td>自提</td>
							<td>
									<img src="${path}/images/icon_3.gif" />
									<span style="line-height:12px; text-align:center;"> 
										<a href="${path}/transport/assignTask.jsp" class="xiu">任务指派
										</a> 
									</span>
							</td>
						</tr>
				</table>
			</div>
		</form>
	</div>
	<div class="content-bbg"></div>
</div>
