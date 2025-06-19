import 'package:flutter/material.dart';

class DetailAnimePage extends StatefulWidget {
  final dynamic anime;

  const DetailAnimePage({super.key, required this.anime});

  @override
  State<DetailAnimePage> createState() => _DetailAnimePageState();
}

class _DetailAnimePageState extends State<DetailAnimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff17153B),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
        title: Text(
          'Detail Anime',
          style: TextStyle(fontFamily: 'Gilroy', color: Colors.white),
        ),
        backgroundColor: const Color(0xff1F1B4C),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.anime.titleJapanese ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Gilroy',
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(height: 18),
            // Poster
            Center(
              child: Image.network(
                widget.anime.images?['jpg']?.imageUrl ?? '',
                height: 300,
                fit: BoxFit.cover,
                // errorBuilder:
                //     (context, error, stackTrace) =>
                //          Icon(Icons.broken_image, size: 100),
              ),
            ),
            const SizedBox(height: 20),

            // Judul Anime
            Text(
              widget.anime.title ?? 'No Title',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            if (widget.anime.titleEnglish != null &&
                widget.anime.titleEnglish != "")
              Text(
                widget.anime.titleEnglish,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            const SizedBox(height: 12),

            // Skor
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 6),
                Text(
                  widget.anime.score?.toStringAsFixed(1) ?? 'N/A',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Sinopsis atau deskripsi
            Text(
              widget.anime.synopsis ?? 'Tidak ada deskripsi.',
              style: const TextStyle(fontSize: 14, color: Colors.white70),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
