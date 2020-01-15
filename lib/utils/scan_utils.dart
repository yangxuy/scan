import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class ScanUtils {
  static Future<String> scan() async {
    String barcode;
    try {
      barcode = await BarcodeScanner.scan();
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        barcode = 'The user did not grant the camera permission!';
      } else {
        barcode = 'Unknown error: $e';
      }
    } on FormatException {
      barcode =
          'null (User returned using the "back"-button before scanning anything. Result)';
    } catch (e) {
      print(e);
      barcode = 'Unknown error: $e';
    }
    return barcode;
  }
}
