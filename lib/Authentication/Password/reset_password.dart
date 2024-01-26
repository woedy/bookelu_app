import 'dart:convert';

import 'package:bookelu_app/Authentication/Login/login_screen.dart';
import 'package:bookelu_app/Authentication/Registration/models/sign_up_model.dart';
import 'package:bookelu_app/Authentication/Registration/models/verify_email_model.dart';
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


Future<VerifyEmailModel> updatePassword(String email, password) async {

  final response = await http.post(
    Uri.parse(hostName + "accounts/new-password-reset/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',

    },
    body: jsonEncode({
      "email": email,
      "new_password": password,
      "new_password2": password,
    }),
  );


  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    final result = json.decode(response.body);
    if (result != null) {

      print("#######################");
      print(result);


    }
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 400) {
    print(jsonDecode(response.body));
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to Reset password');
  }
}


class ResetPassword extends StatefulWidget {
  final email;
  const ResetPassword({super.key, required this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  var show_password = false;
  String? password;
  String? password_confirmation;

  Future<VerifyEmailModel>? _futureResetPassword;

  @override
  Widget build(BuildContext context) {
    return (_futureResetPassword == null) ? buildColumn() : buildFutureBuilder();
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
                                            if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*])')
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


                                _futureResetPassword = updatePassword(
                                    widget.email,
                                    password
                                );

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

  FutureBuilder<VerifyEmailModel> buildFutureBuilder() {
    return FutureBuilder<VerifyEmailModel>(
        future: _futureResetPassword,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);

            if(data.message == "Successful, Password reset successfully.") {

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );

                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return SuccessDialogBox(text: "Password has been updated successfully");
                    }
                );




              });


            }

            else if (data.message == "Error") {
              WidgetsBinding.instance.addPostFrameCallback((_) {

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ResetPassword(email: widget.email,))
                );

                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context){
                      return ErrorDialogBox(text: 'Unable to reset password',);
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
