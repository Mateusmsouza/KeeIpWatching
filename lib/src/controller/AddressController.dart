import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:kee_ip_watching/src/model/AddressModel.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:http/http.dart';

class AddressController extends ChangeNotifier {
  static AddressController instance = new AddressController();
  static AddressModel instanceModel = new AddressModel();


  updateNetworkInformation(){
    getPrivateNetworkInfo();
    getPublicNetworkInfo();
  }

  getPrivateNetworkInfo() async {
    bool isWifi = await WiFiForIoTPlugin.isConnected();
    if (isWifi){
      WiFiForIoTPlugin.getIP().then((privateAddress) => {
        instanceModel.updatePrivateAddress(privateAddress)
      }).then((_) => notifyListeners());
    }
  }

  getPublicNetworkInfo() async {
    await get("https://api.ipify.org?format=json").then((value) =>
    {
      instanceModel.updatePublicAddress(jsonDecode(value.body)["ip"])
    }).then((_) => notifyListeners());
  }

}