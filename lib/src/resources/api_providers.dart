
import 'dart:convert';

import 'package:http/http.dart' as client;
import 'package:skripsitabungan/src/models/getListPembayaranModel.dart';
import 'package:skripsitabungan/src/models/getListPenarikanModel.dart';
import 'package:skripsitabungan/src/models/getListSetorModel.dart';
import 'package:skripsitabungan/src/models/getLoginModel.dart';

class ApiProviders {
  String url = "http://jongjava.tech/tabungan_siswa/api";

  Future getListPembayaran(String id) async {
    final data =
    await client.get("$url/listpembayaran.php?id=$id");
    if (data.statusCode == 200) {
      return GetListPembayaranModel.fromJson(json.decode(data.body));
    } else {
      throw Exception('Failed to load Pembayaran');
    }
  }

  Future getListPenarikan(String id) async {
    final data =
    await client.get("$url/listpenarikan.php?id=$id");
    if (data.statusCode == 200) {
      return GetListPenarikanModel.fromJson(json.decode(data.body));
    } else {
      throw Exception('Failed to load Penarikan');
    }
  }

  Future getListSetor(String id) async {
    final data =
    await client.get("$url/listsetoran.php?=id=$id");
    if (data.statusCode == 200) {
      return GetListSetorModel.fromJson(json.decode(data.body));
    } else {
      throw Exception('Failed to load Setor');
    }
  }

  Future login(String nama,String password) async {
    final data =
    await client.get("$url/login.php?nama=$nama&password=$password");
    if (data.statusCode == 200) {
      return GetLoginModel.fromJson(json.decode(data.body));
    } else {
      throw Exception('Failed to load Setor');
    }
  }

}