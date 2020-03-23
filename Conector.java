package restaurant;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Conector {
	/** 
	 * Atributos de clase 
	 */
	private static Connection con;
	private static Conector INSTANCE = null;
	
	/**
	 * Constructor
	 */
	private Conector(){ 
		
	}
	
	/**
	 * Crear instancia 
	 */
	
	private synchronized static void crearInstancia() {
		if(INSTANCE == null) {
			INSTANCE = new Conector();
			crearConexion();
		}
	}
	
	/**
	 * Obtener instancia
	 */
	
	public static Conector getInstancia() {
		if (INSTANCE == null ) {
			crearInstancia(); 
		}
		return INSTANCE;	
	}

	/** 
	 * Crear Conexion 
	 */
	private static void crearConexion() {
		String host = "127.0.0.1";
		String user = "root";
		String password = "control123!";//Poner su password
		String dataBase = "manufacturing";
		try {
			// Importando la libreria de conexion de mysql
			Class.forName("com.mysql.jdbc.Driver");
			// Url de conexion
			String urlConexion = "jdbc:mysql://"+host+"/"+dataBase+"?user="+user+"&password="+password;
			con = DriverManager.getConnection(urlConexion);
			System.out.println("Lo lograste :') ");
			
		}catch (Exception e) {
			System.out.println("Error al conectar a la base de datos");
		}
	}
	
	public ArrayList<String> getVendors() throws SQLException {
		ArrayList<String> listaVendors = new ArrayList<String>(); 
		PreparedStatement ps = con.prepareStatement("Select * from vendors");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			listaVendors.add(rs.getString("companyname"));
		}
		rs.close();
		return listaVendors;
	}
	
	
	public ArrayList<String> getNames() throws SQLException {
		ArrayList<String> listaNombres = new ArrayList<String>(); 
		PreparedStatement ps = con.prepareStatement("select distinct name\n" + 
				"from clients\n" + 
				"inner join orders on clients.username = orders.clientusername and orders.status = 'Done'");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			//Obtener los datos correctos
			listaNombres.add(rs.getString("name"));
		}
		rs.close();
		return listaNombres;
	}
	
	
	/*
	 * select distinct name
from clients
inner join orders on clients.username = orders.clientusername and orders.status = 'Done'   
	 */
	
	
	
	/* 
	 * 1) Crear un nuevo usuario en Mysql
	 * 2) Conectarse a la base cuarentena con el nuevo usuario 
	 * 3) Mostrar los nombre de los pacientes
	 * 4) Mostrar el consultorio y nombre de los doctores
	 */
}
