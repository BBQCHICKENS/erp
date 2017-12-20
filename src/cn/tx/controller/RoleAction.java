package cn.tx.controller;

import java.io.IOException;
import java.util.*;

import cn.tx.model.Menu;
import cn.tx.model.Role;
import cn.tx.query.RoleQuery;
import cn.tx.service.MenuService;
import cn.tx.service.RoleService;
import cn.tx.utils.Page;

import com.opensymphony.xwork2.ActionContext;
import net.sf.json.JSONArray;

public class RoleAction extends BaseAction {
	
	/**
	 * 接收查询对象
	 */
	private RoleQuery query = new RoleQuery();
	private  Role role = new Role();
	private String permIds;


	public void setPermIds(String permIds) {
		this.permIds = permIds;
	}

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

	private MenuService menuService;

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

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
	public String role_update(){
		role=this.roleService.getObj(this.role.getRoleId());
		return SUCCESS;
	}
	public String role_assignAuthority(){
		Role actionRole = this.roleService.getObj(this.role.getRoleId());
		Set<Menu> menus1 = actionRole.getMenus();
		//获取最外层的菜单栏
		Menu menu = menuService.getObj(1);
		Set<Menu> menus = menu.getMenus();
		List<Map<String,Object>> list =new ArrayList<Map<String,Object>>();
    	getRoleAuthority(menus1,menus,list);
		JSONArray jsonArray = JSONArray.fromObject(list);
		ActionContext actionContext =ActionContext.getContext();
		actionContext.put("zNodes",jsonArray);
		System.out.println(jsonArray);
		return SUCCESS;
	}
	/**
	 * { id:1, pId:0, name:"随意勾选 1", open:true},
	 * { id:11, pId:1, name:"随意勾选 1-1", open:true},
	 * @param menus
	 * @param list
	 */

	public  void getRoleAuthority(Set<Menu> menus1,Set<Menu> menus,List<Map<String,Object>> list){
		  if(menus!=null && menus.size()>0){
			  for (Menu menu:menus) {
				    Map<String,Object> map =new HashMap<String,Object>();
				    if(menus1!=null && menus1.size()>0){
				  	  for (Menu menu1:menus1) {
				  		  if(menu1.getMenuId() == menu.getMenuId()){
				  			  map.put("checked",true);
				  			  break;
				  		  }
				  	  }
				    }
				    map.put("id",menu.getMenuId());
				    map.put("pId",menu.getParentMenuId());
				    map.put("name",menu.getName());
				    list.add(map);
				    Set<Menu> menuMenus = menu.getMenus();
				    getRoleAuthority(menus1,menuMenus,list);
			  }
		  }
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

	public void ajax_role_grantPerm() throws IOException {
		roleService.updateGrantPerm(query.getRoleId(), permIds);
		response.getWriter().write("success");
	}
}
