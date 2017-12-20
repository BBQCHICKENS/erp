package cn.tx.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Objects;

@Entity
@Table(name = "store_log", schema = "tx_erp", catalog = "")
public class StoreLog {
    private int logId;
    private Integer empId;
    private Integer orderDetailId;
    private Integer storeId;
    private Date operTime;
    private Integer num;
    private Integer type;

    @Id
    @Column(name = "log_id")
    public int getLogId() {
        return logId;
    }

    public void setLogId(int logId) {
        this.logId = logId;
    }

    @Basic
    @Column(name = "emp_id")
    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    @Basic
    @Column(name = "order_detail_id")
    public Integer getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(Integer orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    @Basic
    @Column(name = "store_id")
    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    @Basic
    @Column(name = "oper_time")
    public Date getOperTime() {
        return operTime;
    }

    public void setOperTime(Date operTime) {
        this.operTime = operTime;
    }

    @Basic
    @Column(name = "num")
    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Basic
    @Column(name = "type")
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        StoreLog storeLog = (StoreLog) o;
        return logId == storeLog.logId &&
                Objects.equals(empId, storeLog.empId) &&
                Objects.equals(orderDetailId, storeLog.orderDetailId) &&
                Objects.equals(storeId, storeLog.storeId) &&
                Objects.equals(operTime, storeLog.operTime) &&
                Objects.equals(num, storeLog.num) &&
                Objects.equals(type, storeLog.type);
    }

    @Override
    public int hashCode() {

        return Objects.hash(logId, empId, orderDetailId, storeId, operTime, num, type);
    }
}
