import 'package:flutter/material.dart';

class MeetSembilanB extends StatefulWidget {
  const MeetSembilanB({super.key});

  @override
  State<MeetSembilanB> createState() => _MeetSembilanBState();
}

class _MeetSembilanBState extends State<MeetSembilanB> {
  List<Map<String, dynamic>> kategoriA = [
    {'nama': 'Buah-buahan', 'icon': Icons.apple},
    {'nama': 'Sayuran', 'icon': Icons.grass},
    {'nama': 'Elektronik', 'icon': Icons.laptop_chromebook},
    {'nama': 'Pakaian Pria', 'icon': Icons.man_2},
    {'nama': 'Pakaina Wanita', 'icon': Icons.woman_2},
    {'nama': 'Alat tulis kantor', 'icon': Icons.military_tech},
    {'nama': 'Buku & majalah', 'icon': Icons.book},
    {'nama': 'Peralatan dapur', 'icon': Icons.kitchen},
    {'nama': 'Makanan ringan', 'icon': Icons.food_bank},
    {'nama': 'Minuman', 'icon': Icons.local_drink},
    {'nama': 'Mainan anak', 'icon': Icons.toys},
    {'nama': 'Alat Olahraga', 'icon': Icons.sports},
    {'nama': 'Product kesehatan', 'icon': Icons.healing},
    {'nama': 'Kosmetik', 'icon': Icons.woman_sharp},
    {'nama': 'Obat-obatan', 'icon': Icons.health_and_safety_rounded},
    {'nama': 'Aksesoris Mobil', 'icon': Icons.car_repair},
    {'nama': 'Perabotan rumah', 'icon': Icons.home_filled},
    {'nama': 'Sepatu & Sendal', 'icon': Icons.grass_outlined},
    {'nama': 'Barang bekas', 'icon': Icons.traffic_sharp},
    {'nama': 'Voucher & Ticket', 'icon': Icons.airplane_ticket},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Map and List',
          style: TextStyle(fontFamily: 'Gilroy', fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: kategoriA.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(kategoriA[index]["icon"]),
            title: Text(kategoriA[index]['nama']),
          );
        },
      ),
    );
  }
}
