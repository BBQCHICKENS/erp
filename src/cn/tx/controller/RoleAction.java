package cn.tx.controller;

import java.util.List;

import cn.tx.model.Role;
import cn.tx.query.RoleQuery;
import cn.tx.service.RoleService;
import cn.tx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class RoleAction extends BaseAction {
	
	/**
	 * 接收查询对象
	 */
	private RoleQuery query = new RoleQuery();
	private  Role role = new Role();

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	public RoleQuery getQuery() {
		return query;
	}

	public void setQuery(RoleQuery query) {
		this.query = query;
	}

	private RoleService roleService;
	
	
	
	
	
	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}


	public String role_list(){
	
		ActionContext context = ActionContext.getContext();
		Integer pageNo = query.getPageNo();
		if(pageNo == null ){
			query.setPageNo(1);
		}
		//查询数据
		Page page = roleService.queryObjByCondition(query, exclude);
		context.put("page", page);
		return SUCCESS;
	}
	
	public String role_input(){
		return SUCCESS;
	}

	public void ajax_role_add() throws Exception{
		this.roleService.save(role);
		this.response.getWriter().write("success");
	}
	public void ajax_role_update() throws Exception{
		this.roleService.update(role);
		this.response.getWriter().write("success");
	}
	//角色名是否重复
	public void ajax_role_validRoleName() throws Exception{
		String result ="yes";
		role = this.roleService.getRoleByRoleName(role.getName());
		//角色名已经存在了
		if(role!=null){
			result ="no";
		}
		this.response.getWriter().write(result);
	}

}
