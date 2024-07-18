import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
class QrCodeGenerator extends StatefulWidget {
  const QrCodeGenerator({Key? key}) : super(key: key);

  @override
  State<QrCodeGenerator> createState() => _QrCodeGeneratorState();
}

class _QrCodeGeneratorState extends State<QrCodeGenerator> {
  TextEditingController urlController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle:true,
        title:Text('QrCode Generator')
      ),
      body:Center(
        child:SingleChildScrollView(
          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
            if(urlController.text.isNotEmpty)
          QrImageView(data:urlController.text,size:200),
              SizedBox(height:10),
              TextField(
                controller:urlController,
                decoration:InputDecoration(
                  hintText:'enter text',
                  label:Text('enter text'),
                  border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(15)
                  )
                )
              ),
              ElevatedButton(
                onPressed:(){
                  setState((){});
                },child:Text('Generate QrCode')
              )
            ]
          )
        )
      )
    );
  }
}
