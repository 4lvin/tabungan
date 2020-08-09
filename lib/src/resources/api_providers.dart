
import 'dart:convert';

import 'package:http/http.dart' as client;
import 'package:skripsitabungan/src/models/getListPembayaranModel.dart';
import 'package:skripsitabungan/src/models/getListPenarikanModel.dart';
import 'package:skripsitabungan/src/models/getListSetorModel.dart';

class ApiProviders {
  String url = "http://jongjava.tech/tabungan_siswa/api";

  Future getListPembayaran() async {
    final data =
    await client.get("$url/listpembayaran.php");
    if (data.statusCode == 200) {
      return GetListPembayaranModel.fromJson(json.decode(data.body));
    } else {
      throw Exception('Failed to load Pembayaran');
    }
  }

  Future getListPenarikan() async {
    final data =
    await client.get("$url/listpenarikan.php");
    if (data.statusCode == 200) {
      return GetListPenarikanModel.fromJson(json.decode(data.body));
    } else {
      throw Exception('Failed to load Penarikan');
    }
  }

  Future getListSetor() async {
    final data =
    await client.get("$url/listsetoran.php");
    if (data.statusCode == 200) {
      return GetListSetorModel.fromJson(json.decode(data.body));
    } else {
      throw Exception('Failed to load Setor');
    }
  }

}