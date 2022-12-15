import java.io.IOException;

import database.Barang;
import database.BarangConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteBarang", urlPatterns = "/delete-barang")
public class DeleteBarang extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		getServletContext().getRequestDispatcher("/DetailBarang.jsp").forward(request, response);
		String id = request.getParameter("id");
		Barang barang = new Barang();
		barang.setId_barang(id);
		try {
			BarangConnection bC = new BarangConnection();
			bC.deleteDataBarang(barang);
		} catch (Exception e) {
			e.printStackTrace();
            request.setAttribute("error", "Gagal Delete Data!");
            doGet(request, response);
		}
		response.sendRedirect("/GadgetStore/list-barang");
	}
}
