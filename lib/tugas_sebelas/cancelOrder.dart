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
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
