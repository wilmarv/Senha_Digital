package com.Fetin.SenhaDigital.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Fetin.SenhaDigital.Model.UserAtendente;
import com.Fetin.SenhaDigital.Repository.UserAtendenteRepository;

@RestController
@RequestMapping(value="/api")
public class ControllerBackend {
	
	@Autowired
	private UserAtendenteRepository repositorioAtendente;
	
	@GetMapping("/login")
	public List<UserAtendente> login() {
		List<UserAtendente> list = repositorioAtendente.findAll();
		return list;
	}
}
