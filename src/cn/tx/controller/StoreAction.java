package cn.tx.controller;

import java.util.List;

import cn.tx.model.Store;
import cn.tx.query.StoreQuery;
import cn.tx.service.OrderModelService;
import cn.tx.service.StoreService;
import cn.tx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class StoreAction extends BaseAction {
	
	
	private StoreQuery query = new StoreQuery();
	private  Store store =new Store();
	private  Integer storeNum;
	private Integer storeDetailId;
	private Integer productId;

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getStoreDetailId() {
		return storeDetailId;
	}

	public void setStoreDetailId(Integer storeDetailId) {
		this.storeDetailId = storeDetailId;
	}

	public Integer getStoreNum() {
		return storeNum;
	}

	public void setStoreNum(Integer storeNum) {
		this.storeNum = storeNum;
	}

	public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public StoreQuery getQuery() {
		return query;
	}

	public void setQuery(StoreQuery query) {
		this.query = query;
	}

	private StoreService storeService;

	public StoreService getStoreService() {
		return storeService;
	}

	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}


	public String store_storeList(){
		ActionContext context = ActionContext.getContext();
		Integer pageNo = query.getPageNo();
		if(pageNo == null ){
			query.setPageNo(1);
		}
		Page page = storeService.queryObjByCondition(query, exclude);
		context.put("page", page);
		return SUCCESS;
	}

    public String store_storeDetails(){
        store = this.storeService.getObj(this.store.getStoreId());
        return SUCCESS;
    }

	public String store_inStoreProduct(){
		ActionContext context = ActionContext.getContext();
		List<Store> storeList = this.storeService.list();
		context.put("storeList", storeList);
		return SUCCESS;
	}

	public String store_input(){
		return SUCCESS;
	}

	public void ajax_store_updateInStoreStatus() throws Exception{
		try{
			this.storeService.updateInStoreOrderStatus(productId,store.getStoreId(),storeDetailId,storeNum);
		}catch (Exception e){
			System.out.println(e.getMessage());
           e.getStackTrace();
		}
 	    this.response.getWriter().write("success");
	}
}
