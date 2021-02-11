package com.Fetin.SenhaDigital.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Fetin.SenhaDigital.Model.UserCelular;
@Repository
public interface UserCelularRepository extends JpaRepository<UserCelular, Long> {

}
