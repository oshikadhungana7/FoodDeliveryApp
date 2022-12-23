import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.purple
    ),
    debugShowCheckedModeBanner: false,
    home: const LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0x0ff82387),
                Color(0XFFE94057),
                Color(0xFFF27121)
              ]
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const SizedBox(height: 80,),
              Image.asset('images/logo.png')
            ],
          ),
        ),
      ),
    );
  }
}