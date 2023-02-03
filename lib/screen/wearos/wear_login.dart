import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:plants/repository/user_repo.dart';

import 'package:plants/screen/dashboard.dart';
import 'package:wear/wear.dart';

import '../../model/user.dart';

class LoginScreenWear extends StatefulWidget {
  const LoginScreenWear({super.key});

  @override
  State<LoginScreenWear> createState() => _LoginScreenWearState();
}

class _LoginScreenWearState extends State<LoginScreenWear> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  
  // loginUser() async {
  //   User? status = await UserRepositoryImpl()
  //       .loginUser(_usernameController.text, _passwordController.text);
  //   _showMessage(status!.uId);
  // }

  _showMessage(int status) {
    if (status > 0) {
      MotionToast.success(
        description: const Text('Logged in successfully'),
      ).show(context);
    } else {
      MotionToast.success(
        description: const Text('Error to login'),
      ).show(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child){
        return AmbientMode(builder: (context,mode,child){
        return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
            
                width: double.infinity,
                // ignore: prefer_const_constructors
               
              ),
               Column(
                
                  children: [
                    //     child: Image.asset("assets/images/a.jpeg")),
                 
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(5),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email';
                        }
                        String pattern =
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?)*$";
                        RegExp regex = RegExp(pattern);
                        if (value.isEmpty ||
                            !regex.hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    // ignore: prefer_const_constructors
                  
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color:  Color.fromARGB(255, 231, 136, 136)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 230, 106, 122)),
                            borderRadius: BorderRadius.circular(5),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Password';
                        }
                        if (value.length < 6) {
                          return 'Password length must be at least 6 characters';
                        }

                        return null;
                      },
                    ),
        
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shape: const RoundedRectangleBorder(
                              
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DashboardScreen()));
                            }
                          },
                          // ignore: prefer_const_constructors
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: const Text('Login'),
                            
                          ),
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                 

                    
                      ],
                    ),
                    // ignore: prefer_const_constructors
                
                   
                  ],
                ),
              )
        
          ),
        ));
      

         
        });
      },
    
      // backgroundColor: Color(0xffD3D3D),
     
    );
  }
}
