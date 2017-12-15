<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<script type="text/javascript">
	$(function() {
		$("#query").click(function() {
			$("[name='pageNum']").val(1);
			$("form:first").submit();
		});
        $("#addRole").click(function() {
            var diag = new Dialog();
            diag.Width = 850;
            diag.Height = 400;
            diag.ShowButtonRow=true;
            diag.Title = "添加角色";
            diag.URL = "${path}/role_input";
            diag.OKEvent = function(){
                var win = diag.innerFrame.contentWindow;
                //调用提交表单的方法获得返回值
                var result = win.submitForm();
                //如果成功页面要刷新
                if(result == "success"){
                    diag.close();
                    window.location.href = "${path }/emp_list";
                }
            };
            diag.show();
        });

	});
	function showMsg(msg,uuid){
		//top.document.getElementById("context-msg").style.display = "block";
		top.$('context-msg').style.display = "block";
		top.$('context-msg-text').innerHTML=msg;
		top.$('hid-action').value="actionName";
		top.lock.show();
	}
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">角色管理</span>
		</div>
	</div>
	<div class="content-text">
		<form  action="${path}/role_list" method="post">
			<div class="square-o-top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td width="68" height="30">&nbsp;</td>
						<td width="123">&nbsp;</td>
						<td width="62">角色名称</td>
						<td width="142">
							<s:textfield name="query.name"  type="text" size="18"/>
						</td>
						<td width="60">角色编码</td>
						<td width="149">
							<s:textfield name="query.code"  type="text" size="18"/>
						</td>
						<td width="70"><a id="query"> <img src="${path}/images/can_b_01.gif" border="0" /> </a></td>
						<td width="70"><a id="addRole"><img src="${path}/images/can_b_02.gif" border="0" /></a></td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(${path}/images/table_bg.gif) repeat-x;">
						<td width="40%" height="30">角色名称</td>
						<td width="40%">角色编码</td>
						<td width="20%">操作</td>
					</tr>
					<s:iterator value="#page.list" var="role">
					<tr align="center" bgcolor="#FFFFFF">
						<td height="30"><s:property value="#role.name"/></td>
						<td><s:property value="#role.code"/></td>
						<td>
							<img src="${path}/images/icon_3.gif" /> 
							<span style="line-height:12px; text-align:center;"> 
								<a href="./input.jsp" class="xiu">修改</a>
							</span> 
							<img src="${path}/images/icon_04.gif" /> 
							<span style="line-height:12px; text-align:center;"> 
								<a href="javascript:void(0)" class="xiu" onclick="showMsg('是否删除该项数据？',318)">删除</a>
							</span>
						</td>
					</tr>
					</s:iterator>
					
				</table>
				<%@ include file="../tools/paging.jsp" %>
			</div>
		</form>
	</div>
	<div class="content-bbg"></div>
</div>
