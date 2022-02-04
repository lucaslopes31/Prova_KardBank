<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="service.UsuarioService,model.Usuario,java.util.ArrayList"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"
	integrity="sha512-Tn2m0TIpgVyTzzvmxLNuqbSJH3JP8jm+Cy3hvHrW7ndTDcJ1w5mBiksqDBb8GpE2ksktFvDB/ykZ0mDpsZj20w=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap"
	rel="stylesheet">
<style>
@media screen and (max-width: 767px) {
	.form-group.w-50 {
		width: 100% !important;
	}
}
</style>
<title>Sistema de Controle de Usuários</title>
<link rel="icon" type="image/x-icon"
	href="https://img.icons8.com/external-kiranshastry-solid-kiranshastry/64/000000/external-user-advertising-kiranshastry-solid-kiranshastry-4.png">
</head>
<body>
	<header class="bg-dark text-white shadow mb-4 py-3">
		<h1 class="py-2 text-center"
			style="font-family: 'Raleway', sans-serif;">Sistema de Controle
			de Usuários</h1>
	</header>
	<main>
		<div class="container mt-md-5">
			<div class="row">
				<div class="col-12 col-md-3 text-center text-md-start">
					<nav class="nav nav-pills flex-column">
						<a class="nav-link active" href="#"><i class="fas fa-home"
							style="width: 20px;"></i> Início</a> <a class="nav-link"
							href="cadastrar.jsp"><i class="fas fa-plus"
							style="width: 20px;"></i> Cadastrar Usuário</a> <a class="nav-link"
							href="atualizar.jsp"><i class="far fa-edit"
							style="width: 20px;"></i> Alterar Usuário</a> <a class="nav-link"
							href="excluir.jsp"><i class="far fa-trash-alt"
							style="width: 20px;"></i> Excluir Usuário</a>
					</nav>
				</div>
				<div class="col-12 col-md-8 offset-md-1 mt-4 mt-md-0 pb-4">
					<h1 class="text-center text-md-start">Listagem de Usuários</h1>
					<hr class="w-50 mx-auto mx-md-0" />
					<div class="form-group mb-3 w-50">
						<label for="filtro">Filtro</label> <input type="text"
							class="form-control" id="filtro" aria-describedby="filtroHelp"
							placeholder="Filtre sua busca" onkeyup="filtro()">
					</div>
					<div class="table-responsive">
						<table class="table text-center" id="dados">
							<thead>
								<tr>
									<th scope="col">Id</th>
									<th scope="col">CPF</th>
									<th scope="col">Nome</th>
									<th scope="col">Telefone</th>
									<th scope="col">E-mail</th>
									<th scope="col">Ações</th>
								</tr>
							</thead>
							<tbody>
								<%
									UsuarioService us = new UsuarioService();
								ArrayList<Usuario> lista;
								lista = us.listarUsuarios();
								if (lista.isEmpty()) {
									out.print("<tr>");
									out.print("<td colspan=\"6\">Nenhum usuário cadastrado.</td>");
									out.print("</tr>");
								} else {
									for (Usuario p : lista) {
										out.print("<tr>");
										out.print("<td>" + p.getId() + "</td>");
										out.print("<td style=\"white-space: nowrap;\">" + p.getCpf() + "</td>");
										out.print("<td style=\"white-space: nowrap;\">" + p.getNome() + "</td>");
										out.print("<td style=\"white-space: nowrap;\">" + p.getTelefone() + "</td>");
										out.print("<td style=\"white-space: nowrap;\">" + p.getEmail() + "</td>");
										out.print("<td><div  class=\"d-flex justify-content-around\"><a title=\"Alterar\" href=\"atualizar.jsp?id="
										+ p.getId() + "&cpf=" + p.getCpf() + "&nome=" + p.getNome() + "&telefone=" + p.getTelefone() + "&email="
										+ p.getEmail() + "\"><i class=\"far fa-edit\"></i></a><a title=\"Excluir\" href=\"excluir.jsp?id="
										+ p.getId() + "\"><i class=\"far fa-trash-alt\"></i></a></div></td>");
										out.print("</tr>");
									}
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script>
		function filtro() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("filtro");
			filter = input.value.toUpperCase();
			table = document.getElementById("dados");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td");
				for (j = 0; j < td.length; j++) {
					if (td[j]) {
						txtValue = td[j].textContent || td[j].innerText;
						if (txtValue.toUpperCase().indexOf(filter) > -1) {
							tr[i].style.display = "";
							break;
						} else {
							tr[i].style.display = "none";
						}
					}

				}
			}
		}
	</script>
</body>
</html>