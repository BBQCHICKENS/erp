package cn.tx.dao.impl;

import org.apache.commons.lang.StringUtils;

import cn.tx.dao.MenuDao;
import cn.tx.model.Menu;
import cn.tx.query.MenuQuery;

public class MenuDaoImpl extends BaseDaoImpl<Menu, MenuQuery> implements MenuDao {

	@Override
	public String createHql(MenuQuery q) {
		String hql = "from Menu t where 1=1 ";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCount(MenuQuery q) {
	    String hql = "from Menu t where 1=1 ";
		hql = hql + createHqlCondition(q);
		return null;
	}

	@Override
	public String createHqlCondition(MenuQuery q) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
