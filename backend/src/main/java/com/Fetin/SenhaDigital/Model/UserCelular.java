package com.Fetin.SenhaDigital.Model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="usercelular")
public class UserCelular implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String nome;
	private String senha;
	private String curso;
	@Id
	private int matricula;
	
	public UserCelular() {
		
	}

	public UserCelular(String nome, String senha, String curso, int matricula) {
		super();
		this.nome = nome;
		this.senha = senha;
		this.curso = curso;
		this.matricula = matricula;
	}

	public String getNome() {
		return nome;
	}

	public String getSenha() {
		return senha;
	}

	public String getCurso() {
		return curso;
	}

	public int getMatricula() {
		return matricula;
	}
	
	
	
}
