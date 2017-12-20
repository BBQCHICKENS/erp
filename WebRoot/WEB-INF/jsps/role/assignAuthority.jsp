<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<link rel="stylesheet" href="${path}/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script>
	var tree;
    var setting = {
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        }
    };
    var zNodes =${zNodes};
    $(document).ready(function(){
        tree=$.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });

    function getNodes(roleId){
        var nodes = tree.getCheckedNodes(true);
        var permIds = "";
        for(var i = 0; i < nodes.length; i++){
            permIds = permIds + nodes[i].id+",";
        }

        var result = grantRolePerm(roleId, permIds);
        return result;

    }
    function grantRolePerm(roleId, permIds){
        var result = "";
        $.ajax({
            url:"${path}/ajax_role_grantPerm",
            type:"post",
            data:{
                "query.roleId":roleId,
                "permIds":permIds
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
      <div class="content-text" style="width: 300px; height: 500px; overflow-y:scroll; overflow-x:hidden;">
      	<div class="zTreeDemoBackground left" style="width: 300px">
      		<ul id="treeDemo" class="ztree"></ul>
      	</div>
      </div>

