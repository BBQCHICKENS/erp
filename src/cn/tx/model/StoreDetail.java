package cn.tx.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "store_detail", schema = "tx_erp", catalog = "")
public class StoreDetail {
    private Integer detailId;
    private Integer storeId;
    private Integer productId;
    private Integer num;

    private Store store;
    private Product product;


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    @Id
    @Column(name = "detail_id")
    public Integer getDetailId() {
        return detailId;
    }

    public void setDetailId(Integer detailId) {
        this.detailId = detailId;
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
    @Column(name = "product_id")
    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    @Basic
    @Column(name = "num")
    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        StoreDetail that = (StoreDetail) o;
        return detailId == that.detailId &&
                Objects.equals(storeId, that.storeId) &&
                Objects.equals(productId, that.productId) &&
                Objects.equals(num, that.num);
    }

    @Override
    public int hashCode() {

        return Objects.hash(detailId, storeId, productId, num);
    }
}
