import 'package:flutter/material.dart';

import 'package:plants/screen/forgetpassword.dart';
import 'package:plants/screen/register.dart';

import '../app/snackbar.dart';
import '../repository/user_repo.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  
loginUser() async {
  final islogin = await UserRepositoryImpl()
        .loginUser(_usernameController.text, _passwordController.text);
    if (islogin) {
      // write here
      _goToAnotherPage();
    } else {
      _showMessage();
    }
}

_goToAnotherPage() {
    Navigator.pushNamed(context, '/dashboardScreen');
  }

  _showMessage() {
    showSnackbar(context, 'Invalid username or password', Colors.red);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromARGB(255, 231, 136, 136),
        centerTitle: true,
      ),
      // backgroundColor: Color(0xffD3D3D),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/food.jpeg"))),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //     child: Image.asset("assets/images/a.jpeg")),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
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
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration:InputDecoration(
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

                        
                        return null;
                      },
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 15,
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
                            loginUser();
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
                    SizedBox(
                      height: 15,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Dont have Account?'),
                        InkWell(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const RegisterScreen()),
                                  )
                                },
                            // ignore: prefer_const_constructors
                            child: Text(
                              ' Register here',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 188, 109, 109),
                              ),
                            ))
                      ],
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: InkWell(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Forgetpwd()),
                                  )
                                },
                            child: const Text('Forgot Password?'))),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
