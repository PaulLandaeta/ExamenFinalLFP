package restaurant;

import java.sql.SQLException;
import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Probando");
		Conector instancia = Conector.getInstancia();
		try {
			ArrayList<String> listNames = instancia.getNames();
			for(String name:listNames) {
				System.out.println(name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
