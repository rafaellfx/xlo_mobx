import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  await initializeParse();
  runApp(MyApp());
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container()
    );
  }
}