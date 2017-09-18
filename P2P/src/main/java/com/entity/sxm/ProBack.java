package com.entity.sxm;

public class ProBack {
	int back_id;
	int sponsor_id;
    int support_id;
    int back_mode;
    int ord_id;
    int addressid;
    int order_status;//回报中，回报完成
    String logistics;
    String deliverytime;
	public int getBack_id() {
		return back_id;
	}
	public void setBack_id(int back_id) {
		this.back_id = back_id;
	}
	public int getSponsor_id() {
		return sponsor_id;
	}
	public void setSponsor_id(int sponsor_id) {
		this.sponsor_id = sponsor_id;
	}
	public int getSupport_id() {
		return support_id;
	}
	public void setSupport_id(int support_id) {
		this.support_id = support_id;
	}
	public int getBack_mode() {
		return back_mode;
	}
	public void setBack_mode(int back_mode) {
		this.back_mode = back_mode;
	}
	public int getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(int ord_id) {
		this.ord_id = ord_id;
	}
	public int getAddressid() {
		return addressid;
	}
	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}

	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	public String getLogistics() {
		return logistics;
	}
	public void setLogistics(String logistics) {
		this.logistics = logistics;
	}
	public String getDeliverytime() {
		return deliverytime;
	}
	public void setDeliverytime(String deliverytime) {
		this.deliverytime = deliverytime;
	}
}
