import 'package:andippkd_mpro_b2/tugas_sebelas/Db_helper_tugas.dart';
import 'package:andippkd_mpro_b2/tugas_sebelas/user_model_tugas.dart';
import 'package:flutter/material.dart';

class EditOrder extends StatefulWidget {
  final Belanjaan belanjaan;
  const EditOrder({super.key, required this.belanjaan});

  @override
  State<EditOrder> createState() => _EditOrderState();
}

class _EditOrderState extends State<EditOrder> {
  late TextEditingController namaC = TextEditingController();
  late TextEditingController kategoriC = TextEditingController();
  late TextEditingController hargaC = TextEditingController();
  late TextEditingController estimasiC = TextEditingController();

  List<Belanjaan> daftarBelanjaan = [];
  @override
  void initState() {
    super.initState();
    namaC = TextEditingController(text: widget.belanjaan.nama);
    kategoriC = TextEditingController(text: widget.belanjaan.kategori);
    hargaC = TextEditingController(text: widget.belanjaan.harga.toString());
    estimasiC = TextEditingController(
      text: widget.belanjaan.estimasi.toString(),
    );
  }

  void update() async {
    final updated = Belanjaan(
      id: widget.belanjaan.id,
      nama: namaC.text,
      kategori: kategoriC.text,
      harga: int.tryParse(hargaC.text) ?? 0,
      estimasi: int.tryParse(estimasiC.text) ?? 0,
    );

    await DbHelperTugas.updateBelanjaan(updated);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2EFE7),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff006A71),
        title: Text(
          'Cancel Wishlist',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 24,
            color: Color(0xffF2EFE7),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: namaC,
              decoration: InputDecoration(
                fillColor: Color(0xffF5ECD5),
                filled: true,
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                hintText: 'Nama product',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: Icon(Icons.shopping_bag),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: kategoriC,
              decoration: InputDecoration(
                fillColor: Color(0xffF5ECD5),
                filled: true,
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                hintText: 'kategori belanjaan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: Icon(Icons.list_alt),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: hargaC,
              decoration: InputDecoration(
                fillColor: Color(0xffF5ECD5),
                filled: true,
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                hintText: 'Price list',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              textInputAction: TextInputAction.done,
              controller: estimasiC,
              decoration: InputDecoration(
                fillColor: Color(0xffF5ECD5),
                filled: true,
                hintText: 'Estimasi barang',
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
            SizedBox(height: 28),
            ElevatedButton(
              onPressed: () {
                update();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Berhasil Mengubah Pesanan"),
                    backgroundColor: Colors.teal,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 140, vertical: 12),
                backgroundColor: Color(0xff006A71),
              ),
              child: Text(
                'Update',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color(0xffF2EFE7),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
