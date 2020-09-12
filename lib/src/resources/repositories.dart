import 'package:skripsitabungan/src/resources/api_providers.dart';

class Repositories {
  final apiProviders = ApiProviders();

  Future getListPembayaran(String id) => apiProviders.getListPembayaran(id);
  Future getListPenarikan(String id) => apiProviders.getListPenarikan(id);
  Future getListSetor(String id) => apiProviders.getListSetor(id);
  Future login(String nama,String password) => apiProviders.login(nama, password);
}