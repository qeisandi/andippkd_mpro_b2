import 'package:flutter/material.dart';

class TujuhC extends StatefulWidget {
  const TujuhC({super.key});

  @override
  State<TujuhC> createState() => _TujuhCState();
}

class _TujuhCState extends State<TujuhC> {
  String? isSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: DropdownButton<String>(
              // nomor 3
              value: isSelected,
              hint: Text("Pilih Kategori Produk"),
              items:
                  ["Elektronik", "Pakaian", "Makanan", "Lainnya"].map((
                    String val,
                  ) {
                    return DropdownMenuItem(value: val, child: Text(val));
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  isSelected = value;
                });
              },
            ),
          ),
          Text(
            isSelected != null
                ? "Anda memilih kategori: $isSelected"
                : "belum memilih kategori",
          ),
        ],
      ),
    );
  }
}
