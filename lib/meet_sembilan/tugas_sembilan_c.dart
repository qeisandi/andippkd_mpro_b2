import 'package:andippkd_mpro_b2/meet_sembilan/model_sembilan_c.dart';
import 'package:flutter/material.dart';

class MeetSembilanC extends StatefulWidget {
  const MeetSembilanC({super.key});

  @override
  State<MeetSembilanC> createState() => _MeetSembilanCState();
}

class _MeetSembilanCState extends State<MeetSembilanC> {
  final List<Elektronik> kategoriC = [
    Elektronik(
      id: "1",
      productName: "PS5 X Spiderman",
      productPrice: '12.000.000,00',
      productImage: "assets/image/pro4.jpg",
    ),
    Elektronik(
      id: "2",
      productName: "Laptop Advan",
      productPrice: '1.200.000,00',
      productImage: "assets/image/pro10.jpg",
    ),
    Elektronik(
      id: "3",
      productName: "Iphone xr",
      productPrice: '8.000.000,00',
      productImage: "assets/image/pro9.jpg",
    ),
    Elektronik(
      id: "4",
      productName: "Iphone 16pro",
      productPrice: '18.000.000,00',
      productImage: "assets/image/pro5.jpg",
    ),
    Elektronik(
      id: "5",
      productName: "Nintendo Switch",
      productPrice: '23.100.000,00',
      productImage: "assets/image/pro1.jpg",
    ),
    Elektronik(
      id: "6",
      productName: "Vr holocaust one set",
      productPrice: '40.000.000,00',
      productImage: "assets/image/pro3.jpg",
    ),
    Elektronik(
      id: "7",
      productName: "TV Toshiba",
      productPrice: '3.000.000,00',
      productImage: "assets/image/pro2.jpg",
    ),
    Elektronik(
      id: "8",
      productName: "Vynl",
      productPrice: '1.000.000,00',
      productImage: "assets/image/pro7.jpg",
    ),
    Elektronik(
      id: "9",
      productName: "HTC one",
      productPrice: '12.000.000,00',
      productImage: "assets/image/pro6.jpg",
    ),
    Elektronik(
      id: "10",
      productName: "Smartphone samsung s24",
      productPrice: '20.300.000,00',
      productImage: "assets/image/pro8.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Model',
          style: TextStyle(fontFamily: 'Gilroy', fontSize: 24),
        ),
      ),
      body: ListView.builder(
        itemCount: kategoriC.length,
        itemBuilder: (BuildContext context, int index) {
          final product = kategoriC[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("${product.productImage}"),
            ),
            title: Text("${product.productName}"),
            subtitle: Text("Rp. ${product.productPrice}"),
          );
        },
      ),
    );
  }
}
