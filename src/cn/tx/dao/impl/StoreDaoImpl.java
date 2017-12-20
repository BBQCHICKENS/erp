package cn.tx.dao.impl;

import org.apache.commons.lang.StringUtils;

import cn.tx.dao.StoreDao;
import cn.tx.model.Store;
import cn.tx.query.StoreQuery;

public class StoreDaoImpl extends BaseDaoImpl<Store, StoreQuery> implements StoreDao {

	@Override
	public String createHql(StoreQuery q) {
		String hql = "from Store t where 1=1 ";
		hql = hql + createHqlCondition(q)+" order by storeId desc";
		return hql;
	}

	@Override
	public String createHqlCount(StoreQuery q) {
	    String hql = "select count(storeId) from Store t where 1=1 ";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCondition(StoreQuery q) {
		String hql = "";
		if(StringUtils.isNotBlank(q.getName())){
			hql = hql + " and t.name like :name";
		}
		if(StringUtils.isNotBlank(q.getEmpName())){
			hql = hql + " and t.emp.name like :empName";
		}
		return hql;
	}
	

}
