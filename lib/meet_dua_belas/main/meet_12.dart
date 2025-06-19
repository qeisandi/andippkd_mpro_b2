import 'package:andippkd_mpro_b2/meet_dua_belas/API/api_flutter_2.dart';
import 'package:andippkd_mpro_b2/meet_dua_belas/main/detail.dart';
import 'package:flutter/material.dart';

class TugasDuaBelas extends StatefulWidget {
  const TugasDuaBelas({super.key});

  @override
  State<TugasDuaBelas> createState() => _TugasDuaBelasState();
}

class _TugasDuaBelasState extends State<TugasDuaBelas> {
  final TextEditingController _searchC = TextEditingController();
  List<dynamic> allData = [];
  List<dynamic> filteredData = [];
  bool isDataInitialized = false;

  void filterAnime(String query) {
    final result =
        allData.where((anime) {
          final title = anime.title?.toLowerCase() ?? '';
          final engTitle = anime.titleEnglish?.toLowerCase() ?? '';
          return title.contains(query.toLowerCase()) ||
              engTitle.contains(query.toLowerCase());
        }).toList();

    setState(() {
      filteredData = result;
    });
  }

  void resetSearch() {
    _searchC.clear();
    setState(() {
      filteredData = allData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff433D8B),
      appBar: AppBar(
        title: const Text(
          'Wibu Bau',
          style: TextStyle(color: Colors.white, fontFamily: 'Gilroy'),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff17153B),
        elevation: 30,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _searchC,
              onChanged: filterAnime,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Cari Anime',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.black),
                  onPressed: resetSearch,
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: ambilUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  if (!isDataInitialized) {
                    allData = snapshot.data!;
                    filteredData = allData;
                    isDataInitialized = true;
                  }

                  if (filteredData.isEmpty) {
                    return const Center(
                      child: Text(
                        "Anime Tidak Ditemukan.",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      final anime = filteredData[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => DetailAnimePage(anime: anime),
                            ),
                          );
                        },
                        child: Card(
                          color: Color(0xff17153B),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Image.network(
                                anime.images?["jpg"]?.imageUrl ?? "",
                                height: 120,
                                width: 90,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return SizedBox(
                                    height: 120,
                                    width: 90,
                                    child: Icon(Icons.broken_image, size: 40),
                                  );
                                },
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        anime.titleJapanese ?? '',
                                        style: const TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                        // maxLines: 2,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        anime.titleEnglish ?? '',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 24),
                                      // Spacer(),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 16,
                                            color: Colors.amber,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            anime.score?.toStringAsFixed(1) ??
                                                'N/A',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No data available."));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
