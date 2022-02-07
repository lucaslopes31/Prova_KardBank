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
 * Servlet implementation class CadastrarUsuario
 */
@WebServlet({ "/CadastrarUsuario", "/CadastrarUsuario.do" })
public class CadastrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cpf = request.getParameter("cpf"), nome = request.getParameter("nome"),
				telefone = request.getParameter("telefone"), email = request.getParameter("email");
		HttpSession sessao = request.getSession();

		Usuario usuario = new Usuario();
		usuario.setCpf(cpf);
		usuario.setNome(nome);
		usuario.setTelefone(telefone);
		usuario.setEmail(email);

		UsuarioService usuarioService = new UsuarioService();
		Boolean existeCpf = usuarioService.consultarCpf(cpf);
		Boolean existeEmail = usuarioService.consultarEmail(email);

		if (!existeCpf && !existeEmail) {
			usuarioService.cadastrar(usuario);
			sessao.setAttribute("hasMsg", true);
			sessao.setAttribute("typeMsg", 1);
			sessao.setAttribute("msg", "Usuário cadastrado com sucesso!");
		} else {
			sessao.setAttribute("hasMsg", true);
			sessao.setAttribute("typeMsg", 0);
			sessao.setAttribute("msg", "CPF ou E-mail já cadastrado no sistema!");
		}

		response.sendRedirect(request.getContextPath() + "/cadastrar.jsp");
	}

}