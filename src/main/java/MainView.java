import database.BarangConnection;
import database.ConnectDB;

public class MainView {
	public static void main(String[] args) {
		BarangConnection barang = new BarangConnection();
//		ConnectDB cB = new ConnectDB();
		
		System.out.println(barang.getDataBarang("19"));
//		cB.getDataBarang();
	

	}
}
