import 'package:flutter/material.dart';
import 'package:skripsitabungan/src/bloc/tabunganBloc.dart';
import 'package:skripsitabungan/src/models/getListPembayaranModel.dart';
import 'package:skripsitabungan/src/pref/preference.dart';

class PembayaranPage extends StatefulWidget {
  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {

  @override
  void initState() {
    getId().then((value){
      tabunganBloc.getPembayaran(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            padding: EdgeInsets.only(top: 18),
            width: MediaQuery.of(context).size.width,
            color: Colors.blueGrey,
            child: Center(child: Text("List Pembayaran",style: TextStyle(color: Colors.white),)),
          ),
          Expanded(
            child: StreamBuilder(
              stream: tabunganBloc.pembayaran,
              builder: (context,AsyncSnapshot<GetListPembayaranModel> snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data.data.length,
                      itemBuilder: (context,int i){
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Pembayaran "+snapshot.data.data[i].pembayaran),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  color: Colors.red,
                                    child: Text("Rp "+snapshot.data.data[i].penarikan,style: TextStyle(color: Colors.white),)),
                              ],
                            ),
                          ),
                          Divider()
                        ],
                      );
                      });
                }else{
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
