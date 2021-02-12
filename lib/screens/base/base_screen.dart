import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/screens/home/home_screen.dart';
import 'package:xlo_mobx/store/page_store.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {

    final PageController pageController = PageController();

    final PageStore pageStore = GetIt.I<PageStore>();

    @override
    void initState() {
      super.initState();

      reaction(
          (_) => pageStore.page,
          (page) => pageController.jumpToPage(page)
      );
    }


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
