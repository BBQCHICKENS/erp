package cn.tx.query;

import java.util.Date;

import cn.tx.model.OrderModel;

public class OrderModelQuery extends OrderModel{
	
	private Integer pageNo;
	
	private Integer startNum;
	
	private String  createrName;
	private  String compterName;
    private  String checkterName;
	
	private Integer minTotalNum;
	
	private Integer maxTotalNum;
	
	
	private Date minCreateTime;

	private Date maxCreateTime;
	
	private Double minTotalPrice;
	
	private Double maxTotalPrice;

	private Date minCheckTime;
	private  Date maxCheckTime;


    public String getCompterName() {
        return compterName;
    }

    public void setCompterName(String compterName) {
        this.compterName = compterName;
    }

    public String getCheckterName() {
        return checkterName;
    }

    public void setCheckterName(String checkterName) {
        this.checkterName = checkterName;
    }

    public Date getMinCheckTime() {
		return minCheckTime;
	}

	public void setMinCheckTime(Date minCheckTime) {
		this.minCheckTime = minCheckTime;
	}

	public Date getMaxCheckTime() {
		return maxCheckTime;
	}

	public void setMaxCheckTime(Date maxCheckTime) {
		this.maxCheckTime = maxCheckTime;
	}

	public Double getMinTotalPrice() {
		return minTotalPrice;
	}

	public void setMinTotalPrice(Double minTotalPrice) {
		this.minTotalPrice = minTotalPrice;
	}

	public Double getMaxTotalPrice() {
		return maxTotalPrice;
	}

	public void setMaxTotalPrice(Double maxTotalPrice) {
		this.maxTotalPrice = maxTotalPrice;
	}

	public Date getMinCreateTime() {
		return minCreateTime;
	}

	public void setMinCreateTime(Date minCreateTime) {
		this.minCreateTime = minCreateTime;
	}

	public Date getMaxCreateTime() {
		return maxCreateTime;
	}

	public void setMaxCreateTime(Date maxCreateTime) {
		this.maxCreateTime = maxCreateTime;
	}

	public Integer getMinTotalNum() {
		return minTotalNum;
	}

	public void setMinTotalNum(Integer minTotalNum) {
		this.minTotalNum = minTotalNum;
	}

	public Integer getMaxTotalNum() {
		return maxTotalNum;
	}

	public void setMaxTotalNum(Integer maxTotalNum) {
		this.maxTotalNum = maxTotalNum;
	}

	public String getCreaterName() {
		return createrName;
	}

	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getStartNum() {
		return startNum;
	}

	public void setStartNum(Integer startNum) {
		this.startNum = startNum;
	}
	
	

}
