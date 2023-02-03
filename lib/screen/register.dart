import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../app/snackbar.dart';
import '../app/user_permission.dart';
import '../model/user.dart';
import '../repository/user_repo.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});



  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  @override
  void initState(){
    super.initState();
   
    checkPermission();
  }

  
  

  checkPermission() async {
    await UserPermission.checkCameraPermission();
  }
  

final _key=GlobalKey<FormState>();
 final _fnameController = TextEditingController(text: "testUser");
  final _lnameController = TextEditingController(text: "testUser");
  final _usernameController = TextEditingController(text: "testUser1222");
  final _passwordController = TextEditingController(text: "password"); 
  

  _saveUser()async{
    User user =User(
    fname: _fnameController.text,
    lname: _lnameController.text,
    email:_usernameController.text,
    password: _passwordController.text,
    );
    
  int status = await UserRepositoryImpl().addUser(_img, user);
  _showMessage(status);


    
  }
  File? _img; 
  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if(image !=null){
        setState(() {
          _img = File(image.path);
        });
      }else{
        return;
      }
    }catch (e) {
      debugPrint(e.toString());
    }
  }

  
  _showMessage(int status){
    if(status>0){
      showSnackbar(context, 'User added succesfully', Colors.green);
    }
    else{
  showSnackbar(context,'Error in adding user', Colors.red);
    }

    
  }
  

@override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/register.png"),
                fit: BoxFit.fill)),
    
        child: Scaffold(
         //a backgroundColor: Colors.transparent,

          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Form(
                key:_key,
                  child: Column(
                    children: [
                      InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.grey[300],
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  _loadImage(ImageSource.camera);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.camera),
                                label: const Text('Camera'),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  _loadImage(ImageSource.gallery);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.image),
                                label: const Text('Gallery'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 200,
                      width: double.infinity - 500,
                      child: _img == null
                          ? SvgPicture.asset(
                              'assets/svg/profile.svg',
                            )
                          : Image.file(_img!),
                    ),
                  ),



                      TextFormField(
                        controller: _fnameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          labelText: 'First Name',
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _lnameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          labelText: 'Last Name',
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter last name';
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                       controller: _usernameController,
                        decoration: const InputDecoration(
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          labelText: 'Username',
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                      controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          labelText: 'Password',
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))
                              ),
                          onPressed: () {
                            
                              _saveUser();
                            
                              // deleteUser();
                            
                            
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Brand Bold",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}