import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/home/home_screen.dart';

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final PageController pageController = PageController();

    return Scaffold(
      body: PageView(

        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          Container(color: Colors.green,),
          Container(color: Colors.yellow,),
          Container(color: Colors.purple,),
          Container(color: Colors.brown,)
        ],
      ),
    );
  }
}
