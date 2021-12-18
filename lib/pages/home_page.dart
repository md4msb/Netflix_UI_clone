import 'package:flutter/material.dart';
import 'downloads.dart';
import 'emoji.dart';
import 'netflix_home.dart';
import 'upcoming.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  switchScreen(int index) {
    setState(
      () {
        selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      const NetflixHome(),
      const UpComing(),
      const Downloads(),
      const Emoji(),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Upcoming",
            icon: Icon(Icons.ondemand_video_sharp),
          ),
          BottomNavigationBarItem(
            label: "Downloads",
            icon: Icon(Icons.download),
          ),
          BottomNavigationBarItem(
            label: "Laugh Face",
            icon: Icon(Icons.emoji_emotions_rounded),
          ),
        ],
        onTap: switchScreen,
        currentIndex: selectedIndex,
      ),
    );
  }
}
