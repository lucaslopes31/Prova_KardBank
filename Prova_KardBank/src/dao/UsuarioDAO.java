package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Usuario;

public class UsuarioDAO {
	
	private Connection conexao;
	
	public UsuarioDAO() {
		this.conexao = ConnectionFactory.conectar();
	}

	public void cadastrar(Usuario user) {
			
		String inserir = "INSERT INTO user "
				+ " (cpf, nome, telefone, email) "
				+ "VALUES (?, ?, ?, ?) ";
		
		try ( PreparedStatement pst = 
				conexao.prepareStatement(inserir) ) {
			
			pst.setString(1, user.getCpf());
			pst.setString(2, user.getNome());
			pst.setString(3, user.getTelefone());
			pst.setString(4, user.getEmail());
			
			pst.execute();
			
		} catch (SQLException ex) {
			
			System.err.println("Não foi possível manipular "
					+ "a tabela User.");
			ex.printStackTrace();
			
		}
	}
	
	public void alterar(Usuario user) {
		
		String inserir = "UPDATE user "
				+ "SET cpf = ?, nome = ?, telefone = ?, email = ?"
				+ " WHERE id = ? ";
		
		try ( PreparedStatement pst = 
				conexao.prepareStatement(inserir) ) {
			
			pst.setString(1, user.getCpf());
			pst.setString(2, user.getNome());
			pst.setString(3, user.getTelefone());
			pst.setString(4, user.getEmail());
			pst.setInt(5, user.getId());
			
			pst.execute();
			
		} catch (SQLException ex) {
			
			System.err.println("Não foi possível manipular "
					+ "a tabela User.");
			ex.printStackTrace();
			
		}
	}
	
	public void excluir(Usuario user) {
		
		String inserir = "DELETE FROM user "
				+ "WHERE id = ? ";
		
		try ( PreparedStatement pst = 
				conexao.prepareStatement(inserir) ) {
			
			pst.setInt(1, user.getId());
			
			pst.execute();
			
		} catch (SQLException ex) {
			
			System.err.println("Não foi possível manipular "
					+ "a tabela User.");
			ex.printStackTrace();
		}
	}
	
	public Usuario consultar(int id) {
		
		String inserir = "SELECT * FROM user"
				+ " WHERE id = ? ";
		
		try ( PreparedStatement pst = 
				conexao.prepareStatement(inserir) ) {
			
			pst.setInt(1, id);
			ResultSet resultado = pst.executeQuery();
			
			Usuario p = new Usuario();
			if (resultado.next()) {
				p.setId(resultado.getInt("id"));
				p.setCpf(resultado.getString("cpf"));
				p.setNome(resultado.getString("nome"));
				p.setTelefone(resultado.getString("telefone"));
				p.setEmail(resultado.getString("email"));
			}
			return p;
			
			
		} catch (SQLException ex) {
			
			System.err.println("Não foi possível manipular "
					+ "a tabela User.");
			ex.printStackTrace();
			
			return null;
		}
	}
	
	public Boolean consultarCpf(String cpf) {
		
		String inserir = "SELECT * FROM user"
				+ " WHERE cpf = ? ";
		
		try ( PreparedStatement pst = 
				conexao.prepareStatement(inserir) ) {
			
			pst.setString(1, cpf);
			ResultSet resultado = pst.executeQuery();
			
			if (resultado.next())
				return true;
			else
				return false;
			
			
		} catch (SQLException ex) {
			
			System.err.println("Não foi possível manipular "
					+ "a tabela User.");
			ex.printStackTrace();
			
			return null;
		}
	}
	
	public Boolean consultarEmail(String email) {
		
		String inserir = "SELECT * FROM user"
				+ " WHERE email = ? ";
		
		try ( PreparedStatement pst = 
				conexao.prepareStatement(inserir) ) {
			
			pst.setString(1, email);
			ResultSet resultado = pst.executeQuery();
			
			if (resultado.next())
				return true;
			else
				return false;
			
			
		} catch (SQLException ex) {
			
			System.err.println("Não foi possível manipular "
					+ "a tabela User.");
			ex.printStackTrace();
			
			return null;
		}
	}

	
	public ArrayList<Usuario> listarUsuarios() {
		
		String inserir = "SELECT * FROM user";
		
		try ( PreparedStatement pst = 
				conexao.prepareStatement(inserir) ) {
			
			ResultSet resultado = pst.executeQuery();
			
			ArrayList<Usuario> lista = new ArrayList<>();
			while (resultado.next()) {
				Usuario p = new Usuario();
				p.setId(resultado.getInt("id"));
				p.setCpf(resultado.getString("cpf"));
				p.setNome(resultado.getString("nome"));
				p.setTelefone(resultado.getString("telefone"));
				p.setEmail(resultado.getString("email"));
				lista.add(p);
			}
			return lista;
			
		} catch (SQLException ex) {
			
			System.err.println("Não foi possível manipular "
					+ "a tabela User.");
			ex.printStackTrace();
			
			return null;
		}
	}

}