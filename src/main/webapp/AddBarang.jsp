<%@page import="database.MerkConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Input Data</title>
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
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
	<main class="mt-5 py-5">
		<div class="container">
			<h1 class="text-center mb-3">Input Barang</h1>
			<div class="row">
				<div class="col-md-6 mx-auto">
					<form enctype="multipart/form-data" action="/GadgetStore/tambah-barang"
						method="POST">
						<div class="mb-3">
							<label for="merk" class="form-label">Merk</label> <select
								id="merk" name="merk" class="form-select mb-3">
								<option selected>Pilih Merk</option>
								<%
								MerkConnection merk = new MerkConnection();
								int jmlData = merk.getDataMerk().size();
								for (int i = 0; i < jmlData; i++) {
								%>
								<option
									value="<%out.print(merk.getDataMerk().get(i).getId_merk());%>">
									<%
									out.print(merk.getDataMerk().get(i).getMerk());
									%>
								</option>
								<%
								}
								%>
							</select>
						</div>
						<div class="mb-3">
							<label for="nama" class="form-label">Nama</label> <input
								type="text" name="nama" class="form-control" required id="nama">
						</div>
						<div class="mb-3">
							<label for="berat" class="form-label">Berat (gram)</label> <input
								type="number" name="berat" class="form-control" required
								id="berat">
						</div>
						<div class="mb-3">
							<label class="form-label">Kondisi</label>
							<div class="form-check">
								<input style="display: inline;" value="Baru"
									class="form-check-input" type="radio" name="kondisi"
									id="kondisi1"> <label class="form-check-label"
									for="kondisi1"> Baru </label>
							</div>
							<div class="form-check">
								<input style="display: inline;" value="Bekas"
									class="form-check-input" type="radio" name="kondisi"
									id="kondisi2"> <label class="form-check-label"
									for="kondisi2"> Bekas </label>
							</div>
						</div>
						<div class="mb-3">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="diskon"
									value="yes" id="diskon" onchange="handleChange(this)">
								<label class="form-check-label" for="diskon"> Sedang
									Diskon </label>
							</div>
						</div>
						<div class="mb-3">
							<label for="harga" class="form-label">Harga</label> <input
								type="number" name="harga" class="form-control" required
								id="harga">
						</div>
						<div class="mb-3 d-none" id="diskonForm">
							<label for="hargaDiskon" class="form-label">Harga Setelah
								Diskon</label> <input type="number" name="hargadiskon"
								class="form-control" id="hargaDiskon">
						</div>
						<div class="mb-3">
							<label for="stok" class="form-label">Stok</label> <input
								type="number" name="stok" class="form-control" required
								id="stok">
						</div>
						<div class="mb-3">
							<label for="gambar" class="form-label">Gambar</label> <input
								type="file" name="gambar" accept="image/*" class="form-control"
								required id="gambar">
						</div>
						<div class="mb-3">
							<label for="tglUpload" class="form-label">Tanggal Upload</label>
							<input type="date" name="tglUpload" class="form-control" required
								id="tglUpload">
						</div>
						<div class="mb-3">
							<label for="deskripsi" class="form-label">Deskripsi</label>
							<textarea name="deskripsi" id="deskripsi" class="form-control"
								rows="10"></textarea>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</main>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script>
		function handleChange(checkbox) {
			if (checkbox.checked == true) {
				document.getElementById("diskonForm").classList
						.remove("d-none");
			} else {
				document.getElementById("diskonForm").classList.add("d-none");
			}
		}
	</script>
</body>

</html>