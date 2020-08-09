import 'package:skripsitabungan/src/resources/api_providers.dart';

class Repositories {
  final apiProviders = ApiProviders();

  Future getListPembayaran() => apiProviders.getListPembayaran();
  Future getListPenarikan() => apiProviders.getListPenarikan();
  Future getListSetor() => apiProviders.getListSetor();
}