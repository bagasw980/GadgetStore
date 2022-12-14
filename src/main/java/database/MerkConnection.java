package database;

import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.ResultSet;

public class MerkConnection {
	ArrayList<Merk> dataMerk = new ArrayList<>();
	ConnectDB conn = new ConnectDB();
	
	public ArrayList<Merk> getDataMerk() {
		ResultSet sd = conn.getResult("SELECT * FROM merk");
		try {
			while (sd.next()) {
				Merk merk = new Merk();
				merk.setId_merk(sd.getString("id_merk"));
				merk.setMerk(sd.getString("merk"));
				merk.setSales(sd.getString("sales"));
				merk.setKantor(sd.getString("kantor"));
				dataMerk.add(merk);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataMerk;
	}
	public ArrayList<Merk> getDataMerk(String i) {
		ResultSet sd = conn.getResult("SELECT * FROM merk WHERE id_merk="+i);
		try {
			while (sd.next()) {
				Merk merk = new Merk();
				merk.setId_merk(sd.getString("id_merk"));
				merk.setMerk(sd.getString("merk"));
				merk.setSales(sd.getString("sales"));
				merk.setKantor(sd.getString("kantor"));
				dataMerk.add(merk);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataMerk;
	}
}
