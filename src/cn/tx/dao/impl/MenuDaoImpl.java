package cn.tx.dao.impl;

import org.apache.commons.lang.StringUtils;

import cn.tx.dao.MenuDao;
import cn.tx.model.Menu;
import cn.tx.query.MenuQuery;

import java.util.List;

public class MenuDaoImpl extends BaseDaoImpl<Menu, MenuQuery> implements MenuDao {

	@Override
	public String createHql(MenuQuery q) {
		String hql = "from Menu t where 1=1 ";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCount(MenuQuery q) {
	    String hql = "select count(menuId) from Menu t where 1=1 ";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCondition(MenuQuery q) {
		String hql = "";
		if(StringUtils.isNotBlank(q.getName())){
			hql = hql + " and t.name like :name";
		}
		if(q.getParentMenuId()!=null){
			hql = hql + " and t.parentMenuId = :parentMenuId";
		}
		if(q.getLevel()!=null){
		    hql=hql+" and t.level = :level";
        }
		return hql;
	}
}
