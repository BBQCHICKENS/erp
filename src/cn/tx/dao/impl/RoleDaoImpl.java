package cn.tx.dao.impl;

import org.apache.commons.lang.StringUtils;

import cn.tx.dao.RoleDao;
import cn.tx.model.Role;
import cn.tx.query.RoleQuery;

import java.util.List;

public class RoleDaoImpl extends BaseDaoImpl<Role, RoleQuery> implements RoleDao {

	@Override
	public String createHql(RoleQuery equery) {
		String hql = "from Role t where 1=1 ";
		hql = hql + createHqlCondition(equery)+" order by roleId desc";
		return hql;
	}

	@Override
	public String createHqlCount(RoleQuery q) {
		String hql = "select count(roleId) from Role t where 1=1 ";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCondition(RoleQuery q) {
		String hql = "";
		if(StringUtils.isNotBlank(q.getName())){
			hql = hql + " and t.name like :name";
		}
		if(StringUtils.isNotBlank(q.getCode())){
			hql = hql + " and t.code like :code";
		}
		return hql;
	}


	@Override
	public Role getRoleByRoleName(String roleName) {
		Role role=null;
		String hql="from Role r where r.name = ?";
		List list = this.getHibernateTemplate().find(hql, roleName);
		if(list.size()>0){
			role= (Role) list.get(0);
		}
		return role;
	}
}
