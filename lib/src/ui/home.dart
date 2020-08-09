import 'package:flutter/material.dart';
import 'package:skripsitabungan/src/ui/pembayaranPage.dart';
import 'package:skripsitabungan/src/ui/penarikanPage.dart';
import 'package:skripsitabungan/src/ui/profilPage.dart';
import 'package:skripsitabungan/src/ui/setoranPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> _widgetOptions = [
    SetoranPage(),
    PenarikanPage(),
    PembayaranPage(),
    ProfilPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
          bucket: bucket, child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Setoran'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('Penarikan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('Pemabayran'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        elevation: 16,
        unselectedItemColor: const Color(0xFFbdbfbe),
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff740e13),
        onTap: _onItemTapped,
      ),
    );
  }
}
