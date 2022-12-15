<%@page import="database.BarangConnection"%>
<%@page import="database.MerkConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gadget Store</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/slick/slick.css">
<link rel="stylesheet" href="assets/slick/slick-theme.css">
</head>

<body>
	<nav
		class="navbar navbar-expand-md navbar-dark bg-dark py-md-3 position-fixed fixed-top">
		<div class="container-md">
			<a href="/GadgetStore" class="navbar-brand">Gadget Store</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav1"
				aria-controls="navbarNav1" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse ms-3" id="navbarNav1">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown1"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Pages </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown1">
							<li><a class="dropdown-item" href="/GadgetStore">Home</a></li>
							<li><a class="dropdown-item" href="/GadgetStore/list-barang">List
									Barang</a></li>
							<li><a class="dropdown-item"
								href="/GadgetStore/tambah-barang">Input Barang</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<section class="hero mt-5">
		<div id="carouselExampleInterval" class="carousel slide"
			data-bs-touch="true" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="10000">
					<img src="assets/img/hero1.jpg" class="d-block w-100" alt="hero">
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img src="assets/img/hero2.jpg" class="d-block w-100" alt="hero">
				</div>
				<div class="carousel-item">
					<img src="assets/img/hero3.jpg" class="d-block w-100" alt="hero">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</section>
	<section id="brand" class="bg-light mb-5 pt-1 pb-5">
		<div
			class="container d-flex justify-content-center flex-wrap align-items-center">
			<div class="col-4 col-md-2 col-lg-2 p-4">
				<img class="brand-logo" src="assets/img/samsung.png" alt="">
			</div>
			<div class="col-4 col-md-2 col-lg-2 p-4">
				<img class="brand-logo" src="assets/img/vivo.png" alt="">
			</div>
			<div class="col-4 col-md-2 col-lg-2 p-4">
				<img class="brand-logo" src="assets/img/oppo.png" alt="">
			</div>
			<div class="col-4 col-md-2 col-lg-2 p-4">
				<img class="brand-logo" src="assets/img/realme.png" alt="">
			</div>
			<div class="col-4 col-md-2 col-lg-2 p-4">
				<img class="brand-logo" src="assets/img/xiaomi.png" alt="">
			</div>
			<div class="col-4 col-md-2 col-lg-2 p-4">
				<img class="brand-logo" src="assets/img/huawei.png" alt="">
			</div>
			<div class="col-4 col-md-2 col-lg-2 p-4">
				<img class="brand-logo" src="assets/img/nokia.png" alt="">
			</div>
			<div class="col-4 col-md-2 col-lg-2 p-4">
				<img class="brand-logo" src="assets/img/infinix.png" alt="">
			</div>
		</div>
	</section>
	<section class="bg-white mt-5 py-3">
		<div class="container">
			<div class="row">
				<h2>Hot Promo</h2>
			</div>
			<div class="row list"></div>
		</div>
	</section>
	<%
	MerkConnection merk = new MerkConnection();
	int jmlDataMerk = merk.getDataMerk().size();
	for (int i = 0; i < jmlDataMerk; i++) {
	%>
	<section class="bg-white mt-5 py-3">
		<div class="container">
			<div class="row">
				<h2>
					<%
					out.print(merk.getDataMerk().get(i).getMerk());
					%>
				</h2>
			</div>
			<div class="row list">
				<%
				BarangConnection barang = new BarangConnection();
				int jmlData = barang.getDataBarangMerk(merk.getDataMerk().get(i).getId_merk()).size();
				for (int j = 0; j < jmlData; j++) {
				%>
				<div class="produk-list">
					<a href="detail-barang?id=<% out.print(barang.getDataBarangMerk(merk.getDataMerk().get(i).getId_merk()).get(j).getId_barang()); %>">
						<img src="assets/img/<% out.print(barang.getDataBarangMerk(merk.getDataMerk().get(i).getId_merk()).get(j).getGambar()); %>" alt="">
						<p class="name-desc">
							<% out.print(barang.getDataBarangMerk(merk.getDataMerk().get(i).getId_merk()).get(j).getNama_barang()); %>
						</p>
						<p class="price-desc"></p>
					</a>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</section>
	<%
	}
	%>
	<script src="assets/js/jquery-3.6.0.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/slick/slick.min.js"></script>
	<script>
		$('.list').slick({
			slidesToShow : 4,
			slidesToScroll : 1,
			autoplay : true,
			autoplaySpeed : 2000,
			infinite : true,
		});
	</script>
</body>

</html>