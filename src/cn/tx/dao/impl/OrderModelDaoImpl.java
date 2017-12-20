package cn.tx.dao.impl;

import org.apache.commons.lang.StringUtils;

import cn.tx.dao.OrderModelDao;
import cn.tx.model.OrderModel;
import cn.tx.query.OrderModelQuery;

public class OrderModelDaoImpl extends BaseDaoImpl<OrderModel, OrderModelQuery> implements OrderModelDao {

	@Override
	public String createHql(OrderModelQuery equery) {
		String hql = "from OrderModel t where 1=1 ";
		hql = hql + createHqlCondition(equery)+" order by orderId desc";
		return hql;
	}

	@Override
	public String createHqlCount(OrderModelQuery q) {
		String hql = "select count(orderId) from OrderModel t where 1=1 ";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCondition(OrderModelQuery q) {
		String hql = "";
		if(StringUtils.isNotBlank(q.getCreaterName())){
			hql = hql + " and t.orderCreater.name like :createrName";
		}
        if(StringUtils.isNotBlank(q.getCompterName())){
            hql = hql + " and t.orderCompleter.name like :compterName";
        }
        if(StringUtils.isNotBlank(q.getCheckterName())){
            hql = hql + " and t.orderChecker.name like :checkterName";
        }
		if(q.getMinTotalNum() != null){
			hql = hql + " and t.totalNum >= :minTotalNum";
		}
		if(q.getMaxTotalNum() != null){
			hql = hql + " and t.totalNum <= :maxTotalNum";
		}
		if(q.getMinCreateTime() != null){
			hql = hql + " and t.createTime >= :minCreateTime";
		}
		if(q.getMaxCreateTime() != null){
			hql = hql + " and t.createTime <= :maxCreateTime";
		}
		if(q.getMinTotalPrice() != null){
			hql = hql + " and t.totalPrice >= :minTotalPrice";
		}
		if(q.getMaxTotalPrice() != null){
			hql = hql + " and t.totalPrice <= :maxTotalPrice";
		}
		if(q.getOrderType() != null){
			hql = hql + " and t.orderType = :orderType";
		}
		if(q.getOrderState() != null){
			hql = hql + " and t.orderState = :orderState";
		}
		if(q.getCheckTime()!= null){
			hql = hql + " and t.checkTime >= :minCheckTime";
		}
		if(q.getCheckTime() != null){
			hql = hql + " and t.checkTime <= :maxCheckTime";
		}
        if(q.getSupplierId() != null){
            hql = hql + " and t.supplier.supplierId = :supplierId";
        }
        if(q.getNeeds()!= null){
            hql = hql + " and t.supplier.needs = :needs";
        }
		if(q.getCompleter()!= null){
			hql = hql + " and t.orderCompleter.empId = :completer";
		}
		if(StringUtils.isNotBlank(q.getOrderNum())){
			hql = hql + " and t.orderNum = :orderNum";
		}
		return hql;
	}
}
