package cn.tx.controller;

import cn.tx.model.*;
import cn.tx.query.OrderModelQuery;
import cn.tx.service.OrderModelService;
import cn.tx.service.ProductService;
import cn.tx.service.SupplierService;
import cn.tx.utils.ERPConstants;
import cn.tx.utils.Page;
import com.opensymphony.xwork2.ActionContext;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

public class AssignTaskAction extends BaseAction {
	
	
	private OrderModelQuery query = new OrderModelQuery();
	
	
	private OrderModel order = new OrderModel();
	
	private SupplierService supplierService;
	

	private ProductService productService;
	
	
	
	
	
	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public SupplierService getSupplierService() {
		return supplierService;
	}

	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}



	public OrderModel getOrder() {
		return order;
	}

	public void setOrder(OrderModel order) {
		this.order = order;
	}

	public OrderModelQuery getQuery() {
		return query;
	}

	public void setQuery(OrderModelQuery query) {
		this.query = query;
	}

	private OrderModelService orderModelService;

	public OrderModelService getOrderModelService() {
		return orderModelService;
	}

	public void setOrderModelService(OrderModelService orderModelService) {
		this.orderModelService = orderModelService;
	}



	//运输任务的纸牌页面
	public  String assignTask_assignTask(){

		return SUCCESS;
	}

	/**
	 * 任务指派界面，查看审核通过的订单列表 statsu=2
	 * @return
	 */
	public String assignTask_taskList(){
		ActionContext context = ActionContext.getContext();
		Integer pageNo = query.getPageNo();
		if(pageNo == null ){
			query.setPageNo(1);
		}
		//只查询审核通过的单子
		query.setOrderState(2);
		exclude.add("orderCreater");
		exclude.add("supplier");
		exclude.add("logs");
		Page page = orderModelService.queryObjByCondition(query, exclude);
		context.put("page", page);
		//查询所有的供应商
		List<Supplier> suppliers = supplierService.list();
		context.put("suppliers", suppliers);
		return SUCCESS;
	}

	public String orderModel_auditText(){
		return SUCCESS;
	}
	
	public String orderModel_input(){
		ActionContext context = ActionContext.getContext();
		
		//查询所有的供应商
		List<Supplier> suppliers = supplierService.list();
		context.put("suppliers", suppliers);
		
		return SUCCESS;
	}
	
	public String orderModel_orderDetail(){
		order = orderModelService.getObj(query.getOrderId());
		return SUCCESS;
	}
	
	
}
