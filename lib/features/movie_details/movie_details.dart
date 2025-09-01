import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  int _selectedDateIndex = 0;

  final List<String> dates = [
    "12\nFeb",
    "13\nFeb",
    "14\nFeb",
    "15\nFeb",
    "16\nFeb",
    "17\nFeb",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Poster
            Stack(
              children: [
                Image.network(
                  "https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Movie Title + Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Avengers: End Game",
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "English | 3h 2m",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "After the devastating events of Avengers: Infinity War, "
                    "the universe is in ruins. With the help of remaining allies, "
                    "the Avengers assemble once more to reverse Thanos' actions "
                    "and restore balance to the universe.",
                    style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Cast Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Cast",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCastCard("Robert Downey Jr.", "https://image.tmdb.org/t/p/w500/1YjdSym1jTG7xjHSI0yGGWEsw5i.jpg"),
                  _buildCastCard("Chris Evans", "https://image.tmdb.org/t/p/w500/3bOGNsHlrswhyW79uvIHH1V43JI.jpg"),
                  _buildCastCard("Scarlett Johansson", "https://image.tmdb.org/t/p/w500/6NsMbJXRlDZuDzatN2akFdGuTvx.jpg"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Date Selector
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Select Date",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == _selectedDateIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDateIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      width: 60,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.red : Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          dates[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {},
                      child: const Text("Watch Trailer"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {},
                      child: const Text("Book Now"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCastCard(String name, String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 80,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
