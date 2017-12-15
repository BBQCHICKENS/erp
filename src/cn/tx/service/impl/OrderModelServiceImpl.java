package cn.tx.service.impl;

import cn.tx.dao.ConsoleLogDao;
import cn.tx.dao.OrderModelDao;
import cn.tx.model.ConsoleLog;
import cn.tx.model.Emp;
import cn.tx.model.OrderModel;
import cn.tx.query.OrderModelQuery;
import cn.tx.service.OrderModelService;

import java.sql.Timestamp;
import java.util.Date;

public class OrderModelServiceImpl extends BaseServiceImpl<OrderModel, OrderModelQuery> implements OrderModelService {

	
	private OrderModelDao orderModelDao;

	private ConsoleLogDao consoleLogDao;

	public void setConsoleLogDao(ConsoleLogDao consoleLogDao) {
		this.consoleLogDao = consoleLogDao;
	}

	public void setOrderModelDao(OrderModelDao orderModelDao) {
		this.orderModelDao = orderModelDao;
		this.baseDao = orderModelDao;
	}

	@Override
	public void submitOrder(OrderModel order) {
		
		orderModelDao.save(order);
	}

	@Override
	public void updateExamineOrder(OrderModel orderModel, Emp emp, String note) {
		//修改订单信息
		this.orderModelDao.update(orderModel);
		//添加记录表
		ConsoleLog consoleLog =new ConsoleLog();
		consoleLog.setNote(note);
//		consoleLog.setEmpId(emp.getEmpId());
		consoleLog.setTableName("order_model");
		consoleLog.setEntityId(orderModel.getOrderId());
		consoleLog.setOptTime(new Timestamp(new Date().getTime()));
		consoleLog.setOptType("审核订单");
		consoleLog.setOrderChecker(emp);
		this.consoleLogDao.save(consoleLog);
	}


}
