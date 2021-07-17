package com.print.model;

import java.io.Serializable;

public class ComposizioneBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int fattura;
	private Cart cart;
	public int getFattura() {
		return fattura;
	}
	public void setFattura(int fattura) {
		this.fattura = fattura;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
}