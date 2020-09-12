// To parse this JSON data, do
//
//     final getLoginModel = getLoginModelFromJson(jsonString);

import 'dart:convert';

class GetLoginModel {
  GetLoginModel({
    this.data,
  });

  List<Datum> data;

  factory GetLoginModel.fromRawJson(String str) => GetLoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetLoginModel.fromJson(Map<String, dynamic> json) => GetLoginModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.idSiswa,
    this.nama,
    this.password,
    this.jenisKelamin,
    this.alamat,
    this.kelas,
    this.telepon,
    this.url,
  });

  String idSiswa;
  String nama;
  String password;
  String jenisKelamin;
  String alamat;
  String kelas;
  String telepon;
  String url;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idSiswa: json["id_siswa"],
    nama: json["nama"],
    password: json["password"],
    jenisKelamin: json["jenis_kelamin"],
    alamat: json["alamat"],
    kelas: json["kelas"],
    telepon: json["telepon"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id_siswa": idSiswa,
    "nama": nama,
    "password": password,
    "jenis_kelamin": jenisKelamin,
    "alamat": alamat,
    "kelas": kelas,
    "telepon": telepon,
    "url": url,
  };
}
