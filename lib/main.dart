import 'package:flutter/material.dart';
import 'package:qr_code_scanner_generator/qrcode_generator.dart';
import 'package:qr_code_scanner_generator/qrcode_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qrcode Scanner and Generator',
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
          title:Text('Qrcode Scanner and Generator'),
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            ElevatedButton(onPressed: () {
              setState((){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>QrcodeScanner()));
              });
            },
            child:Text('Scan QRCode')),
            SizedBox(height:40),
            ElevatedButton(
              onPressed:(){setState((){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>QrCodeGenerator()));
              });},child:Text('Generate Qr Code')
            )
          ]
        )
      )
    );
  }
}

