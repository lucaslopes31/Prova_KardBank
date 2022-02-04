package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;
import service.UsuarioService;

/**
 * Servlet implementation class ExcluirUsuario
 */
@WebServlet({ "/ExcluirUsuario", "/ExcluirUsuario.do" })
public class ExcluirUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int aceito = request.getParameter("aceito") == null ? 0 : 1;
		HttpSession sessao = request.getSession();

		Usuario usuario = new Usuario();
		usuario.setId(id);

		UsuarioService usuarioService = new UsuarioService();

		Usuario existe = usuarioService.consultar(id);

		if (!existe.isValid()) {
			sessao.setAttribute("hasMsg", true);
			sessao.setAttribute("typeMsg", 0);
			sessao.setAttribute("msg", "Usu�rio n�o encontrado.");
		} else if (aceito == 1) {
			usuarioService.excluir(usuario);
			sessao.setAttribute("hasMsg", true);
			sessao.setAttribute("typeMsg", 1);
			sessao.setAttribute("msg", "Usu�rio exclu�do com sucesso!");
		} else {
			sessao.setAttribute("hasMsg", true);
			sessao.setAttribute("typeMsg", 0);
			sessao.setAttribute("msg", "Permita a exclus�o do usu�rio!");
		}
		
		response.sendRedirect(request.getContextPath() + "/excluir.jsp");
	}

}