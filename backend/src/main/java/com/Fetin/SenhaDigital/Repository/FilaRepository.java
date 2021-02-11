package com.Fetin.SenhaDigital.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Fetin.SenhaDigital.Model.Fila;
@Repository
public interface FilaRepository extends JpaRepository<Fila, Long> {
	Fila findByMatricula(int id);
}
