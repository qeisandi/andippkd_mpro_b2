import 'package:andippkd_mpro_b2/meet_delapan/info.dart';
import 'package:andippkd_mpro_b2/meet_tujuh/tugas_tujuh_flutter.dart';
import 'package:flutter/material.dart';

class TugasDelapan extends StatefulWidget {
  const TugasDelapan({super.key});

  @override
  State<TugasDelapan> createState() => _TugasDelapanState();
}

class _TugasDelapanState extends State<TugasDelapan> {
  int _bottom = 0;
  static const List<Widget> _widgetOption = <Widget>[MeetTujuh(), Info()];
  void _onItemTapped(int index) {
    setState(() {
      _bottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOption.elementAt(_bottom)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: 'Tentang Aplikasi',
          ),
        ],
        currentIndex: _bottom,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
