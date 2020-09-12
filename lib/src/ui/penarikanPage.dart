import 'package:flutter/material.dart';
import 'package:skripsitabungan/src/bloc/tabunganBloc.dart';
import 'package:skripsitabungan/src/models/getListPenarikanModel.dart';
import 'package:skripsitabungan/src/pref/preference.dart';

class PenarikanPage extends StatefulWidget {
  @override
  _PenarikanPageState createState() => _PenarikanPageState();
}

class _PenarikanPageState extends State<PenarikanPage> {

  @override
  void initState() {
    getId().then((value){
      tabunganBloc.getPenarikan(value);
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
            child: Center(child: Text("List Penarikan",style: TextStyle(color: Colors.white),)),
          ),
          Expanded(
            child: StreamBuilder(
              stream: tabunganBloc.penarikan,
              builder: (context,AsyncSnapshot<GetListPenarikanModel> snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                      itemCount: snapshot.data.result.length,
                      itemBuilder: (context,int i){
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Penarikan"),
                                  Container(
                                      padding: EdgeInsets.all(8),
                                      color: Colors.red,
                                      child: Text("Rp "+snapshot.data.result[i].penarikan,style: TextStyle(color: Colors.white),)),
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
