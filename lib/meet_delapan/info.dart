import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
            // Center(
            Text(
              'Tentang Aplikasi',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            // ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Aplikasi ini dibuat sebagai tugas Flutter yang menampilkan form input interaktif dengan Drawer, dan navigasi bawah menggunakan BottomNavigationBar.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text('Pembuat: Andi Qeis', style: TextStyle(fontSize: 16)),
          Text('Versi: 1.0.0', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
