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
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
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
<title>Exclusão de Usuário</title>
<link rel="icon" type="image/x-icon"
	href="https://img.icons8.com/external-kiranshastry-solid-kiranshastry/64/000000/external-user-advertising-kiranshastry-solid-kiranshastry-4.png">
</head>
<body>
	<header class="bg-dark text-white shadow mb-4 py-3">
		<h1 class="py-2 text-center"
			style="font-family: 'Raleway', sans-serif;">Sistema de Controle
			de Usuários</h1>
	</header>
	<%
		HttpSession sessao = request.getSession();
	String id = request.getParameter("id") != null ? request.getParameter("id") : "";
	if (sessao.getAttribute("hasMsg") != null) {
		switch ((int) sessao.getAttribute("typeMsg")) {
		case 0:
			out.print("<div class=\"alert alert-danger text-center\" style=\"margin-top: -1.5rem;\" role=\"alert\">"
			+ sessao.getAttribute("msg") + "</div>");
			break;
		case 1:
			out.print("<div class=\"alert alert-success text-center\" style=\"margin-top: -1.5rem;\" role=\"alert\">"
			+ sessao.getAttribute("msg") + "</div>");
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
							style="width: 20px;"></i> Cadastrar Usuário</a> <a class="nav-link"
							href="atualizar.jsp"><i class="far fa-edit"
							style="width: 20px;"></i> Alterar Usuário</a> <a
							class="nav-link active" href="#"><i class="far fa-trash-alt"
							style="width: 20px;"></i> Excluir Usuário</a>
					</nav>
				</div>
				<div class="col-12 col-md-8 offset-md-1 mt-4 mt-md-0 pb-4">
					<h1 class="text-center text-md-start">Excluir Usuário</h1>
					<hr class="w-50 mx-auto mx-md-0" />
					<form action="ExcluirUsuario.do" method="post">
						<div class="form-group mb-3 w-50">
							<label for="inputId">Id do Usuário</label> <input type="text"
								class="form-control" id="inputId" aria-describedby="idHelp"
								placeholder="Preencha o Id" name="id" value="<%out.print(id);%>"
								required>
						</div>
						<div class="form-check mb-3">
							<input type="checkbox" class="form-check-input" id="check"
								name="aceito" value="1" required> <label
								class="form-check-label" for="check">Aceito que o
								usuário será definitivamente excluído</label>
						</div>
						<button type="submit" class="btn btn-primary">Excluir</button>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>