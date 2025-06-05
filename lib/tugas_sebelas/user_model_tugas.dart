import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Belanjaan {
  final int? id;
  final String nama;
  final String kategori;
  final int harga;
  final int estimasi;
  Belanjaan({
    this.id,
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.estimasi,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'kategori': kategori,
      'harga': harga,
      'estimasi': estimasi,
    };
  }

  factory Belanjaan.fromMap(Map<String, dynamic> map) {
    return Belanjaan(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      kategori: map['kategori'] as String,
      harga: map['harga'] as int,
      estimasi: map['estimasi'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Belanjaan.fromJson(String source) =>
      Belanjaan.fromMap(json.decode(source) as Map<String, dynamic>);
}
