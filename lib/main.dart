import 'package:bloc_music_flutter/pages/home_page.dart';
import 'package:bloc_music_flutter/pages/no_intenet.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          var status = snapshot.data;
          switch (status) {
            case ConnectivityResult.mobile:
            case ConnectivityResult.wifi:
              return materialpp();
            case ConnectivityResult.none:
            default:
              return NoInternetPage();
          }
        });
  }

  Widget materialpp() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
