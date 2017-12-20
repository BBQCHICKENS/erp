<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<script type="text/javascript">
	function submitForm() {
        //成功标识
        var result = "";
        var isOk = validForm();
        if(isOk=="yes"){
            //$("#empForm").submit();
            $("#roleForm").ajaxSubmit({
                async:false,
                dataType:"text",
                success:function(responseText){
                    //如果后台添加emp正确返回success
                    result = responseText;
                }
            })
        }else{
            Dialog.alert("角色已经存在了")
        }
        return result;
    }
    function validForm() {
        var roleName =$('#roleName').val();
        var result = "yes";
        $.ajax({
            url:"${path}/ajax_role_validRoleName",
            type:"post",
            data:{
                "role.name":roleName
            },
            async:false,
            dataType:"text",
            success:function(responseText){
                result = responseText;
            }
        })
        return result;
    }
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">角色管理</span>
		</div>
	</div>
	<div class="content-text" style="height: 60px">
		<div class="square-order">
			<form id="roleForm" action="${path}/ajax_role_add" method="post">
  			<div>
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				    <tr  bgcolor="#f3ffe3">
				      <td width="18%" height="30" align="center">角色名称</td>
				      <td width="32%">
						  <s:textfield id="roleName" name="role.name" type="text" size="25"/>
				      </td>
				      <td width="18%" align="center">角色编码</td>
				      <td width="32%">
						  <s:textfield name="role.code" type="text" size="25"/>
				      </td>
				    </tr>
				</table>
			</div>
			</form>
		</div><!--"square-order"end-->
	</div><!--"content-text"end-->
	<div class="content-bbg"><img src="${path}/images/content_bbg.jpg" /></div>
</div>
