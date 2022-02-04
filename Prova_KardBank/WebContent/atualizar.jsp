<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"
	integrity="sha512-pHVGpX7F/27yZ0ISY+VVjyULApbDlD0/X0rgGbTqCE7WFW5MezNTWG/dnhtbBuICzsd0WQPgpE4REBLv+UqChw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"
	integrity="sha512-Tn2m0TIpgVyTzzvmxLNuqbSJH3JP8jm+Cy3hvHrW7ndTDcJ1w5mBiksqDBb8GpE2ksktFvDB/ykZ0mDpsZj20w=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
@media screen and (max-width: 767px) {
	.form-group.w-50 {
		width: 100% !important;
	}
}
</style>
<title>Atualização de Usuário</title>
</head>
<body>
	<header class="bg-dark text-white shadow mb-4 py-3">
		<h1 class="py-2 text-center"
			style="font-family: 'Raleway', sans-serif;">Sistema de Controle
			de Usuários</h1>
	</header>
	<%
		HttpSession sessao = request.getSession();
	String id = request.getParameter("id") != null ? request.getParameter("id") : "",
			cpf = request.getParameter("cpf") != null ? request.getParameter("cpf") : "",
			nome = request.getParameter("nome") != null ? request.getParameter("nome") : "",
			telefone = request.getParameter("telefone") != null ? request.getParameter("telefone") : "",
			email = request.getParameter("email") != null ? request.getParameter("email") : "";

	if (sessao.getAttribute("hasMsg") != null) {
		switch ((int) sessao.getAttribute("typeMsg")) {
			case 0 :
		out.print("<div class=\"alert alert-danger text-center\" style=\"margin-top: -1.5rem;\" role=\"alert\">" + sessao.getAttribute("msg")
				+ "</div>");
		break;
			case 1 :
		out.print("<div class=\"alert alert-success text-center\" style=\"margin-top: -1.5rem;\" role=\"alert\">" + sessao.getAttribute("msg")
				+ "</div>");
		break;
		}
	}
	sessao.removeAttribute("hasMsg");
	%>
	<main>
		<div class="container mt-md-5">
			<div class="row">
				<div class="col-12 col-md-3 text-center text-md-start">
					<nav class="nav nav-pills flex-column">
						<a class="nav-link" href="/Prova_KardBank"><i
							class="fas fa-home" style="width: 20px;"></i> Início</a> <a
							class="nav-link" href="cadastrar.jsp"><i class="fas fa-plus"
							style="width: 20px;"></i> Cadastrar Usuário</a> <a
							class="nav-link active" href="#"><i class="far fa-edit"
							style="width: 20px;"></i> Alterar Usuário</a> <a class="nav-link"
							href="excluir.jsp"><i class="far fa-trash-alt"
							style="width: 20px;"></i> Excluir Usuário</a>
					</nav>
				</div>
				<div class="col-12 col-md-8 offset-md-1 mt-4 mt-md-0 pb-4">
					<h1 class="text-center text-md-start">Alterar Usuário</h1>
					<hr class="w-50 mx-auto mx-md-0" />
					<form action="AlterarUsuario.do" method="post">
						<div class="form-group mb-4 w-50">
							<label for="inputId">Id do Usuário</label> <input type="text"
								class="form-control" id="inputId" aria-describedby="idHelp"
								placeholder="Preencha o Id" name="id" value="<%out.print(id);%>"
								required>
						</div>
						<h5 class="text-center text-md-start">Novos dados do usuário</h5>
						<hr class="w-50 mx-auto mx-md-0" />
						<div class="form-group mb-3 w-50">
							<label for="inputCpf">CPF</label> <input type="text"
								class="form-control" id="inputCpf" aria-describedby="cpfHelp"
								placeholder="Preencha o CPF" name="cpf"
								value="<%out.print(cpf);%>">
						</div>
						<div class="form-group mb-3 w-50">
							<label for="inputNome">Nome</label> <input type="text"
								class="form-control" id="inputNome" aria-describedby="nomeHelp"
								placeholder="Preencha o nome" name="nome"
								value="<%out.print(nome);%>">
						</div>
						<div class="form-group mb-3 w-50">
							<label for="inputTelefone">Telefone</label> <input type="text"
								class="form-control" id="inputTelefone"
								aria-describedby="telefoneHelp"
								placeholder="Preencha o telefone" name="telefone"
								value="<%out.print(telefone);%>">
						</div>
						<div class="form-group mb-3 w-50">
							<label for="inputEmail">E-mail</label> <input type="email"
								class="form-control" id="inputEmail"
								aria-describedby="emailHelp" placeholder="Preencha o e-mail"
								name="email" value="<%out.print(email);%>">
						</div>
						<button type="submit" class="btn btn-primary">Alterar</button>
					</form>
				</div>
			</div>
		</div>
	</main>
	<script>
		$(document)
				.ready(
						function() {
							$('#inputCpf').mask('000.000.000-00', {
								reverse : true
							});
							var maskBehavior = function(val) {
								return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000'
										: '(00) 0000-00009';
							}, options = {
								onKeyPress : function(val, e, field, options) {
									field.mask(maskBehavior
											.apply({}, arguments), options);
								}
							};

							$('#inputTelefone').mask(maskBehavior, options);
						})
	</script>
</body>
</html>