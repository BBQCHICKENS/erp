<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<script type="text/javascript">
    $(function() {

    });
    function submitForm(){
        var diag = new Dialog();
        //成功标识
        var result = "";
        var supplierName=  $('#supplierName').val();
        if(supplierName==""){
            Dialog.alert("供应商名称不能为空")
			return false;
		}
        var supplierAddress=  $('#supplierAddress').val();
        if(supplierAddress==""){
            Dialog.alert("供应商地址不能为空")
            return false;
        }
        var supplierContact=  $('#supplierContact').val();
        if(supplierContact==""){
            Dialog.alert("供应商联系人不能为空")
            return false;
        }
        var supplierTel=  $('#supplierTel').val();
        if(supplierTel==""){
            Dialog.alert("供应商联系电话不能为空")
            return false;
        }
		$("#supplierForm").ajaxSubmit({
			async:false,
			dataType:"text",
			success:function(responseText){
				//如果后台添加emp正确返回success
				result = responseText;
			}
		})
        return result;
    }
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">供应商管理</span>
		</div>
	</div>
	<div class="content-text">
		<div class="square-order">
			<form id="supplierForm" action="${path}/ajax_supplier_add" method="post">
  			<div style="border:1px solid #cecece;">
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				  <tr bgcolor="#FFFFFF">
				    <td>&nbsp;</td>
				  </tr>
				</table>
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">供应商名称</td>
				      <td width="82%" colspan="3">
						  <s:textfield name="supplier.name" type="text" size="82" id="supplierName"/>
				      </td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td colspan="4">&nbsp;</td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">供应商地址</td>
				      <td width="82%" colspan="3">
						  <s:textfield name="supplier.address" type="text" size="82" id="supplierAddress"/>
				      </td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td colspan="4">&nbsp;</td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">联系人</td>
				      <td width="32%">
						  <s:textfield name="supplier.contact" type="text" size="25" id="supplierContact"/>
				      </td>
				      <td width="18%" align="center">电话</td>
				      <td width="32%">
						  <s:textfield name="supplier.tel" type="text" size="25" id="supplierTel"/>
				      </td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td colspan="4">&nbsp;</td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">送货方式</td>
				      <td width="32%">
						  <s:select  style="width:190px" list="#{'1':'自取','2':'送货'}" name="supplier.needs"></s:select>
				      </td>
				      <td width="18%" align="center">&nbsp;</td>
				      <td width="32%">
				      	&nbsp;
				      </td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td colspan="4">&nbsp;</td>
				    </tr>
				</table>
			</div>
			</form>
		</div><!--"square-order"end-->
	</div><!--"content-text"end-->
	<div class="content-bbg"><img src="${path}/images/content_bbg.jpg" /></div>
</div>
