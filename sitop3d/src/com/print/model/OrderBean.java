package com.print.model;

import java.io.Serializable;
import java.util.Date;

public class OrderBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private boolean valid;
	private String indirizzo;
	private int id;//id ordine
	private int utente; //id utente
	private Date data_ordine;
	private Date data_spedizione;
	private String stato;
	private float costo;
	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public int getUtente() {
		return utente;
	}

	public void setUtente(int utente) {
		this.utente = utente;
	}

	public Date getData_ordine() {
		return data_ordine;
	}

	public void setData_ordine(Date data_ordine) {
		this.data_ordine = data_ordine;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStato() {
		return stato;
	}

	public void setStato(String stato) {
		this.stato = stato;
	}

	public Date getData_spedizione() {
		return data_spedizione;
	}

	public void setData_spedizione(Date data_spedizione) {
		this.data_spedizione = data_spedizione;
	}

	public float getCosto() {
		return costo;
	}

	public void setCosto(float costo) {
		this.costo = costo;
	}
		
}
