package cn.tx.tag;

import cn.tx.utils.ERPConstants;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class ERPSupplierTypeTag extends TagSupport {
	
	
	
	    //设置订单类型值
		private String supplierType;


	public String getSupplierType() {
		return supplierType;
	}

	public void setSupplierType(String supplierType) {
		this.supplierType = supplierType;
	}

	@Override
	public int doStartTag() throws JspException {
		//获得JSPWriter对象向jsp页面写文本
		JspWriter out = pageContext.getOut();
		String text = "";
		switch(supplierType){
			case ERPConstants.SUPPLIER_PICK_TYPE_MY:
				text = ERPConstants.SUPPLIER_PICK_TYPE_MY_TEXT;
				break;
			case ERPConstants.SUPPLIER_PICK_TYPE_YOU:
				text = ERPConstants.SUPPLIER_PICK_TYPE_YOU_TEXT;
				break;
		}
		try {
			out.write(text);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	
	
	
	
	

}
