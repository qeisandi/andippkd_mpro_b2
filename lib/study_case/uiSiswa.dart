import 'package:andippkd_mpro_b2/study_case/Db_helper_dua.dart';
import 'package:andippkd_mpro_b2/study_case/user_model_dua.dart';
import 'package:flutter/material.dart';

class SiswaApps extends StatefulWidget {
  const SiswaApps({super.key});

  @override
  _SiswaAppsState createState() => _SiswaAppsState();
}

class _SiswaAppsState extends State<SiswaApps> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController umurController = TextEditingController();

  List<Siswa> daftarSiswa = [];
  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DbHelperDua.getAllSiswa();
    setState(() {
      daftarSiswa = data;
    });
  }

  Future<void> simpanData() async {
    final nama = nameController.text;
    final umur = int.tryParse(umurController.text) ?? 0;

    if (nama.isNotEmpty && umur > 0) {
      await DbHelperDua.insertSiswa(Siswa(nama: nama, umur: umur));
      nameController.clear();
      umurController.clear();
      muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pendaftaran siswa',
          style: TextStyle(fontFamily: 'Gilroy', fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: umurController,
              decoration: InputDecoration(labelText: 'Umur'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: simpanData, child: Text('Simpan')),
            Divider(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: daftarSiswa.length,
                itemBuilder: (context, index) {
                  final siswa = daftarSiswa[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${siswa.id}')),
                    title: Text(siswa.nama),
                    subtitle: Text('Umur : ${siswa.umur}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
