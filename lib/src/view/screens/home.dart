import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kee_ip_watching/src/controller/AddressController.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: AddressController.instance,
      builder: (context, child){

      return Scaffold(
          appBar: AppBar(
            title: Text("KeeIpWatching"),
            leading: new Icon(Icons.network_check_sharp),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Your private IP right now is: ${AddressController.instanceModel.privateAddress}"),
                Text("Your public IP right now is: ${AddressController.instanceModel.publicAddress}")
              ],
            ),
          )
      );
    });
  }

  @override
  void initState() {
    super.initState();
    AddressController.instance.updateNetworkInformation();
  }
}