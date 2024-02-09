import 'dart:convert';

import 'package:bookelu_app/Authentication/Registration/models/sign_up_model.dart';
import 'package:bookelu_app/Authentication/Registration/registration_1.dart';
import 'package:bookelu_app/Authentication/Registration/verify_email.dart';
import 'package:bookelu_app/Authentication/Registration/resend_verification.dart';
import 'package:bookelu_app/Components/generic_error_dialog_box.dart';
import 'package:bookelu_app/Components/generic_loading_dialogbox.dart';
import 'package:bookelu_app/Components/generic_success_dialog_box.dart';
import 'package:bookelu_app/Components/keyboard_utils.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


Future<SignUpModel> signUpUser(data) async {
  final url = Uri.parse(hostName + "accounts/register-user/");
  final request = http.MultipartRequest('POST', url);

  request.headers['Accept'] = 'application/json';
  request.headers['Content-Type'] = 'multipart/form-data';

  request.files.add(await http.MultipartFile.fromPath('photo', data["photo"]));

  request.fields['full_name'] = data["full_name"];
  request.fields['email'] = data["email"];
  request.fields['phone'] = data["phone"];
  request.fields['country'] = data["country"];
  request.fields['password'] = data["password"];
  request.fields['password2'] = data["password2"];

  try {
    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = await response.stream.bytesToString();
      final result = json.decode(responseBody);


      print("############");
      print("WE ARE INNNNNNNN");
      print(result);

      return SignUpModel.fromJson(result);

    } else if (response.statusCode == 422 ||
        response.statusCode == 403 ||
        response.statusCode == 400) {
      final responseBody = await response.stream.bytesToString();
      final result = json.decode(responseBody);


      print("############");
      print("ERRORRRRRR");
      print(result);

      return SignUpModel.fromJson(result);
    } else {
      throw Exception('Failed to Sign Up');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Failed to Sign Up');
  }
}


class Password extends StatefulWidget {
  final data;
  const Password({super.key, required this.data});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _formKey = GlobalKey<FormState>();

  var show_password = false;
  String? password;
  String? password_confirmation;

  Future<SignUpModel>? _futureSignUp;

  @override
  Widget build(BuildContext context) {
    return (_futureSignUp == null) ? buildColumn() : buildFutureBuilder();
  }


  buildColumn(){
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back, size: 35,)),
                  Expanded(child: Image.asset("assets/images/bookelu_text_logo.png", height: 30,))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),


            Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Password", style: TextStyle(fontSize: 60, fontFamily: "Fontspring", height: 1),),
                                SizedBox(
                                  height: 15,
                                ),

                                Text("Secure your account.", style: TextStyle(fontSize: 32, ),),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Password", style: TextStyle(fontSize: 12),),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            border:
                                            Border.all(color: Colors.black.withOpacity(0.1))),
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            //hintText: 'Enter Password',
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    show_password = !show_password;
                                                  });
                                                },
                                                icon: Icon(
                                                  show_password
                                                      ? Icons.remove_red_eye_outlined
                                                      : Icons.remove_red_eye,
                                                  color: Colors.black.withOpacity(0.1),
                                                ),
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.normal),
                                              labelText: "Password",
                                              labelStyle:
                                              TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)),
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white)),
                                              border: InputBorder.none),
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(225),
                                            PasteTextInputFormatter(),
                                          ],
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Password is required';
                                            }
                                            if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*_()-+=/.,<>?"~`£{}|:;])')
                                                .hasMatch(value)) {

                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text("- Password must be at least 8 characters long\n- Must include at least one uppercase letter,\n- One lowercase letter, one digit,\n- And one special character",),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                              return '';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              password = value;
                                            });
                                          },
                                          textInputAction: TextInputAction.next,
                                          obscureText: show_password ? false : true,
                                          onSaved: (value) {
                                            setState(() {
                                              password = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Rename Password", style: TextStyle(fontSize: 12,),),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            border:
                                            Border.all(color: Colors.black.withOpacity(0.1))),
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            //hintText: 'Enter Password',
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    show_password = !show_password;
                                                  });
                                                },
                                                icon: Icon(
                                                  show_password
                                                      ? Icons.remove_red_eye_outlined
                                                      : Icons.remove_red_eye,
                                                  color: Colors.black.withOpacity(0.1),
                                                ),
                                              ),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.normal),
                                              labelText: "Re-Enter Password",
                                              labelStyle:
                                              TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)),
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white)),
                                              border: InputBorder.none),
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(225),
                                            PasteTextInputFormatter(),
                                          ],
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Password is required';
                                            }
                                            if (value != password) {
                                              return 'Passwords do not match';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              password_confirmation = value;
                                            });
                                          },
                                          textInputAction: TextInputAction.next,
                                          obscureText: show_password ? false : true,
                                          onSaved: (value) {
                                            setState(() {
                                              password_confirmation = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 180,
                          ),
                          InkWell(
                            onTap: () {


                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                KeyboardUtil.hideKeyboard(context);

                                widget.data['password'] = password.toString();
                                widget.data['password2'] = password_confirmation.toString();
                                print(widget.data);

                                _futureSignUp = signUpUser(widget.data);
                                //_futureSignIn = signInUser(user!, password!, platformType!);



                              }



                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.all(15),
                              height: 59,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: bookPrimary,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),


          ],
        ),
      ),
    );
  }

  FutureBuilder<SignUpModel> buildFutureBuilder() {
    return FutureBuilder<SignUpModel>(
        future: _futureSignUp,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);


            if(data.message == "Successful"){
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => VerifyEmail(email: widget.data['email'],)),
                );


                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return SuccessDialogBox(text: "Registration Successful");
                    }
                );





              });

            }

            else if(data.message == "Errors"){
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Registration1()),
                      (route) => false,
                );


                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return ErrorDialogBox(text: "Email already exists in our database.");
                    }
                );





              });

            }



          }

          return LoadingDialogBox(text: 'Please Wait..',);


        }
    );
  }


  void dispose() {
    super.dispose();
  }


}
