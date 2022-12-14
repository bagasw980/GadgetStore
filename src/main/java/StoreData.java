import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import database.Barang;
import database.BarangConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(name = "StoreData", urlPatterns = "/tambah-barang")
@MultipartConfig(fileSizeThreshold = 1024 * 20, // 20 KB
		maxFileSize = 1024 * 1024, // 1 MB
		maxRequestSize = 1024 * 2048 // 2 MB
)
public class StoreData extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nama = request.getParameter("nama");
		String berat = request.getParameter("berat");
		String merk = request.getParameter("merk");
		String kondisi = request.getParameter("kondisi");
		String diskon = request.getParameter("diskon");
		String harga = request.getParameter("harga");
		String hargadiskon = request.getParameter("hargadiskon");
		String stok = request.getParameter("stok");
		String tglUpload = request.getParameter("tglUpload");
		String deskripsi = request.getParameter("deskripsi");
		// get the file chosen by the user
		Part filePart = request.getPart("gambar");

		// get the InputStream to store the file somewhere
		InputStream fileInputStream = filePart.getInputStream();
		
		String gambar = filePart.getSubmittedFileName();
		
		try {
			Barang barang = new Barang();
			barang.setNama_barang(nama);
			barang.setBerat(berat);
			barang.setId_merk(merk);
			barang.setKondisi(kondisi);
			barang.setDiskon(diskon);
			barang.setStok(stok);
			barang.setTgl_upload(tglUpload);
			barang.setGambar(gambar);
			barang.setDeskripsi(deskripsi);
			barang.setHarga(harga);
			barang.setHargadiskon(hargadiskon);
			BarangConnection bC = new BarangConnection();
			bC.createDataBarang(barang);
			
		} catch (Exception e) {
			e.printStackTrace();
            request.setAttribute("error", "Gagal Input Data!");
            doGet(request, response);
		}

		// for example, you can copy the uploaded file to the server
		// note that you probably don't want to do this in real life!
		// upload it to a file host like S3 or GCS instead
		File fileToSave = new File("C:/Users/BagasW/eclipse-workspace/GadgetStore/src/main/webapp/assets/img/"+filePart.getSubmittedFileName());
		Files.copy(fileInputStream, fileToSave.toPath(), StandardCopyOption.REPLACE_EXISTING);
		response.sendRedirect("ListBarang.jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		getServletContext().getRequestDispatcher("/AddBarang.jsp").forward(request, response);

	}

}
