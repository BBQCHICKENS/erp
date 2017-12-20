package cn.tx.service;

import cn.tx.model.Store;
import cn.tx.query.StoreQuery;

public interface StoreService extends BaseService<Store, StoreQuery> {
	
	
     //点单入库并修改订单状态
     public void updateInStoreOrderStatus(Integer productId,Integer storeId, Integer orderDetailId,Integer addNum);
}
