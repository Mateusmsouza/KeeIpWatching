import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kee_ip_watching/src/controller/AddressController.dart';
import 'package:kee_ip_watching/src/controller/AsynCheckerController.dart';

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
            centerTitle: true,
            leading: new Icon(Icons.network_check_sharp),
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  title: Text("Public Internet Protocol",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text(AddressController.instanceModel.publicAddress),
                  leading: Icon(
                      Icons.network_cell,
                      color: Colors.deepPurple,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text("Private Internet Protocol",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text(AddressController.instanceModel.privateAddress),
                  leading: Icon(
                    Icons.network_locked,
                    color: Colors.deepPurple,
                  ),
                )
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
    main();
  }
}