
import java.io.IOException;

import database.Barang;
import database.BarangConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "EditBarang", urlPatterns = "/edit-barang")

public class EditBarang extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id_barang = request.getParameter("id");
		String nama = request.getParameter("nama");
		String berat = request.getParameter("berat");
		String merk = request.getParameter("merk");
		String kondisi = request.getParameter("kondisi");
		String diskon = request.getParameter("diskon");
		String harga = request.getParameter("harga");
		String hargadiskon = request.getParameter("hargadiskon");
		String stok = request.getParameter("stok");
		String deskripsi = request.getParameter("deskripsi");

		try {
			Barang barang = new Barang();
			barang.setId_barang(id_barang);
			barang.setNama_barang(nama);
			barang.setBerat(berat);
			barang.setId_merk(merk);
			barang.setKondisi(kondisi);
			barang.setDiskon(diskon);
			barang.setStok(stok);
			barang.setDeskripsi(deskripsi);
			barang.setHarga(harga);
			barang.setHargadiskon(hargadiskon);
			BarangConnection bC = new BarangConnection();
			bC.updateDataBarang(barang);
			
		} catch (Exception e) {
			e.printStackTrace();
            request.setAttribute("error", "Gagal Edit Data!");
            doGet(request, response);
		}

		// for example, you can copy the uploaded file to the server
		// note that you probably don't want to do this in real life!
		// upload it to a file host like S3 or GCS instead
		response.sendRedirect("ListBarang.jsp");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String id = request.getParameter("id");
		getServletContext().getRequestDispatcher("/EditBarang.jsp").forward(request, response);

	}

}
