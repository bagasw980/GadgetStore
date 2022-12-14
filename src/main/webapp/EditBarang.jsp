<%@page import="database.MerkConnection"%>
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
<title>Input Data</title>
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
</head>

<body>
	<main class="mt-5 py-5">
		<div class="container">
			<h1 class="text-center mb-3">Edit Barang</h1>
			<div class="row">
				<div class="col-md-6 mx-auto">
					<form enctype="multipart/form-data" action="update-data.php"
						method="POST">
						<div class="mb-3">
							<label for="merk" class="form-label">Merk</label> <select
								id="merk" name="merk" class="form-select mb-3">
								<%
								MerkConnection merk = new MerkConnection();
								int jmlData = merk.getDataMerk().size();
								for (int i = 0; i < jmlData; i++) {
								%>
								<option
									value="<%out.print(merk.getDataMerk().get(i).getId_merk());
if (merk.getDataMerk().get(i).getId_merk() == barang.getDataBarang(request.getParameter("id")).get(0).getId_merk()) {
	out.print("selected");
}%>">
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
								type="text" name="nama" class="form-control" required id="nama"
								value="<% out.print( barang.getDataBarang(request.getParameter("id")).get(0).getNama_barang()); %>">
						</div>
						<div class="mb-3">
							<label class="form-label">Kondisi</label>
							<div class="form-check">
								<input style="display: inline;" value="Baru"
									class="form-check-input" type="radio" name="kondisi"
									id="kondisi1" <% if(barang.getDataBarang(request.getParameter("id")).get(0).getKondisi().length()==4){out.print("checked");} %>>
									<label class="form-check-label" for="kondisi1"> Baru </label>
							</div>
							<div class="form-check">
								<input style="display: inline;" value="Bekas"
									class="form-check-input" type="radio" name="kondisi"
									id="kondisi2" <% if(barang.getDataBarang(request.getParameter("id")).get(0).getKondisi().length()==5){out.print("checked");} %>>
									<label class="form-check-label" for="kondisi2"> Bekas </label>
							</div>
						</div>
						<div class="mb-3">
							<label for="berat" class="form-label">Berat (gram)</label> <input
								type="number" name="berat" class="form-control" required
								id="berat" value="<% out.print(barang.getDataBarang(request.getParameter("id")).get(0).getBerat()); %>">
						</div>
						<div class="mb-3">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="diskon"
									value="yes" id="diskon" onchange="handleChange(this)"
									<%if(barang.getDataBarang(request.getParameter("id")).get(0).getDiskon().length()==3){out.print("checked");
	}%>>
								<label class="form-check-label" for="diskon"> Sedang Diskon </label>
							</div>
						</div>
						<div class="mb-3">
							<label for="harga" class="form-label">Harga</label> <input
								type="number" name="harga" class="form-control" required
								id="harga"
								value="<%out.print(barang.getDataBarang(request.getParameter("id")).get(0).getHarga());%>">
						</div>
						<div class="mb-3 d-none" id="diskonForm">
							<label for="hargaDiskon" class="form-label">Harga Setelah
								Diskon</label> <input type="number" name="hargadiskon"
								class="form-control" id="hargaDiskon"
								value="<%out.print(barang.getDataBarang(request.getParameter("id")).get(0).getHargadiskon());%>">
						</div>
						<div class="mb-3">
							<label for="stok" class="form-label">Stok</label> <input
								type="number" name="stok" class="form-control" required
								id="stok"
								value="<%out.print(barang.getDataBarang(request.getParameter("id")).get(0).getStok());%>">
						</div>
						<div class="mb-3">
							<label for="deskripsi" class="form-label">Deskripsi</label>
							<textarea name="deskripsi" id="deskripsi" class="form-control"
								rows="10">
								<%
								out.print(barang.getDataBarang(request.getParameter("id")).get(0).getDeskripsi());
								%>
							</textarea>
						</div>
						<input type="hidden" name="id"
							value="<%out.print(barang.getDataBarang(request.getParameter("id")).get(0).getId_barang());%>">
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
			<?php  } ?>
		</div>
	</main>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script>
		const isChecked = document.getElementById('diskon');

		if (isChecked.checked) {
			document.getElementById("diskonForm").classList.remove("d-none");
		} else {
			document.getElementById("diskonForm").classList.add("d-none");
		}

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