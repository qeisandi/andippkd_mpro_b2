import 'package:flutter/material.dart';
// import 'package:ppkd_b_2/constant/app_style.dart';

class HalamanTerimakasih extends StatelessWidget {
  const HalamanTerimakasih({super.key, required this.nama, required this.kota});
  final String nama;
  final String kota;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2EFE7),
      appBar: AppBar(
        backgroundColor: Color(0xff006A71),
        centerTitle: true,
        title: Text(
          "Terimakasih",
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 28,
            color: Color(0xffF2EFE7),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            "Selamat!, $nama dari $kota telah mendaftar.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
