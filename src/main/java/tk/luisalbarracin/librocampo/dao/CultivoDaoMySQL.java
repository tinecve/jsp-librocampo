package tk.luisalbarracin.librocampo.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tk.luisalbarracin.librocampo.modelo.Cultivo;
import tk.luisalbarracin.librocampo.modelo.Finca;
import tk.luisalbarracin.librocampo.util.ConexionMySQL;

public class CultivoDaoMySQL implements CultivoDao {

	private ConexionMySQL conexion;

	private static final String INSERTAR = "INSERT INTO cultivo (finca, numero, nombre) VALUES (?, ?, ?);";
	private static final String ACTUALIZAR = "UPDATE cultivo SET finca = ?, numero = ?, set nombre = ? WHERE id = ?;";
	private static final String ELIMINAR = "DELETE FROM cultivo WHERE id = ?;";
	private static final String BUSCAR = "SELECT * FROM cultivo WHERE id = ?;";
	private static final String LISTAR = "SELECT * FROM cultivo";
	private static final String LISTAR_BY_FINCA = "SELECT * FROM cultivo WHERE finca = ?";
	
	
	public CultivoDaoMySQL() {
		this.conexion = ConexionMySQL.getConexion();
	}
	
	@Override
	public void insertar(Cultivo cultivo) throws SQLException {
		// TODO Auto-generated method stub
		try {
			PreparedStatement preparedStatement = conexion.setPreparedStatement(INSERTAR);

			preparedStatement.setInt(1,cultivo.getFinca().getId());
			preparedStatement.setInt(2, cultivo.getNumero());

			conexion.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
		}
	}

	@Override
	public Cultivo buscar(Integer id) {
		// TODO Auto-generated method stub
		Cultivo cultivo = null;
		try {
			PreparedStatement preparedStatement = conexion.setPreparedStatement(BUSCAR);

			preparedStatement.setInt(1, id);

			ResultSet rs = conexion.query();

			while (rs.next()) {
			
				Integer fincaId = rs.getInt("finca");
				Integer numero = rs.getInt("numero");
				String nombre = rs.getString("nombre");
				
				Finca finca = new Finca();
				finca.setId(fincaId);
				
				cultivo = new Cultivo(id, finca, numero, nombre);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
		}

		return cultivo;
	}

	@Override
	public List<Cultivo> selectAll() {
		// TODO Auto-generated method stub
		List<Cultivo> cultivos = new ArrayList<>();

		try {
			PreparedStatement preparedStatement = conexion.setPreparedStatement(LISTAR);
			ResultSet rs = conexion.query();

			while (rs.next()) {
				
				Integer id = rs.getInt("id");
				Integer fincaId = rs.getInt("finca");
				Integer numero = rs.getInt("numero");
				String nombre = rs.getString("nombre");
				
				Finca finca = new Finca();
				finca.setId(fincaId);
				
				cultivos.add(new Cultivo(id, finca, numero, nombre));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
		}

		return cultivos;
	}

	@Override
	public void eliminar(Integer id) throws SQLException {
		// TODO Auto-generated method stub
		try {
			PreparedStatement preparedStatement = conexion.setPreparedStatement(ELIMINAR);

			preparedStatement.setInt(1, id);

			conexion.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
		}
	}

	@Override
	public void actualizar(Cultivo cultivo) throws SQLException {
		// TODO Auto-generated method stub
		try {
			PreparedStatement preparedStatement = conexion.setPreparedStatement(ACTUALIZAR);
			
			preparedStatement.setInt(1,cultivo.getFinca().getId());
			preparedStatement.setInt(2, cultivo.getNumero());
			preparedStatement.setInt(3, cultivo.getId());
			
			conexion.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
		}
	}

	@Override
	public List<Cultivo> selectByFinca(Integer cultivoFinca) {
		List<Cultivo> cultivos = new ArrayList<>();

		try {
			PreparedStatement preparedStatement = conexion.setPreparedStatement(LISTAR_BY_FINCA);
			preparedStatement.setInt(1, cultivoFinca);
			
			ResultSet rs = conexion.query();

			while (rs.next()) {
				
				Integer id = rs.getInt("id");
				Integer fincaId = rs.getInt("finca");
				Integer numero = rs.getInt("numero");
				String nombre = rs.getString("nombre");
				
				Finca finca = new Finca();
				finca.setId(fincaId);
				
				cultivos.add(new Cultivo(id, finca, numero, nombre));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
		}

		return cultivos;
	}

}
