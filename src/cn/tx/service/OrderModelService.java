package cn.tx.service;

import cn.tx.model.Emp;
import cn.tx.model.OrderModel;
import cn.tx.query.OrderModelQuery;

public interface OrderModelService extends BaseService<OrderModel, OrderModelQuery> {
	
	public void submitOrder(OrderModel order);
	//产品审核
	public void updateExamineOrder(OrderModel orderModel, Emp emp,String note);

	//分配运输任务
	public  void updateOrderAssign(OrderModel orderModel);

}
