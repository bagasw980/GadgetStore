<%@page import="database.MerkConnection"%>
<%@page import="database.BarangConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>List Barang | Gadget Store</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/slick/slick.css">
<link rel="stylesheet" href="assets/slick/slick-theme.css">
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"> -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs5/jq-3.6.0/dt-1.12.1/datatables.min.css" />
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
	<div class="container">
		<div class="row my-5 justify-content-center">
			<div class="card mt-5">
				<div class="card-body table-responsive">
					<div class="card-title mb-3 px-3 d-flex justify-content-between">
						<h3>List Barang Gadget Store</h3>
						<a href="tambah-barang" class="btn btn-primary">Tambah</a>
					</div>
					<table id="myTable"
						class="table display table-striped table-bordered">
						<thead>
							<tr class="text-center table-primary">
								<th>No</th>
								<th>Nama Barang</th>
								<th>Merk</th>
								<th>Stok</th>
								<th>Kondisi</th>
								<th>Berat</th>
								<th>Harga</th>
								<th></th>
								<th>Aksi</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<%
							BarangConnection barang = new BarangConnection();
							int jmlData = barang.getDataBarang().size();
							for (int i = 0; i < jmlData; i++) {
							%>
							<tr>
								<td></td>
								<td>
									<%
									out.print(barang.getDataBarang().get(i).getNama_barang());
									%>
								</td>
								<td>
									<%
									String id_merk = barang.getDataBarang().get(i).getId_merk();
									MerkConnection merk = new MerkConnection();
									out.print(merk.getDataMerk(id_merk).get(0).getMerk());
									%>
								</td>
								<td>
									<%
									out.print(barang.getDataBarang().get(i).getStok());
									%>
								</td>
								<td>
									<%
									out.print(barang.getDataBarang().get(i).getKondisi());
									%>
								</td>
								<td>
									<%
									out.print(barang.getDataBarang().get(i).getBerat() + " gr");
									%>
								</td>
								<td>
									<%
									out.print(barang.toRupiah(barang.getDataBarang().get(i).getHarga()));
									%>
								</td>
								<td><a
									href="detail-barang?id=<% out.print(barang.getDataBarang().get(i).getId_barang()); %>"><span
										class="badge bg-primary">Detail</span></a></td>
								<td><a
									href="edit-barang?id=<% out.print(barang.getDataBarang().get(i).getId_barang()); %>"><span
										class="badge bg-success">Edit</span></a></td>
								<td><a
									href="delete-barang?id=<% out.print(barang.getDataBarang().get(i).getId_barang()); %>"><span
										class="badge bg-danger">Hapus</span></a></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<?php require("footer.php") ?>
	<script src="assets/js/jquery-3.6.0.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/slick/slick.min.js"></script>
	<!-- <script src="//cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script> -->
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs5/jq-3.6.0/dt-1.12.1/datatables.min.js">
		
	</script>

	<script>
		$('.list').slick({
			slidesToShow : 4,
			slidesToScroll : 1,
			autoplay : true,
			autoplaySpeed : 2000,
			infinite : true,
		});
	</script>
	<script>
		var t = $('#myTable').DataTable({
			columnDefs : [ {
				searchable : false,
				orderable : false,
				targets : 0,
			}, ],
			order : [ [ 1, 'asc' ] ],
		});

		t.on('order.dt search.dt', function() {
			let i = 1;

			t.cells(null, 0, {
				search : 'applied',
				order : 'applied'
			}).every(function(cell) {
				this.data(i++);
			});
		}).draw();
	</script>
</body>

</html>