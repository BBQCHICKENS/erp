package cn.tx.service.impl;

import cn.tx.dao.*;
import cn.tx.model.*;
import cn.tx.query.StoreQuery;
import cn.tx.service.StoreService;

import java.util.Set;

public class StoreServiceImpl extends BaseServiceImpl<Store, StoreQuery> implements StoreService {

	
	private StoreDao storeDao;
	private OrderDetailDao orderDetailDao;
    private OrderModelDao orderModelDao;
    private  ProductDao productDao;


    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

    public void setOrderModelDao(OrderModelDao orderModelDao) {
		this.orderModelDao = orderModelDao;
	}
	public void setOrderDetailDao(OrderDetailDao orderDetailDao) {
		this.orderDetailDao = orderDetailDao;
	}
	public void setStoreDao(StoreDao storeDao) {
		this.storeDao = storeDao;
		this.baseDao = storeDao;
	}


	@Override
	public void updateInStoreOrderStatus(Integer productId, Integer storeId, Integer orderDetailId,Integer addNum) {
		//订单入库，首先判断库存有没有商品的记录
		Store store = this.storeDao.getObj(storeId);
		Set<StoreDetail> detailSet = store.getDetailSet();
		OrderDetail orderDetail = this.orderDetailDao.getObj(orderDetailId);
		boolean isExist=false;
		for (StoreDetail detail:detailSet) {
			if(detail.getProduct().getProductId().intValue()==productId.intValue()){
				  detail.setNum(detail.getNum()+addNum);
				  orderDetail.setSurplus(orderDetail.getSurplus()-addNum);
				  isExist=true;
				  break;
			}
		}
		//添加仓库详细
		if(!isExist){
			StoreDetail storeDetail =new StoreDetail();
			storeDetail.setNum(addNum);
			storeDetail.setStoreId(storeId);
            Product product = this.productDao.getObj(productId);
            storeDetail.setProduct(product);
			detailSet.add(storeDetail);
            orderDetail.setSurplus(orderDetail.getSurplus()-addNum);
		}
		//检查订单是否完成入库
		Integer orderId =  orderDetail.getOrderModel().getOrderId();
		OrderModel order = this.orderModelDao.getObj(orderId);
		Set<OrderDetail> details = order.getDetails();
		boolean isFinish=true;
		for (OrderDetail detail: details) {
			 if(detail.getSurplus().intValue()!=0){
				 order.setOrderState(2);
				 isFinish=false;
				 break;
			 }
		}
		if(isFinish){
			order.setOrderState(3);
		}
	}
}
