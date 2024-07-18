import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class QrcodeScanner extends StatefulWidget {
  const QrcodeScanner({Key? key}) : super(key: key);

  @override
  State<QrcodeScanner> createState() => _QrcodeScannerState();
}

class _QrcodeScannerState extends State<QrcodeScanner> {
  String qrResult='Scanned Data will appear here';
  @override
  Widget build(BuildContext context) {
    Future<void> scanQR()async{
      try{
        final qrCode=await FlutterBarcodeScanner.scanBarcode('#ff6666','cancel',true,ScanMode.QR);
      if(!mounted)return;
      setState((){
        this.qrResult=qrCode.toString();});
      }on PlatformException{
        qrResult='fail to read QR';
      }
    }
    return Scaffold(
      appBar:AppBar(
        centerTitle:true,
        title:Text('QrCode Scanner')
      ),
      body:Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            SizedBox(height:30),
            Text('$qrResult',style:TextStyle(color:Colors.black)),
            SizedBox(height:30),
            ElevatedButton(
              onPressed:(){
                setState(() {
                  scanQR();
                });
              },child:Text('Scan QrCode')
            )
          ]
        )
      )
    );
  }
}
