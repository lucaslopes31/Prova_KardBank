package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;
import service.UsuarioService;

/**
 * Servlet implementation class AlterarUsuario
 */
@WebServlet({ "/AlterarUsuario", "/AlterarUsuario.do" })
public class AlterarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cpf = request.getParameter("cpf"), nome = request.getParameter("nome"),
				telefone = request.getParameter("telefone"), email = request.getParameter("email");
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession sessao = request.getSession();

		Usuario usuario = new Usuario();
		usuario.setId(id);

		UsuarioService usuarioService = new UsuarioService();
		Usuario existe = usuarioService.consultar(id);

		if (!existe.isValid()) {
			sessao.setAttribute("hasMsg", true);
			sessao.setAttribute("typeMsg", 0);
			sessao.setAttribute("msg", "Usuário não encontrado.");
		} else {
			//CPF não alterado
			if (cpf != null && cpf != "")
				usuario.setCpf(cpf);
			else
				usuario.setCpf(existe.getCpf());

			//Nome não alterado
			if (nome != null && nome != "")
				usuario.setNome(nome);
			else
				usuario.setNome(existe.getNome());

			//Telefone não alterado
			if (telefone != null && telefone != "")
				usuario.setTelefone(telefone);
			else
				usuario.setTelefone(existe.getTelefone());

			//E-mail não alterado
			if (email != null && email != "")
				usuario.setEmail(email);
			else
				usuario.setEmail(existe.getEmail());
			
			usuarioService.alterar(usuario);
			sessao.setAttribute("hasMsg", true);
			sessao.setAttribute("typeMsg", 1);
			sessao.setAttribute("msg", "Usuário alterado com sucesso!");
		}

		response.sendRedirect(request.getContextPath() + "/atualizar.jsp");
	}

}