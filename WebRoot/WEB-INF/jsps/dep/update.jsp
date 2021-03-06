<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<script type="text/javascript">
	$(function() {
		$("#commit").click(function() {
			$("form:first").submit();
		});
	});
    function submitForm(){
        var diag = new Dialog();
        //成功标识
        var result = "";
        var isOk = validForm();
        if(isOk=="yes"){
            $("#depForm").ajaxSubmit({
                async:false,
                dataType:"text",
                success:function(responseText){
                    //如果后台添加emp正确返回success
                    result = responseText;
                }
            })
        }else{
            Dialog.alert("部门已经存在了")
		}
        return result;
    }
    function validForm() {
		var result="yes";
        var  depName =$('#depName').val();
        var  deptInput =$('#dept_input').val();
        if(depName != deptInput){
             //校验部门名称
            $.ajax({
                url:"${path}/ajax_dep_validName",
                type:"post",
                data:{
                    "dep.name":deptInput
                },
                async:false,
                dataType:"text",
                success:function(responseText){
                    result = responseText;
                }
            })
		}
		return result;
    }
</script>
	<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">部门管理</span>
		</div>
	</div>
	<div class="content-text">
		<div class="square-order">
			<form id="depForm" action="${path}/ajax_dep_update" method="post">
				<!-- 为了校验用户名不合自己重复 -->
				<input id="depName" type="hidden" value="<s:property value="dep.name"/>">
				<input  type="hidden" name="dep.depId" value="<s:property value="dep.depId"/>">
  			<div style="border:1px solid #cecece;">
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				  <tr bgcolor="#FFFFFF">
				    <td>&nbsp;</td>
				  </tr>
				</table>
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">部门名称</td>
				      <td width="32%">
						  <s:textfield name="dep.name" size="25" type="text" id="dept_input"/>
				      </td>
				      <td width="18%" align="center">电话</td>
				      <td width="32%">
						  <s:textfield name="dep.tel" size="25" type="text"/>
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
