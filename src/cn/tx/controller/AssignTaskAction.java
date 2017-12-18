package cn.tx.controller;

import cn.tx.model.*;
import cn.tx.query.OrderModelQuery;
import cn.tx.service.EmpService;
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

	private EmpService empService;

	public EmpService getEmpService() {
		return empService;
	}

	public void setEmpService(EmpService empService) {
		this.empService = empService;
	}

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

	//运输任务的指派页面
	public  String assignTask_assignTask(){
		//查询订单详情
		order =this.orderModelService.getObj(this.order.getOrderId());
		//查询运输部部门的全部人员
		List<Emp> empByDept = this.empService.getEmpByDept(2);
		ActionContext context = ActionContext.getContext();
		context.put("emp", empByDept);
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
		//只查询审核通过的单子;
		exclude.add("supplier");
		exclude.add("logs");
		Page page = orderModelService.queryObjByCondition(query, exclude);
		context.put("page", page);
		//查询所有的供应商
		List<Supplier> suppliers = supplierService.list();
		context.put("suppliers", suppliers);
		return SUCCESS;
	}
	//运输任务查询页面，运输人员查询的界面
	public String assignTask_tasks(){
		ActionContext context = ActionContext.getContext();
		Integer pageNo = query.getPageNo();
		if(pageNo == null ){
			query.setPageNo(1);
		}
		Map<String, Object> session = context.getSession();
		Emp emp = (Emp) session.get("user");
		query.setCompleter(emp.getEmpId());
		//只查询审核通过的单子;
		exclude.add("supplier");
		exclude.add("logs");
		Page page = orderModelService.queryObjByCondition(query, exclude);
		context.put("page", page);
		//查询所有的供应商
		List<Supplier> suppliers = supplierService.list();
		context.put("suppliers", suppliers);
		return SUCCESS;
	}
	public String assignTask_taskDetail(){
		 order = this.orderModelService.getObj(this.order.getOrderId());
		 return SUCCESS;
	}
	//订单修改成采购中
	public void ajax_assignTask_buying() throws  Exception{
		order = this.orderModelService.getObj(this.order.getOrderId());
		order.setOrderState(Integer.valueOf(ERPConstants.ORDER_TYPE_TRANS_BUYING));
		this.orderModelService.update(order);
		this.response.getWriter().write("success");
	}

	//订单修改成完成采购,修改成入库单
	public void ajax_assignTask_transportFinish() throws  Exception{
		order = this.orderModelService.getObj(this.order.getOrderId());
		order.setOrderState(Integer.valueOf(ERPConstants.ORDER_TYPE_INSTOCK_WAIT));
		order.setOrderType(Integer.valueOf(ERPConstants.ORDER_TYPE_INSTOCK));
		order.setEndTime(new Date());
		this.orderModelService.update(order);
		this.response.getWriter().write("success");
	}
	
}
