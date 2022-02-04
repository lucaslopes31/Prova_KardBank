package service;

import java.util.ArrayList;

import dao.UsuarioDAO;
import model.Usuario;

public class UsuarioService {
	private UsuarioDAO usuarioDAO;

	public UsuarioService() {
		this.usuarioDAO = new UsuarioDAO();
	}

	public void cadastrar(Usuario usuario) {
		this.usuarioDAO.cadastrar(usuario);
	}

	public void alterar(Usuario usuario) {
		this.usuarioDAO.alterar(usuario);
	}

	public void excluir(Usuario usuario) {
		this.usuarioDAO.excluir(usuario);
	}

	public Usuario consultar(int id) {
		return this.usuarioDAO.consultar(id);
	}

	public Boolean consultarCpf(String cpf) {
		return this.usuarioDAO.consultarCpf(cpf);
	}

	public Boolean consultarEmail(String email) {
		return this.usuarioDAO.consultarEmail(email);
	}

	public ArrayList<Usuario> listarUsuarios() {
		return this.usuarioDAO.listarUsuarios();
	}
}