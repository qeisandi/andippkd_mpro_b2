import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/Api/api_2.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/model/model_profile.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/dashboard.dart';
import 'package:flutter/material.dart';

class ProfileLimaBelas extends StatefulWidget {
  static const String id = "/profile";
  const ProfileLimaBelas({super.key});

  @override
  State<ProfileLimaBelas> createState() => _ProfileLimaBelasState();
}

class _ProfileLimaBelasState extends State<ProfileLimaBelas> {
  UserServis userServis = UserServis();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              ),
          icon: Icon(Icons.keyboard_arrow_left_sharp),
          color: Colors.white,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          'Get API',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<Profile>(
        future: userServis.profileUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("Profile Tidak Ditemukan"));
          }

          final user = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle, size: 150, color: Colors.grey),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 68)),
                      Text(
                        user.name ?? '',
                        style: TextStyle(fontFamily: 'Gilroy', fontSize: 24),
                      ),
                      SizedBox(height: 5),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.black, size: 20),
                        onPressed: () {
                          _showEditDialog(context, user.name ?? '');
                        },
                      ),
                    ],
                  ),
                  Text(
                    user.email ?? '',
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, String currentName) {
    final nameController = TextEditingController(text: currentName);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Edit Profil"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Nama"),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Batal"),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await userServis.updateProfile(name: nameController.text);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Profil berhasil diperbarui")),
                    );
                    setState(() {});
                  } catch (e) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Gagal update: $e")));
                  }
                },
                child: Text("Simpan"),
              ),
            ],
          ),
    );
  }
}
