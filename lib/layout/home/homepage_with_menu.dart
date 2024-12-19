import 'package:flutter/material.dart';
import 'gridview_learning.dart';
import 'listview_learning.dart';

class HomepageWithMenu extends StatefulWidget {
  const HomepageWithMenu({super.key});

  @override
  HomepageWithMenuState createState() => HomepageWithMenuState(); // Ganti nama class state agar tidak diawali dengan underscore
}

class HomepageWithMenuState extends State<HomepageWithMenu> {
  int _currentIndex = 0; // Indeks halaman aktif

  // Daftar halaman untuk navigasi
  final List<Widget> _pages = [
    const HomePageContent(), // Konten halaman utama
    const GridviewLearning(), // Halaman GridView
    const ListviewLearning(), // Halaman ListView
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage with Menu'),
      ),
      body: _pages[_currentIndex], // Halaman aktif sesuai indeks
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Perbarui indeks halaman
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'GridView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ListView',
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GridviewLearning(),
                ),
              );
            },
            child: const Text('Go to GridView'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListviewLearning(),
                ),
              );
            },
            child: const Text('Go to ListView'),
          ),
        ],
      ),
    );
  }
}
