<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<script type="text/javascript">
        function inStoreProduct1(storeDetailId,productId) {
            var result ='';
			var storeId = $('#storeId').val();
			var storeNum =$('#storeNum').val();
            $.ajax({
                url:"${path}/ajax_store_updateInStoreStatus",
                type:"post",
                data:{
                    "store.storeId":storeId,
					"storeNum":storeNum,
					"storeDetailId":storeDetailId,
				    "productId":productId
                },
                async:false,
                dataType:"text",
                success:function(responseText){
                    result=responseText;
                }
            })

           return result;
        }

</script>
<style>

</style>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">入库</span>
		</div>
	</div>
	<div class="content-text">
			<div class="square-o-top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td width="10%">仓库列表:</td>
						<td width="40%">
						   <s:select id="storeId" list="#storeList" listValue="name" listKey="storeId"></s:select>
						</td>
						<td width="10%">入库数量:</td>
						<td width="25%"><s:textfield  id="storeNum" size="20"/></td>
					</tr>
				</table>
			</div>
	</div>
	<div class="content-bbg"></div>
</div>
