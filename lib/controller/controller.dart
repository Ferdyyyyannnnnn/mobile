import 'package:flutter/material.dart';
import 'package:spotify/view/playingview.dart'; 
import 'package:spotify/view/libraryview.dart'; 
import 'package:spotify/view/accountview.dart';

void main() {
  runApp(MusicApp());
}

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cypung.',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MusicHomePage(),
    );
  }
}

class MusicHomePage extends StatefulWidget {
  @override
  _MusicHomePageState createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    MusicPlayerPage(), // Menggunakan MusicPlayerPage
    MusicLibraryView(MusicLibraryController()),
    UserProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cypung.'),
      ),
      body: _currentIndex == 2 ? UserProfileView() : _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow, size: 24),
            label: 'Now Playing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
