package cn.tx.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;
import java.util.Set;

@Entity
public class Store {
    private Integer storeId;
    private Integer stockman;
    private String name;
    private String address;

    private Set<StoreDetail> detailSet;
    private  Emp emp;

    public Emp getEmp() {
        return emp;
    }

    public void setEmp(Emp emp) {
        this.emp = emp;
    }

    public Set<StoreDetail> getDetailSet() {
        return detailSet;
    }

    public void setDetailSet(Set<StoreDetail> detailSet) {
        this.detailSet = detailSet;
    }

    @Id
    @Column(name = "store_id")
    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    @Basic
    @Column(name = "stockman")
    public Integer getStockman() {
        return stockman;
    }

    public void setStockman(Integer stockman) {
        this.stockman = stockman;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Store store = (Store) o;
        return storeId == store.storeId &&
                Objects.equals(stockman, store.stockman) &&
                Objects.equals(name, store.name) &&
                Objects.equals(address, store.address);
    }

    @Override
    public int hashCode() {

        return Objects.hash(storeId, stockman, name, address);
    }
}
