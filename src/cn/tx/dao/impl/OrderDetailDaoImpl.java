package cn.tx.dao.impl;

import org.apache.commons.lang.StringUtils;

import cn.tx.dao.OrderDetailDao;
import cn.tx.model.OrderDetail;
import cn.tx.query.OrderDetailQuery;

public class OrderDetailDaoImpl extends BaseDaoImpl<OrderDetail, OrderDetailQuery> implements OrderDetailDao {

	@Override
	public String createHql(OrderDetailQuery equery) {
		String hql = "from OrderDetail t where 1=1 ";
		
		return hql;
	}

	@Override
	public String createHqlCount(OrderDetailQuery q) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String createHqlCondition(OrderDetailQuery q) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
