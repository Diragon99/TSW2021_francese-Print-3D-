package com.print.model;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int code;
	private String short_descript;
	private String description;
	private boolean available;
	private float vat;
	private float base_price;
	private String category;
	public ProductBean() {
		code = -1;
		short_descript = "";
		description = "";
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getShortdesc() {
		return short_descript;
	}

	public void setShortdesc(String shortdesc) {
		this.short_descript = shortdesc;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getBase_price() {
		return base_price;
	}

	public void setBase_price(float price) {
		this.base_price = price;
	}

	public void setCategory(String cat) {
		category=cat;
	}
	public String getCategory() {
		return category;
	}
	public void setAvailable(boolean isAvailable) {
		available=isAvailable;
	}
	public boolean getAvailable() {
		return available;
	}
	public float getVat() {
		return vat;
	}
	public void setVat(float _vat) {
		vat=_vat;
	}

	@Override
	public String toString() {
		return " (" + code + "), ";
	}

}