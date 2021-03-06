import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kee_ip_watching/src/view/screens/home.dart';

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}