import 'package:flutter/material.dart';
import 'package:untitled/ITIproject/NavBar.dart';


import 'Categories.dart';
import 'HomeScreen.dart';
import 'ProfilePage.dart';


class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _TaskLayoutScreenState();
}

class _TaskLayoutScreenState extends State<Mainscreen> {
  // get pages => null;

  // get bottomNavBarIndex => null;
  int bottomNavBarIndex = 0;

  List pages = [
    const Homescreen(),
    const Profilepage(),
    const ProductCategoriesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(),
      body: pages[bottomNavBarIndex],
      floatingActionButton: FloatingActionButton(

        onPressed: () {},
        child: const Icon(Icons.add,color: Colors.brown,),

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavBarIndex,
        onTap: (index) {
          setState(() {
            bottomNavBarIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined), label: "Categories"),
        ],
      ),
    );
  }
}


