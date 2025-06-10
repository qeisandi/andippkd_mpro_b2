import 'package:andippkd_mpro_b2/tugas_sebelas/Db_helper_tugas.dart';
import 'package:andippkd_mpro_b2/tugas_sebelas/editOrder.dart';
// import 'package:andippkd_mpro_b2/tugas_sebelas/Db_helper_tugas.dart';
import 'package:andippkd_mpro_b2/tugas_sebelas/user_model_tugas.dart';
import 'package:flutter/material.dart';

class COrder extends StatefulWidget {
  const COrder({super.key});

  @override
  State<COrder> createState() => _COrderState();
}

class _COrderState extends State<COrder> {
  final TextEditingController namaC = TextEditingController();
  final TextEditingController kategoriC = TextEditingController();
  final TextEditingController hargaC = TextEditingController();
  final TextEditingController estimasiC = TextEditingController();
  // final _fromKey = GlobalKey<FormState>();

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
            Expanded(
              child: ListView.builder(
                itemCount: daftarBelanjaan.length,
                itemBuilder: (context, index) {
                  final Belanjaan = daftarBelanjaan[index];
                  return Card(
                    // color: Color(0xff6ba3be),
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(Belanjaan.nama),
                      subtitle: Text(
                        'kategori : ${Belanjaan.kategori}\nharga : ${Belanjaan.harga}\nestimasi : ${Belanjaan.estimasi}',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          EditOrder(belanjaan: Belanjaan),
                                ),
                              );
                              setState(() {
                                muatData();
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      title: Text(
                                        'Apakah anda yakin ingin\nmembatalkan pesanan?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Batal"),
                                        ),

                                        TextButton(
                                          onPressed: () async {
                                            await DbHelperTugas.deleteBelanjaan(
                                              Belanjaan.id!,
                                            );
                                            muatData();
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Berhasil Melakukan Pembatalan",
                                                ),
                                                backgroundColor: Colors.teal,
                                              ),
                                            );
                                          },
                                          child: Text("Lanjut"),
                                        ),
                                      ],
                                    ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
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
