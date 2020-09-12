
import 'package:rxdart/rxdart.dart';
import 'package:skripsitabungan/src/models/getListPembayaranModel.dart';
import 'package:skripsitabungan/src/models/getListPenarikanModel.dart';
import 'package:skripsitabungan/src/models/getListSetorModel.dart';
import 'package:skripsitabungan/src/models/getLoginModel.dart';
import 'package:skripsitabungan/src/resources/repositories.dart';

class TabunganBloc {
  final _repository = Repositories();
  final _listPmbyaranFetcher = PublishSubject<GetListPembayaranModel>();
  final _listPnarikanFetcher = PublishSubject<GetListPenarikanModel>();
  final _listSetoranFetcher = PublishSubject<GetListSetorModel>();
  final _loginFetcher = PublishSubject<GetLoginModel>();

  PublishSubject<GetListPembayaranModel> get pembayaran => _listPmbyaranFetcher.stream;
  PublishSubject<GetListPenarikanModel> get penarikan => _listPnarikanFetcher.stream;
  PublishSubject<GetListSetorModel> get setoran => _listSetoranFetcher.stream;
  PublishSubject<GetLoginModel> get getLogin => _loginFetcher.stream;

  getPembayaran(String id) async {
    GetListPembayaranModel getListPembayaranModel = await _repository.getListPembayaran(id);
    _listPmbyaranFetcher.sink.add(getListPembayaranModel);
  }
  getPenarikan(String id) async {
    GetListPenarikanModel getListPenarikanModel = await _repository.getListPenarikan(id);
    _listPnarikanFetcher.sink.add(getListPenarikanModel);
  }

  getSetor(String id) async {
    GetListSetorModel getListSetorModel = await _repository.getListSetor(id);
    _listSetoranFetcher.sink.add(getListSetorModel);
  }

  login(String nama,String password) async {
    GetLoginModel getLoginModel = await _repository.login(nama, password);
    _loginFetcher.sink.add(getLoginModel);
  }

  dispose(){
    _listPmbyaranFetcher.close();
    _listPnarikanFetcher.close();
    _listSetoranFetcher.close();
    _loginFetcher.close();
  }
}
final tabunganBloc = TabunganBloc();