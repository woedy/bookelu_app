import 'package:bookelu_app/Bookings/user_bookings.dart';
import 'package:bookelu_app/ShopView/shops_screen.dart';
import 'package:bookelu_app/HomeScreen/home_screen.dart';
import 'package:bookelu_app/Message/messages.dart';
import 'package:bookelu_app/Profile/UserProfile.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          bottom: false,
          child: Column(

            children: [
              Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left:15, right: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Chat", style: TextStyle(fontSize: 46, fontWeight: FontWeight.w500),),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                              Border.all(color: Colors.black.withOpacity(0.1))),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    //hintText: 'Enter Username/Email',

                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.normal),
                                    labelText: "Search here",

                                    labelStyle: TextStyle(fontSize: 13,
                                        color: Colors.black.withOpacity(0.5)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)),
                                    border: InputBorder.none,
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(225),
                                    PasteTextInputFormatter(),
                                  ],

                                  textInputAction: TextInputAction.next,
                                  autofocus: false,
                                  onSaved: (value) {
                                    setState(() {
                                      //email = value;
                                    });
                                  },
                                ),
                              ),
                              Row(
                                children: [

                                  Icon(Icons.search),

                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(child: ListView.builder(
                          itemCount: 10,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ChatMessagesScreen()));
                                  },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 35,
                                            backgroundImage: AssetImage("assets/images/booking1.png"),
                                          ),
                                          SizedBox(width: 20,),
                                          Text("Beauty Oasis", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: "Fontspring"),),
                                        ],
                                      ),
                                      Icon(Icons.arrow_right, size: 40,)
                                    ],
                                  ),
                                ),
                              );
                            }
                        ))
                      ],
                    ),
                  )
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),

                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                      },
                      child: Column(
                        children: [
                          Image.asset("assets/icons/home.png", height: 25,)
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserBookings()));
                      },
                      child: Column(
                        children: [
                          Image.asset("assets/icons/card.png", height: 25,)
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AllShopsScreen()));


                      },
                      child: Column(
                        children: [
                          Image.asset("assets/icons/add.png", height: 40,)

                        ],
                      ),
                    ),

                    InkWell(
                      onTap: (){

                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ChatScreen()));

                      },
                      child: Column(
                        children: [
                          Image.asset("assets/icons/message.png", height: 25, color: bookPrimary,)

                        ],
                      ),
                    ),

                    InkWell(
                      onTap: (){

                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserProfile()));

                      },
                      child: Column(
                        children: [
                          Image.asset("assets/icons/person.png", height: 25,)
                        ],
                      ),
                    ),


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
