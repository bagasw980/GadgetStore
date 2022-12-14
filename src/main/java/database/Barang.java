package database;

public class Barang {
	String id_barang, id_merk, nama_barang, kondisi, berat, stok, diskon, harga, hargadiskon, gambar, deskripsi,
			tgl_upload;

	public Barang() {
		super();
	}

	public String getId_barang() {
		return id_barang;
	}

	public void setId_barang(String id_barang) {
		this.id_barang = id_barang;
	}

	public String getId_merk() {
		return id_merk;
	}

	public void setId_merk(String id_merk) {
		this.id_merk = id_merk;
	}

	public String getNama_barang() {
		return nama_barang;
	}

	public void setNama_barang(String nama_barang) {
		this.nama_barang = nama_barang;
	}

	public String getKondisi() {
		return kondisi;
	}

	public void setKondisi(String kondisi) {
		this.kondisi = kondisi;
	}

	public String getBerat() {
		return berat;
	}

	public void setBerat(String berat) {
		this.berat = berat;
	}

	public String getStok() {
		return stok;
	}

	public void setStok(String stok) {
		this.stok = stok;
	}

	public String getDiskon() {
		return diskon;
	}

	public void setDiskon(String diskon) {
		this.diskon = diskon;
	}

	public String getHarga() {
		return harga;
	}

	public void setHarga(String harga) {
		this.harga = harga;
	}

	public String getHargadiskon() {
		return hargadiskon;
	}

	public void setHargadiskon(String hargadiskon) {
		this.hargadiskon = hargadiskon;
	}

	public String getGambar() {
		return gambar;
	}

	public void setGambar(String gambar) {
		this.gambar = gambar;
	}

	public String getDeskripsi() {
		return deskripsi;
	}

	public void setDeskripsi(String deskripsi) {
		this.deskripsi = deskripsi;
	}

	public String getTgl_upload() {
		return tgl_upload;
	}

	public void setTgl_upload(String tgl_upload) {
		this.tgl_upload = tgl_upload;
	}

	public String toString() {
		return "Barang [" + id_barang + ", " + id_merk + ", " + nama_barang + ", " + kondisi + ", " + berat + ", "
				+ stok + ", " + diskon + ", " + harga + ", " + hargadiskon + ", " + gambar + ", " + deskripsi + ", "
				+ tgl_upload + "]";
	}

}
