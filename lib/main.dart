import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/screens/base/base_screen.dart';
import 'package:xlo_mobx/store/page_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators(){
  GetIt.I.registerSingleton(PageStore());
}

Future<void> initializeParse() async{
  await Parse().initialize(
      "jx1d4gKG6RqvTsJWORDj7TWvrdK3rGjtFrexb8Zb",
      "https://parseapi.back4app.com/",
      clientKey: "1kF74ZgkjXa9UIiIKlzJ2TIOeJELgKba1eJOnd2W",
      autoSendSessionId: true,
      debug: true
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        cursorColor: Colors.orange
      ),
      home: BaseScreen()
    );
  }
}