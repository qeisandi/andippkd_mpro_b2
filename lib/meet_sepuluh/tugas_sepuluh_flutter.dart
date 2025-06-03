import 'package:andippkd_mpro_b2/meet_sepuluh/halaman_berhasil.dart';
import 'package:flutter/material.dart';

class MeetSepuluh extends StatefulWidget {
  const MeetSepuluh({super.key});

  @override
  State<MeetSepuluh> createState() => _MeetSepuluhState();
}

class _MeetSepuluhState extends State<MeetSepuluh> {
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _namaC = TextEditingController();
  final TextEditingController _noHpC = TextEditingController();
  final TextEditingController _kotaC = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2EFE7),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff006A71),
        title: Text(
          'FlutterApps',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 28,
            color: Color(0xffF2EFE7),
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _fromKey,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Register.',
                style: TextStyle(fontFamily: 'Gilroy', fontSize: 28),
              ),
              SizedBox(height: 24),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _namaC,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.account_circle),
                  labelText: 'Nama lengkap',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _emailC,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email tidak boleh kosong";
                  } else if (!value.contains("@")) {
                    return "Email tidak valid";
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _noHpC,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.phone),
                  labelText: 'No. hp',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nomor tidak boleh kosong";
                  } else if (value.length < 10) {
                    return "Nomor tidak valid";
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: _kotaC,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.location_city),
                  labelText: 'Kota domisili',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Kota tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 38),
              ElevatedButton(
                onPressed: () {
                  if (_fromKey.currentState!.validate()) {
                    print('Berhasil');
                    dialogSuccess(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 148, vertical: 16),
                  backgroundColor: Color(0xff006A71),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  'Login',
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

  Future<dynamic> dialogSuccess(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Berhasil', style: TextStyle(fontFamily: 'Gilroy')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Nama anda : ${_namaC.text}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Email anda : ${_emailC.text}',
                style: TextStyle(fontSize: 16),
              ),
              Text('No hp : ${_noHpC.text}', style: TextStyle(fontSize: 16)),
              Text(
                'Domisili anda : ${_kotaC.text}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => HalamanTerimakasih(
                          nama: _namaC.text,
                          kota: _kotaC.text,
                        ),
                  ),
                );
              },
              child: Text('Lanjut'),
            ),
          ],
        );
      },
    );
  }
}
