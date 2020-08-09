// To parse this JSON data, do
//
//     final getListSetorModel = getListSetorModelFromJson(jsonString);

import 'dart:convert';

class GetListSetorModel {
  GetListSetorModel({
    this.info,
    this.num,
    this.result,
  });

  String info;
  int num;
  List<Result> result;

  factory GetListSetorModel.fromRawJson(String str) => GetListSetorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetListSetorModel.fromJson(Map<String, dynamic> json) => GetListSetorModel(
    info: json["info"],
    num: json["num"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info,
    "num": num,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
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

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
