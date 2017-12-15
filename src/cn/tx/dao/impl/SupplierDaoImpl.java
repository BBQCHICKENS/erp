package cn.tx.dao.impl;

import org.apache.commons.lang.StringUtils;

import cn.tx.dao.SupplierDao;
import cn.tx.model.Supplier;
import cn.tx.query.SupplierQuery;

public class SupplierDaoImpl extends BaseDaoImpl<Supplier, SupplierQuery> implements SupplierDao {

	@Override
	public String createHql(SupplierQuery q) {
		String hql = "from Supplier t where 1=1 ";
		hql = hql + createHqlCondition(q)+" order by supplierId desc";
		return hql;
	}

	@Override
	public String createHqlCount(SupplierQuery q) {
		String hql = "select count(supplierId) from Supplier t where 1=1 ";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCondition(SupplierQuery q) {
		String hql = "";
		if(StringUtils.isNotBlank(q.getName())){
			hql = hql + " and t.name like :name";
		}
		if(StringUtils.isNotBlank(q.getTel())){
			hql = hql + " and t.tel like :tel";
		}
		if(StringUtils.isNotBlank(q.getContact())){
			hql = hql + " and t.contact like :contact";
		}
		if(q.getNeeds()!=null){
			hql = hql + " and t.needs = :needs";
		}
		return hql;
	}

	
	

}
