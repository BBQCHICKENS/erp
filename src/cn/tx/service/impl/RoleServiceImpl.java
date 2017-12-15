package cn.tx.service.impl;

import cn.tx.dao.RoleDao;
import cn.tx.model.Role;
import cn.tx.query.RoleQuery;
import cn.tx.service.RoleService;

public class RoleServiceImpl extends BaseServiceImpl<Role, RoleQuery> implements RoleService {

	
	private RoleDao roleDao;
	
	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
		this.baseDao = roleDao;
	}
	@Override
	public Role getRoleByRoleName(String roleName) {
		return roleDao.getRoleByRoleName(roleName);
	}
}
