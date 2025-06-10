import 'package:andippkd_mpro_b2/tugas_sebelas/Db_helper_tugas.dart';
import 'package:andippkd_mpro_b2/tugas_sebelas/cancelOrder.dart';
import 'package:andippkd_mpro_b2/tugas_sebelas/user_model_tugas.dart';
import 'package:flutter/material.dart';

class MeetSebelas extends StatefulWidget {
  const MeetSebelas({super.key});

  @override
  State<MeetSebelas> createState() => _MeetSebelasState();
}

class _MeetSebelasState extends State<MeetSebelas> {
  final TextEditingController namaC = TextEditingController();
  final TextEditingController kategoriC = TextEditingController();
  final TextEditingController hargaC = TextEditingController();
  final TextEditingController estimasiC = TextEditingController();
  final _fromKey = GlobalKey<FormState>();

  List<Belanjaan> daftarBelanjaan = [];
  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DbHelperTugas.getAllBelanjaan();
    setState(() {
      daftarBelanjaan = data;
    });
  }

  Future<void> simpanData() async {
    final nama = namaC.text;
    final kategori = kategoriC.text;
    final harga = int.tryParse(hargaC.text) ?? 0;
    final estimasi = int.tryParse(estimasiC.text) ?? 0;

    if (nama.isNotEmpty && harga > 0 && estimasi > 0) {
      await DbHelperTugas.insertBelanjaan(
        Belanjaan(
          nama: nama,
          kategori: kategori,
          harga: harga,
          estimasi: estimasi,
        ),
      );
      namaC.clear();
      kategoriC.clear();
      hargaC.clear();
      estimasiC.clear();
      muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2EFE7),
      appBar: AppBar(
        backgroundColor: Color(0xff006A71),
        title: Text(
          'EpruvShop',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 28,
            color: Color(0xffF2EFE7),
          ),
        ),
      ),
      body: Form(
        key: _fromKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_basket, color: Color(0xff006A71)),
                  SizedBox(width: 10),
                  Text(
                    'Wishlist Belanjaan',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 28,
                      color: Color(0xff006A71),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "nama tidak boleh kosong";
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "kategori tidak boleh kosong";
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "harga tidak boleh kosong";
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "estimasi tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 28),
              ElevatedButton(
                onPressed: () {
                  if (_fromKey.currentState!.validate()) {
                    simpanData();
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 140, vertical: 12),
                  backgroundColor: Color(0xff006A71),
                ),
                child: Text(
                  'Simpan',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    color: Color(0xffF2EFE7),
                    fontSize: 16,
                  ),
                ),
              ),
              Divider(height: 32, color: Color(0xff9ACBD0)),
              Expanded(
                child: ListView.builder(
                  itemCount: daftarBelanjaan.length,
                  itemBuilder: (context, index) {
                    final Belanjaan = daftarBelanjaan[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${Belanjaan.id}')),
                        title: Text(
                          Belanjaan.nama,
                          style: TextStyle(fontFamily: 'Gilroy'),
                        ),
                        subtitle: Text(
                          'kategori : ${Belanjaan.kategori}\nharga : ${Belanjaan.harga}\nestimasi : ${Belanjaan.estimasi}',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => COrder()),
                  );
                  setState(() {
                    muatData();
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                  backgroundColor: Color(0xff006A71),
                ),
                child: Text(
                  'Pembatalan Order',
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
      ),
    );
  }
}
