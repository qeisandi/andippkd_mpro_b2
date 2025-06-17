import 'package:andippkd_mpro_b2/meet_dua_belas/API/api_flutter_2.dart';
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
  @override
  void initState() {
    super.initState();
    fetchAnime();
  }

  void fetchAnime() async {
    final data = await ambilUsers();
    setState(() {
      allData = data;
      filteredData = data;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff433D8B),
      appBar: AppBar(
        title: const Text(
          'Wibu Bau',
          style: TextStyle(color: Colors.white, fontFamily: 'Gilroy'),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff17153B),
        elevation: 30,
      ),
      body: Column(
        children: [
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _searchC,
              onChanged: filterAnime,
              decoration: InputDecoration(
                hintText: 'Cari Anime',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.white,
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
                  final filtrerdData = snapshot.data;
                  if (filtrerdData == null || filtrerdData.isEmpty) {
                    return const Center(child: Text("No data found."));
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                    itemCount: filtrerdData.length,
                    itemBuilder: (context, index) {
                      final anime = filtrerdData[index];
                      return Card(
                        color: Color(0xff17153B),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              anime.images?["jpg"]?.imageUrl ?? "",
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.broken_image,
                                  size: 100,
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                anime.title ?? 'No Title',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                anime.titleEnglish ?? '',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    anime.score?.toStringAsFixed(1) ?? 'N/A',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
