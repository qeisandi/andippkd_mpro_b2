import 'package:flutter/material.dart';

class MeetSembilanA extends StatefulWidget {
  const MeetSembilanA({super.key});

  @override
  State<MeetSembilanA> createState() => _MeetSembilanAState();
}

class _MeetSembilanAState extends State<MeetSembilanA> {
  List<String> kategori = [
    "buah-buahan",
    "sayuran",
    "elektronik",
    "pakaian wanita",
    "pakaian pria",
    "alat tulis kantor",
    "buku & majalah",
    "peralatan dapur",
    "makanan ringan",
    "minuman",
    "mainan anak",
    "alat olahraga",
    "product kesehatan",
    "kosmetik",
    "obat-obatan",
    "aksesoris mobil",
    "perabotan rumah",
    "sepatu dan sendal",
    "barang bekas",
    "voucher&tiket",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'List',
          style: TextStyle(fontFamily: 'Gilroy', fontSize: 28),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              itemCount: kategori.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  '${index + 1} ${kategori[index]}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
