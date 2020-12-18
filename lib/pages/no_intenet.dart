import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FlareActor("assets/NoInternet.flr",
            alignment: Alignment.center,
            fit: BoxFit.fitHeight,
            animation: "idle"));
  }
}
