
import 'dart:isolate';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:kee_ip_watching/src/controller/AddressController.dart';
import 'package:kee_ip_watching/src/model/data/LocalData.dart';

const LAST_PUBLIC_IP="LAST_PUBLIC_IP";

class AsyncChecker {
  final int ipCheckerId = 9;

  runChecker() {
    print("Starting second");
    // LocalData localData = LocalData(
    //   filePath: LAST_PUBLIC_IP
    // );
    //
    // localData.requestWritePermission();
    // String ipBeforeUpdate = await localData.read();
    // AddressController.instance.updateNetworkInformation();
    // String ipAfterUpdate = AddressController.instanceModel.publicAddress;
    //
    // if(ipBeforeUpdate != ipAfterUpdate){
    //   print("Ip changed");
    // } else {
    //   print("Ip havent changed");
    // }
    //
    // localData.write(ipAfterUpdate);
  }

  Future<void> printHello() async {
    LocalData localData = LocalData(
      filePath: LAST_PUBLIC_IP
    );

    localData.requestWritePermission();
    String ipBeforeUpdate = await localData.read();
    AddressController.instance.updateNetworkInformation();
    String ipAfterUpdate = AddressController.instanceModel.publicAddress;

    if(ipBeforeUpdate != ipAfterUpdate){
      print("Ip changed");
    } else {
      print("Ip havent changed");
    }

    localData.write(ipAfterUpdate);
  }

  startSchedulerChecker() async {
    await AndroidAlarmManager.initialize();
    await AndroidAlarmManager.periodic(
        const Duration(seconds: 1), ipCheckerId, printHello);
  }

}

Future<void> printHello() async {
  print("f");
  LocalData localData = LocalData(
      filePath: LAST_PUBLIC_IP
  );

  //localData.requestWritePermission();
  String ipBeforeUpdate = await localData.read();
  AddressController.instance.updateNetworkInformation();
  String ipAfterUpdate = AddressController.instanceModel.publicAddress;

  print(ipBeforeUpdate);
  print(ipAfterUpdate);
  if(ipBeforeUpdate != ipAfterUpdate){
    print("Ip changed");
  } else {
    print("Ip havent changed");
  }

  localData.write(ipAfterUpdate);
}

main() async {
  final int helloAlarmID = 0;
  await AndroidAlarmManager.initialize();
  await AndroidAlarmManager.periodic(const Duration(seconds: 10), helloAlarmID, printHello);
}

