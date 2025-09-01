import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lilac_test/services/models/movie_list.dart';
import '../../services/services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Search> movies = [];
  bool isLoading = true;

  @override
  void initState() {
    getMovies("", 1);
    super.initState();
  }

  getMovies(String query, page) async {
    try {
      isLoading = true;
      final SearchList response = await HttpServices.getMovies(query, page);
      movies = response.search;
      isLoading = false;
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/sl_21.png",
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: GestureDetector(
                    child: TextField(
                      onChanged: (value) {
                        getMovies(value, 1);
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Search movies...",
                        hintStyle: const TextStyle(color: Colors.white70),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.white),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            isLoading == true
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    child: ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: AssetImage(movies[index].poster),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
