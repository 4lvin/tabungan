
import 'package:rxdart/rxdart.dart';
import 'package:skripsitabungan/src/models/getListPembayaranModel.dart';
import 'package:skripsitabungan/src/models/getListPenarikanModel.dart';
import 'package:skripsitabungan/src/models/getListSetorModel.dart';
import 'package:skripsitabungan/src/resources/repositories.dart';

class TabunganBloc {
  final _repository = Repositories();
  final _listPmbyaranFetcher = PublishSubject<GetListPembayaranModel>();
  final _listPnarikanFetcher = PublishSubject<GetListPenarikanModel>();
  final _listSetoranFetcher = PublishSubject<GetListSetorModel>();

  PublishSubject<GetListPembayaranModel> get pembayaran => _listPmbyaranFetcher.stream;
  PublishSubject<GetListPenarikanModel> get penarikan => _listPnarikanFetcher.stream;
  PublishSubject<GetListSetorModel> get setoran => _listSetoranFetcher.stream;

  getPembayaran() async {
    GetListPembayaranModel getListPembayaranModel = await _repository.getListPembayaran();
    _listPmbyaranFetcher.sink.add(getListPembayaranModel);
  }
  getPenarikan() async {
    GetListPenarikanModel getListPenarikanModel = await _repository.getListPenarikan();
    _listPnarikanFetcher.sink.add(getListPenarikanModel);
  }

  getSetor() async {
    GetListSetorModel getListSetorModel = await _repository.getListSetor();
    _listSetoranFetcher.sink.add(getListSetorModel);
  }

  dispose(){
    _listPmbyaranFetcher.close();
    _listPnarikanFetcher.close();
    _listSetoranFetcher.close();
  }
}
final tabunganBloc = TabunganBloc();