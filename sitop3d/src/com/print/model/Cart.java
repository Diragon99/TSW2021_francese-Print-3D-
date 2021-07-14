package com.print.model;

import java.util.ArrayList; 
import java.util.List;

public class Cart {

	private List<ProductBean> products;
	
	public Cart() {
		products = new ArrayList<ProductBean>();
	}
	
	public void addProduct(ProductBean product) {
		products.add(product);
	}
	public float getTotal() {
		float tot=0;
		for(ProductBean bean:products) {
			tot+=bean.getBase_price()+bean.getVat();
		}
		return tot;
	}
	
	public void deleteProduct(ProductBean product) {
		for(ProductBean prod : products) {
			if(prod.getCode() == product.getCode()) {
				products.remove(prod);
				break;
			}
		}
 	}
	
	public List<ProductBean> getProducts() {
		return  products;
	}
	
	
}