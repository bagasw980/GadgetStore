package database;

import java.sql.DriverManager;
import java.sql.SQLException;
import com.mysql.jdbc.ResultSet;

public class ConnectDB {
	String url;
	java.sql.Connection con;
	java.sql.ResultSet rs;
	java.sql.Statement st;

	public ConnectDB() {
		url = "jdbc:mysql://localhost:3306/gadget-store";
		String username = "root";
		String password = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				con = DriverManager.getConnection(url, username, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ResultSet getResult(String query) {
		try {
			st = con.createStatement();
			rs = st.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return (ResultSet) rs;
	}
}
