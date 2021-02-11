package com.Fetin.SenhaDigital.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="useratendente")
public class UserAtendente implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private long id;
	
	@Column(nullable = false)
	private String nome;
	
	@Column(nullable = false)
	private String senha;
	
	public UserAtendente() {
		
	}
	public UserAtendente(long id,String nome,String senha) {
		super();
		this.id = id;
		this.nome = nome;
		this.senha = senha;
	}
	
	public long getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}
