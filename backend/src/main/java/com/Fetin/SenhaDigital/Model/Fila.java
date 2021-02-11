package com.Fetin.SenhaDigital.Model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "fila")
public class Fila implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private int id;
	private String nome;
	private int matricula;
	private String curso;

	public Fila() {

	}

	public Fila(String nome, int matricula, String curso) {
		super();
		this.nome = nome;
		this.matricula = matricula;
		this.curso = curso;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}
	public String getNome() {
		return nome;
	}

	public int getMatricula() {
		return matricula;
	}

	public String getCurso() {
		return curso;
	}
}
