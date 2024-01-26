import 'dart:convert';

import 'package:bookelu_app/Authentication/Login/login_screen.dart';
import 'package:bookelu_app/Authentication/Registration/models/verify_email_model.dart';
import 'package:bookelu_app/Authentication/Registration/verify_email.dart';
import 'package:bookelu_app/Components/generic_button_dialog_box.dart';
import 'package:bookelu_app/Components/generic_error_dialog_box.dart';
import 'package:bookelu_app/Components/generic_loading_dialogbox.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:http/http.dart' as http;



Future<VerifyEmailModel> resendVerifyUserEmail(String email) async {

  final response = await http.post(
    Uri.parse(hostName + "accounts/resend-email-verification/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    },
    body: jsonEncode({
      "email": email,
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
  }
  else if (response.statusCode == 400) {
    print(jsonDecode(response.body));
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('Failed to Resend Token');
  }
}

class ResendVerifyEmail extends StatefulWidget {
  final email;
  const ResendVerifyEmail({super.key, required this.email});

  @override
  State<ResendVerifyEmail> createState() => _ResendVerifyEmailState();
}

class _ResendVerifyEmailState extends State<ResendVerifyEmail> {

  bool hasError = false;

  Future<VerifyEmailModel>? _futureResendVerifyEmail;


  @override
  Widget build(BuildContext context) {
    return (_futureResendVerifyEmail == null) ? buildColumn() : buildFutureBuilder();
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
                                Text("Resend Email Verification", style: TextStyle(fontSize: 60, fontFamily: "Fontspring", height: 1),),
                                SizedBox(
                                  height: 15,
                                ),

                                Text("Your are about to resend an email veirifation code to your email", style: TextStyle(fontSize: 20, ),),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("${widget.email}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                              //key: _formKey,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                //color: Colors.red,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 170,
                          ),

                          InkWell(
                            onTap: () {
                              setState(() {
                                _futureResendVerifyEmail = resendVerifyUserEmail(widget.email);

                              });


                             /* showDialog(
                                  context: context,
                                  builder: (_) => VerifyDialogBox(
                                    loadingText: 'Your Account setup',
                                    onTapFunction: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginScreen()));
                                    },
                                  )
                              );*/


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
                                  "Resend Verification",
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
        future: _futureResendVerifyEmail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);

            if(data.message == "Successful") {

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => VerifyEmail(email: widget.email)),
                );



              });


            }

            else if (data.message == "Errors") {
              WidgetsBinding.instance.addPostFrameCallback((_) {

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ResendVerifyEmail(email: widget.email,))
                );

                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context){
                      return ErrorDialogBox(text: 'Invalid confirmation code',);
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
