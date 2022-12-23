import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
              Image.asset('images/logo.png'),
            const SizedBox(height: 15,),
            const Text('Food Delivery',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 480,
                width: 325,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const SizedBox(height: 30,),
                    const Text('Hello',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                      
                    )
                    ),
                    const SizedBox(height: 10,),
                    const Text('Please Login to Your Account',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      
                      
                    ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: 250,
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          suffixIcon: Icon(FontAwesomeIcons.envelope,size: 17,),
                        ),
                      ),

                    ),
                  SizedBox(
                      width: 250,
                      child: const TextField(
                        obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(FontAwesomeIcons.eyeSlash,size: 17,),
                        ),
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 40, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Forget Password',
                          style: TextStyle(
                            color: Colors.orangeAccent[700]
                          ),


                          )

                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF8A2387),
                              Color(0xFFE94057),
                              Color(0xFFF27121),
                            ]
                          )
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('or Login using Social Media',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(FontAwesomeIcons.facebookF,color: Colors.orangeAccent[700],),
                        Icon(FontAwesomeIcons.twitch,color: Colors.orangeAccent[700],),
                        Icon(FontAwesomeIcons.solidEnvelope,color: Colors.orangeAccent[700],),
                      ],
                    )

                    

                    
                  ],
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}