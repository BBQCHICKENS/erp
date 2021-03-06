package cn.tx.dao.impl;

import org.apache.commons.lang.StringUtils;

import cn.tx.dao.StoreDetailDao;
import cn.tx.model.StoreDetail;
import cn.tx.query.StoreDetailQuery;

public class StoreDetailDaoImpl extends BaseDaoImpl<StoreDetail, StoreDetailQuery> implements StoreDetailDao {

	@Override
	public String createHql(StoreDetailQuery q) {
		String hql = "from StoreDetail t where 1=1 ";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCount(StoreDetailQuery q) {
	    String hql = "from StoreDetail t where 1=1 ";
		hql = hql + createHqlCondition(q);
		return null;
	}

	@Override
	public String createHqlCondition(StoreDetailQuery q) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
