// To parse this JSON data, do
//
//     final getListPenarikanModel = getListPenarikanModelFromJson(jsonString);

import 'dart:convert';

class GetListPenarikanModel {
  GetListPenarikanModel({
    this.data,
  });

  List<Datum> data;

  factory GetListPenarikanModel.fromRawJson(String str) => GetListPenarikanModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetListPenarikanModel.fromJson(Map<String, dynamic> json) => GetListPenarikanModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.idTabungan,
    this.idSiswa,
    this.setoran,
    this.penarikan,
    this.saldo,
    this.pembayaran,
  });

  String idTabungan;
  String idSiswa;
  String setoran;
  String penarikan;
  String saldo;
  String pembayaran;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idTabungan: json["id_tabungan"],
    idSiswa: json["id_siswa"],
    setoran: json["setoran"],
    penarikan: json["penarikan"],
    saldo: json["saldo"],
    pembayaran: json["pembayaran"],
  );

  Map<String, dynamic> toJson() => {
    "id_tabungan": idTabungan,
    "id_siswa": idSiswa,
    "setoran": setoran,
    "penarikan": penarikan,
    "saldo": saldo,
    "pembayaran": pembayaran,
  };
}
