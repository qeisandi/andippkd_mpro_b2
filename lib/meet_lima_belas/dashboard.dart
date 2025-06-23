import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/Api/api_2.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/model/model_profile.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/login.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "/dashboard";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserServis userServis = UserServis();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          'Get Api',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            FutureBuilder<Profile>(
              future: userServis.profileUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: Text("Profile Tidak Ditemukan"));
                }

                final User = snapshot.data!;
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Icon(Icons.account_circle, color: Colors.grey, size: 100),
                      SizedBox(height: 10),
                      Text(
                        '${User.name}',
                        style: TextStyle(fontFamily: 'Gilroy', fontSize: 16),
                      ),
                      ListTile(
                        leading: Icon(Icons.manage_accounts_sharp),
                        title: Text('Profile'),
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, ProfileLimaBelas.id);
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Logout'),
                        onTap: () {
                          setState(() {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    title: Text(
                                      'Apakah anda yakin ingin\nlogout?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Tidak"),
                                      ),

                                      TextButton(
                                        onPressed: () async {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => SignInPage(),
                                            ),
                                            (route) => false,
                                          );
                                        },
                                        child: Text("Iya"),
                                      ),
                                    ],
                                  ),
                            );
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Text(
                'Dashboard',
                style: TextStyle(fontFamily: 'Gilroy', fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
