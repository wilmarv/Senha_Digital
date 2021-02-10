package com.Fetin.SenhaDigital.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Fetin.SenhaDigital.Model.UserAtendente;

@Repository
public interface UserAtendenteRepository extends JpaRepository<UserAtendente, Long>{
	
}
