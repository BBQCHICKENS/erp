package cn.tx.controller;

import java.util.List;
import java.util.Set;

import cn.tx.model.ProductType;
import cn.tx.model.Supplier;
import cn.tx.query.SupplierQuery;
import cn.tx.service.SupplierService;
import cn.tx.utils.JSONUtils;
import cn.tx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class SupplierAction extends BaseAction {
	
	
	private SupplierQuery query = new SupplierQuery();
	private  Supplier supplier =new Supplier();

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public SupplierQuery getQuery() {
		return query;
	}

	public void setQuery(SupplierQuery query) {
		this.query = query;
	}

	private SupplierService supplierService;
	
	public SupplierService getSupplierService() {
		return supplierService;
	}

	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}


	public String supplier_list(){
		
		ActionContext context = ActionContext.getContext();
		
		Integer pageNo = query.getPageNo();
		if(pageNo == null ){
			query.setPageNo(1);
		}
		exclude.add("pts");
		Page page = supplierService.queryObjByCondition(query, exclude);
		context.put("page", page);
		return SUCCESS;
	}

	/*添加修改页面*/
	public String supplier_input(){
		return SUCCESS;
	}
	public String supplier_update(){
		supplier= this.supplierService.getObj(this.supplier.getSupplierId());
		return SUCCESS;
	}
	/**
	 * 删除供应商并回到展示页面
	 * @return
	 */
	public String supplier_delete(){
		Supplier obj = this.supplierService.getObj(this.supplier.getSupplierId());
		this.supplierService.delete(obj);
		return LIST;
	}


	/**
	 * 查询供应商
	 */
	public void ajax_supplier_getSupplier(){
		//根据Id查询供应商
		Supplier supplier = supplierService.getObj(query.getSupplierId());
		//获得所有供应商下的类别
		Set<ProductType> pts = supplier.getPts();
		JSONUtils.printJSONArray(response, pts, new String[]{"supplier","products"});

	}

	//添加
	public void  ajax_supplier_add() throws  Exception{
		this.supplierService.save(supplier);
		this.response.getWriter().write("success");
	}

	//修改
	public void  ajax_supplier_update() throws  Exception{
		this.supplierService.update(supplier);
		this.response.getWriter().write("success");
	}

	
}
