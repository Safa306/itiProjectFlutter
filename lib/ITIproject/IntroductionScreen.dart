import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/ITIproject/HomeScreen.dart';

import 'MainScreen.dart';
class IntroScreen extends StatelessWidget {
   IntroScreen({super.key});
  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Welcome",
      body: "Hope you enjoy our app",

      footer: ElevatedButton(
        onPressed: (){},
        child: const Text("Let's Go"),
      ),
      image:  Center(
        child: Image.network("https://thumbs.dreamstime.com/b/new-team-member-concept-new-team-member-concept-welcome-word-people-celebrate-web-page-banner-presentation-social-media-169919106.jpg"),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold
        )
      )
    ),
    PageViewModel(
        title: "Easy Shopping",
        body: "Choose your favorates and buy",
        footer: ElevatedButton(
          onPressed: (){},
          child: const Text("Let's Go"),
        ),
        image:  Center(
          child: Image.network("https://cdn2.iconfinder.com/data/icons/animated-online-shopping/110/49-512.png"),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
            )
        )
    ),
    PageViewModel(
        title: "Fixable pay",
        body: "different ways to pay",
        footer: ElevatedButton(
          onPressed: (){},
          child: const Text("Let's Go"),
        ),
        image:  Center(
          child: Image.network("https://coralproject.net/wp-content/uploads/2019/09/COR_001_Rebrand_Illustrations_Home_1-1240x897.png"),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
            )
        )
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("On Boarding"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Text("Done", style: TextStyle(
            fontSize: 20,
          ),
          ),
          showSkipButton: true,
          skip: const Text("Skip", style: TextStyle(
            fontSize: 20,
          ),
          ),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward,size: 25,),
          onDone: ()=> onDone(context),
          curve: Curves.bounceInOut,

        ),
      ),
    );
  }
  void onDone(context) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("ON_BOARDING", false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Mainscreen()));
  }
}
