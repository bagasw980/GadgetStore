package database;

import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;

import com.mysql.jdbc.ResultSet;

public class BarangConnection {
	ArrayList<Barang> dataBarang = new ArrayList<>();
	ConnectDB conn = new ConnectDB();
	java.sql.Statement st;

	public String toRupiah(String i) {
		Double a;
		a = Double.parseDouble(i);

		Locale localeID = new Locale("in", "ID");
		NumberFormat formatRupiah = NumberFormat.getCurrencyInstance(localeID);
		String result = formatRupiah.format(a);
		return result;
	}

	public ArrayList<Barang> getDataBarang() {
		ResultSet sd = conn.getResult("SELECT * FROM list_barang");
		try {
			while (sd.next()) {
				Barang barang = new Barang();
				barang.setId_barang(sd.getString("id_barang"));
				barang.setId_merk(sd.getString("id_merk"));
				barang.setNama_barang(sd.getString("nama_barang"));
				barang.setKondisi(sd.getString("kondisi"));
				barang.setHarga(sd.getString("harga"));
				barang.setHargadiskon(sd.getString("hargadiskon"));
				barang.setBerat(sd.getString("berat"));
				barang.setStok(sd.getString("stok"));
				barang.setDiskon(sd.getString("diskon"));
				barang.setGambar(sd.getString("gambar"));
				barang.setDeskripsi(sd.getString("deskripsi"));
				barang.setTgl_upload(sd.getString("tgl_upload"));
				dataBarang.add(barang);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataBarang;
	}

	public ArrayList<Barang> getDataBarang(String i) {
		ResultSet sd = conn.getResult("SELECT * FROM list_barang WHERE id_barang=" + i);
		try {
			while (sd.next()) {
				Barang barang = new Barang();
				barang.setId_barang(sd.getString("id_barang"));
				barang.setId_merk(sd.getString("id_merk"));
				barang.setNama_barang(sd.getString("nama_barang"));
				barang.setKondisi(sd.getString("kondisi"));
				barang.setHarga(sd.getString("harga"));
				barang.setHargadiskon(sd.getString("hargadiskon"));
				barang.setBerat(sd.getString("berat"));
				barang.setStok(sd.getString("stok"));
				barang.setDiskon(sd.getString("diskon"));
				barang.setGambar(sd.getString("gambar"));
				barang.setDeskripsi(sd.getString("deskripsi"));
				barang.setTgl_upload(sd.getString("tgl_upload"));
				dataBarang.add(barang);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataBarang;
	}

	public ArrayList<Barang> getDataBarangMerk(String i) {
		ResultSet sd = conn.getResult("SELECT * FROM list_barang WHERE id_merk="+i);
		try {
			while (sd.next()) {
				Barang barang = new Barang();
				barang.setId_barang(sd.getString("id_barang"));
				barang.setId_merk(sd.getString("id_merk"));
				barang.setNama_barang(sd.getString("nama_barang"));
				barang.setKondisi(sd.getString("kondisi"));
				barang.setHarga(sd.getString("harga"));
				barang.setHargadiskon(sd.getString("hargadiskon"));
				barang.setBerat(sd.getString("berat"));
				barang.setStok(sd.getString("stok"));
				barang.setDiskon(sd.getString("diskon"));
				barang.setGambar(sd.getString("gambar"));
				barang.setDeskripsi(sd.getString("deskripsi"));
				barang.setTgl_upload(sd.getString("tgl_upload"));
				dataBarang.add(barang);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataBarang;
	}
	
	public void createDataBarang(Barang barang) {
		String query = "INSERT INTO `list_barang` (`id_barang`, `nama_barang`, `id_merk`, `kondisi`, `berat`, `stok`, `diskon`, `harga`, `hargadiskon`, `gambar`, `deskripsi`, `tgl_upload`) VALUES (NULL, '"
				+ barang.getNama_barang() + "', '" + barang.getId_merk() + "', '" + barang.getKondisi() + "', '"
				+ barang.getBerat() + "', '" + barang.getStok() + "', '" + barang.getDiskon() + "', '"
				+ barang.getHarga() + "', '" + barang.getHargadiskon() + "', '" + barang.getGambar() + "', '"
				+ barang.getDeskripsi() + "', '" + barang.getTgl_upload() + "');";
		try {
			st = conn.con.createStatement();
			st.executeUpdate(query);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void updateDataBarang(Barang barang) {
		String query = "UPDATE `list_barang` SET `nama_barang` = '" + barang.getNama_barang() + "', `id_merk` = '"
				+ barang.getId_merk() + "', `kondisi` = '" + barang.getKondisi() + "', `berat` = '" + barang.getBerat()
				+ "', `stok` = '" + barang.getStok() + "', `diskon` = '" + barang.getDiskon() + "', `harga` = '"
				+ barang.getHarga() + "', `hargadiskon` = '" + barang.getHargadiskon() + "', `deskripsi` = '"
				+ barang.getDeskripsi() + "', `tgl_upload` = '" + barang.getTgl_upload()
				+ "' WHERE `list_barang`.`id_barang` = " + barang.getId_barang() + ";";
		try {
			st = conn.con.createStatement();
			st.executeUpdate(query);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteDataBarang(Barang barang) {
		String query = "DELETE FROM list_barang WHERE id_barang = " + barang.getId_barang() + ";";
		try {
			st = conn.con.createStatement();
			st.executeUpdate(query);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
