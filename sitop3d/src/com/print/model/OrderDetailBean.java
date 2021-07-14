package com.print.model;

public class OrderDetailBean {
private int prodotto;
private float tot;
private float iva;
private String cat;
public int getProdotto() {
	return prodotto;
}
public void setProdotto(int prodotto) {
	this.prodotto = prodotto;
}
public float getTot() {
	return tot;
}
public void setTot(float tot) {
	this.tot = tot;
}
public float getIva() {
	return iva;
}
public void setIva(float iva) {
	this.iva = iva;
}
public String getCat() {
	return cat;
}
public void setCat(String cat) {
	this.cat = cat;
}
}
