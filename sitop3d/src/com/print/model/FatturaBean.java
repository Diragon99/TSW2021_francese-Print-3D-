package com.print.model;

import java.util.Date;

public class FatturaBean {
private int id;
private int ordine;
private float costo;
private float speseSped;
private String pagamento;
private Date data;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getOrdine() {
	return ordine;
}
public void setOrdine(int ordine) {
	this.ordine = ordine;
}
public float getSpeseSped() {
	return speseSped;
}
public void setSpeseSped(float speseSped) {
	this.speseSped = speseSped;
}
public float getCosto() {
	return costo;
}
public void setCosto(float costo) {
	this.costo = costo;
}
public String getPagamento() {
	return pagamento;
}
public void setPagamento(String pagamento) {
	this.pagamento = pagamento;
}
public Date getData() {
	return data;
}
public void setData(Date data) {
	this.data = data;
}
}
