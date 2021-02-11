package com.Fetin.SenhaDigital.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Fetin.SenhaDigital.Model.Fila;
import com.Fetin.SenhaDigital.Model.UserAtendente;
import com.Fetin.SenhaDigital.Model.UserCelular;
import com.Fetin.SenhaDigital.Repository.FilaRepository;
import com.Fetin.SenhaDigital.Repository.UserAtendenteRepository;
import com.Fetin.SenhaDigital.Repository.UserCelularRepository;

@RestController
@RequestMapping(value="/api")
public class ControllerBackend {
	static int id = 0;
	
	@Autowired
	private FilaRepository repositorioFila;
	@Autowired
	private UserAtendenteRepository repositorioAtendente;
	@Autowired
	private UserCelularRepository repositorioCelular;
	
	@PostMapping("/cadastrarcelular")
	public void addatendente(@RequestBody UserCelular usuarioCelular) {
		repositorioCelular.save(usuarioCelular);
	}
	
	@PostMapping("/cadastraratendente")
	public void addatendente(@RequestBody UserAtendente usuarioAtendente) {
		repositorioAtendente.save(usuarioAtendente);
	}
	
	@GetMapping("/fila")
	public List<Fila> fila() {
		List<Fila> list = repositorioFila.findAll();
		return list;
	}
	@PostMapping("/entrafila")
	public void addfila(@RequestBody Fila usuarionaFila ) {
		id = id + 1;
		usuarionaFila.setId(id);
		repositorioFila.save(usuarionaFila);
	}
	
	@DeleteMapping("/proximo")
	public void pop(@RequestBody Fila usuarionaFila) {
		repositorioFila.delete(usuarionaFila);
	}
	@DeleteMapping("fecharfila")
	public void fechar() {
		id = 0;
		repositorioFila.deleteAll();
	}
	
	@GetMapping("/suaposicao")
	public int posicao(@RequestBody UserCelular usuarioCelular ) {
		int matricula =usuarioCelular.getMatricula();
		Fila pessoa = repositorioFila.findByMatricula(matricula);
		return pessoa.getId();
	}
	
}
