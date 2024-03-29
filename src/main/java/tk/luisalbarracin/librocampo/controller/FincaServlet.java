package tk.luisalbarracin.librocampo.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tk.luisalbarracin.librocampo.dao.AsociacionDao;
import tk.luisalbarracin.librocampo.dao.AsociacionDaoMySQL;
import tk.luisalbarracin.librocampo.dao.FincaDao;
import tk.luisalbarracin.librocampo.dao.FincaDaoMySQL;
import tk.luisalbarracin.librocampo.dao.PropietarioDao;
import tk.luisalbarracin.librocampo.dao.PropietarioDaoMySQL;
import tk.luisalbarracin.librocampo.modelo.Asociacion;
import tk.luisalbarracin.librocampo.modelo.Finca;
import tk.luisalbarracin.librocampo.modelo.Propietario;

/**
 * Servlet implementation class FincaServlet
 */
@WebServlet("/finca/*")
public class FincaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FincaDao fincaDao;
	private AsociacionDao asociacionDao;
	private PropietarioDao propietarioDao;
	HttpSession session;

    /**
     * Default constructor. 
     */
    public FincaServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		this.fincaDao = new FincaDaoMySQL();
		this.asociacionDao = new AsociacionDaoMySQL();
		this.propietarioDao = new PropietarioDaoMySQL();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getRequestURI();
		System.out.println(action);
		
		try {
			switch (action) {
				case "/libroCampo/finca/new":
					showNewForm(request, response);
					break;
				case "/libroCampo/finca/insert":
					insertarFinca(request, response);
					break;
				case "/libroCampo/finca/delete":
					eliminarFinca(request, response);
					break;
				case "/libroCampo/finca/edit":
					showEditForm(request, response);
					break;
				case "/libroCampo/finca/update":
					actualizarFinca(request, response);
					break;
				default:
					listFincas(request, response);
					break;
				}
		} catch (SQLException e) {
			throw new ServletException(e);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		Finca fincaActual = this.fincaDao.buscar(id);
		
		request.setAttribute("finca", fincaActual);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/finca.jsp");
		dispatcher.forward(request, response);
	}

	private void listFincas(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		List<Finca> fincas = this.fincaDao.selectByPropietario(1);
		request.setAttribute("fincas", fincas);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/fincalist.jsp");
		dispatcher.forward(request, response);
	}

	private void actualizarFinca(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		Float area = Float.parseFloat(request.getParameter("area"));
		Integer asociacionId = Integer.parseInt(request.getParameter("asociacion"));
		Float areaPalma = Float.parseFloat(request.getParameter("areaPalma"));
		Integer propietarioId = Integer.parseInt(request.getParameter("propietario"));
		String vereda = request.getParameter("vereda");
		LocalDate fechaS = LocalDate.parse(request.getParameter("inicioSiembra"));
		String plano = request.getParameter("plano");
		
		
		Asociacion asociacion = this.asociacionDao.buscar(asociacionId);
		Propietario propietario = this.propietarioDao.buscar(propietarioId);
		
		Finca finca = new Finca(id, nombre, area, asociacion, areaPalma, plano, propietario, vereda, fechaS);
		this.fincaDao.actualizar(finca);
		
		response.sendRedirect("list");
	}

	private void eliminarFinca(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		this.fincaDao.eliminar(id);
		
		response.sendRedirect("list");
	}

	private void insertarFinca(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		session = request.getSession();
		Asociacion asociacion = null;
		String nombre = request.getParameter("nombre");
		Float area = Float.parseFloat(request.getParameter("area"));
		if(request.getParameter("asociacion") != null) {
			Integer asociacionId = Integer.parseInt(request.getParameter("asociacion"));
			asociacion = this.asociacionDao.buscar(asociacionId);
		}

		Float areaPalma = Float.parseFloat(request.getParameter("areaPalma"));
		String vereda = request.getParameter("vereda");
		LocalDate fechaS = LocalDate.parse(request.getParameter("inicioSiembra"));
		
		System.out.println(fechaS);
		
		String email = (String) this.session.getAttribute("propietario");
		System.out.println(email);
		
		Propietario propietario = this.propietarioDao.getPropietarioId(email);
		

		
		String plano = request.getParameter("plano");
		

		Finca finca = new Finca(nombre, area, asociacion, areaPalma, plano, propietario, vereda, fechaS);
		
		this.fincaDao.insertar(finca);
		
		response.sendRedirect("list");
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Asociacion> asociaciones = this.asociacionDao.selectAll();
		request.setAttribute("asociaciones", asociaciones);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/finca.jsp");
		dispatcher.forward(request, response);
	}

}
