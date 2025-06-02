// import 'package:andippkd_mpro_b2/meet_enam/tugas_enam_flutter.dart';
// import 'package:andippkd_mpro_b2/meet_dua/tugas_dua_flutter.dart';
import 'package:andippkd_mpro_b2/meet_sembilan/tugas_sembilan_b.dart';
import 'package:andippkd_mpro_b2/meet_sembilan/tugas_sembilan_c.dart';
import 'package:andippkd_mpro_b2/meet_sembilan/tugas_sembilan_flutter.dart';
import 'package:andippkd_mpro_b2/meet_tujuh/alarm.dart';
import 'package:andippkd_mpro_b2/meet_tujuh/check_box.dart';
import 'package:andippkd_mpro_b2/meet_tujuh/date.dart';
import 'package:andippkd_mpro_b2/meet_tujuh/drop_down.dart';
import 'package:andippkd_mpro_b2/meet_tujuh/switchA.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeetTujuh extends StatefulWidget {
  const MeetTujuh({super.key});

  @override
  State<MeetTujuh> createState() => _MeetTujuhState();
}

class _MeetTujuhState extends State<MeetTujuh> {
  final List<Widget> widgetOption = [
    CheckBoxA(),
    TujuhB(),
    TujuhD(),
    TujuhC(),
    TujuhE(),
    MeetSembilanA(),
    MeetSembilanB(),
    MeetSembilanC(),
  ];
  //  bool _valueCheck = false;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
            // Center(
            Text(
              'Home',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            // ),
          ],
        ),
      ),
      body: widgetOption[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blueGrey,
                    child: CircleAvatar(
                      radius: 37,
                      backgroundImage: AssetImage("assets/image/cat.jpg"),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Andi Qeis',
                        style: TextStyle(fontFamily: 'Gilroy', fontSize: 24),
                      ),
                      Text('Tugas 7&8 Flutter', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.check_circle_outline_outlined),
              title: Text('Syarat & Ketentuan'),
              subtitle: Text('Chekbox'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.dark_mode_outlined),
              title: Text('Mode Gelap'),
              subtitle: Text('Switch'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month_rounded),
              title: Text('Pilih Tanggal Lahir'),
              subtitle: Text('Tanggal'),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list_alt_rounded),
              title: Text('Pilih Kategori Produk'),
              subtitle: Text('Product baru'),
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.access_time_filled_rounded),
              title: Text('Atur Pengingat'),
              subtitle: Text('Jangan lupa pasang alarm'),
              onTap: () {
                setState(() {
                  _selectedIndex = 4;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('list and map A'),
              subtitle: Text('Tugas 9A'),
              onTap: () {
                setState(() {
                  _selectedIndex = 5;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list_alt),
              title: Text('list and map B'),
              subtitle: Text('Tugas 9B'),
              onTap: () {
                setState(() {
                  _selectedIndex = 6;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Product'),
              subtitle: Text('Tugas 9C'),
              onTap: () {
                setState(() {
                  _selectedIndex = 7;
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 300),
            Row(
              children: [
                Expanded(child: Divider()),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 8),
                //   child: Text("ATAU"),
                // ),
                Expanded(child: Divider()),
              ],
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              iconColor: Colors.red,
              title: Text('Logout', style: TextStyle(fontFamily: 'Gilroy')),
              onTap: () {
                SystemNavigator.pop();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
