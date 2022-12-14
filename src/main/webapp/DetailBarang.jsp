<%@page import="database.BarangConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BarangConnection barang = new BarangConnection();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>
	<%
	out.print(barang.getDataBarang(request.getParameter("id")).get(0).getNama_barang());
	%>
</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
	<section id="detail" class="mt-5 py-5">
		<div class="container mt-5">
			<div class="row mb-3">
				<div class="col-md-4">
					<img class="detail-img"
						src="assets/img/<%out.print(barang.getDataBarang(request.getParameter("id")).get(0).getGambar());%>"
						alt="">
				</div>
				<div class="col-md-6 ms-md-3 position-relative">
					<p class="detail-title">
						<%
						out.print(barang.getDataBarang(request.getParameter("id")).get(0).getNama_barang());
						%>
					</p>
					<p class="detail-price">
						<%
						if (Integer.parseInt(barang.getDataBarang(request.getParameter("id")).get(0).getHargadiskon()) != 0) {
							out.print("<span class=\"diskon\">" + barang.getDataBarang(request.getParameter("id")).get(0).getHarga() + "</span>"
							+ barang.getDataBarang(request.getParameter("id")).get(0).getHargadiskon());
						}else{
							out.print(barang.getDataBarang(request.getParameter("id")).get(0).getHarga());
						}
						%>
					</p>
					<h5 class="with-divider">Detail</h5>
					<p class="detail-p">
						Merek :
						<%
					out.print(barang.getDataBarang(request.getParameter("id")).get(0).getId_merk());
					%>
					</p>
					<p class="detail-p">
						Kondisi :
						<%
					out.print(barang.getDataBarang(request.getParameter("id")).get(0).getKondisi());
					%>
					</p>
					<p class="detail-p">
						Berat :
						<%
					out.print(barang.getDataBarang(request.getParameter("id")).get(0).getBerat());
					%>
						gr
					</p>
					<p class="detail-p">
						Stok :
						<%
					out.print(barang.getDataBarang(request.getParameter("id")).get(0).getStok());
					%>
					</p>
				</div>
			</div>
			<div class="row row-mb-3">
				<pre>Deskripsi : <br />	<% out.print(barang.getDataBarang(request.getParameter("id")).get(0).getDeskripsi());%>
				
			</pre>
			</div>

		</div>
	</section>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
</body>

</html>