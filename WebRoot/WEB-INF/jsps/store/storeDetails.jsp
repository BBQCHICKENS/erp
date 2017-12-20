<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<span class="page_title">仓库货物明细</span>
		</div>
	</div>
	<div class="content-text">
			<!--"square-o-top"end-->
			<div class="square-order">
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(${path}/images/table_bg.gif) repeat-x;">
						<td width="25%" height="30">仓库名称</td>
						<td width="25%">仓库管理员</td>
						<td width="25%">货物名称</td>
						<td width="25%">当前库存量</td>
					</tr>
					 <s:iterator value="store.detailSet" var="detail">
						 <tr align="center" bgcolor="#FFFFFF">
							 <td height="30"><s:property value="#detail.store.name"/></td>
							 <td><s:property value="#detail.store.emp.name"/></td>
							 <td><s:property value="#detail.product.name"/></td>
							 <td><s:property value="#detail.num"/>&nbsp;<s:property value="#detail.product.unit"/></td>
						 </tr>
					 </s:iterator>
				</table>
			</div>
	</div>
	<div class="content-bbg"></div>
</div>
