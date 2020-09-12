import 'package:flutter/material.dart';
import 'package:skripsitabungan/src/bloc/tabunganBloc.dart';
import 'package:skripsitabungan/src/models/getListSetorModel.dart';
import 'package:skripsitabungan/src/pref/preference.dart';

class SetoranPage extends StatefulWidget {
  @override
  _SetoranPageState createState() => _SetoranPageState();
}

class _SetoranPageState extends State<SetoranPage> {

  @override
  void initState() {
    getId().then((value){
      tabunganBloc.getSetor(value);
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
            child: Center(child: Text("List Setoran",style: TextStyle(color: Colors.white),)),
          ),
          Expanded(
            child: StreamBuilder(
              stream: tabunganBloc.setoran,
              builder: (context,AsyncSnapshot<GetListSetorModel> snapshot){
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
                                  Text("Setoran"),
                                  Container(
                                      padding: EdgeInsets.all(8),
                                      color: Colors.green,
                                      child: Text("Rp "+snapshot.data.data[i].setoran,style: TextStyle(color: Colors.white),)),
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
