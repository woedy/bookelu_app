import 'package:bookelu_app/Bookings/user_bookings.dart';
import 'package:bookelu_app/HomeScreen/home_screen.dart';
import 'package:bookelu_app/Message/chat_screen.dart';
import 'package:bookelu_app/Profile/UserProfile.dart';
import 'package:bookelu_app/ShopView/shop_view_1.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Bookings", style: TextStyle(fontSize: 48, fontWeight: FontWeight.w500),),
                    SizedBox(
                      height: 20,
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
                    Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                         itemBuilder: (context, index) {
                           return InkWell(
                               onTap: (){
                                 Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ShopViewScreen1()));
                               },
                             child: Container(
                               margin: EdgeInsets.symmetric(vertical: 10),
                               child: Row(
                                 children: [
                                   Container(
                                     height: 177,
                                     width: 140,
                                     decoration: BoxDecoration(
                                         //color: Colors.red,
                                         borderRadius: BorderRadius.only(
                                           topLeft: Radius.circular(40.0), // Adjust the radius as needed
                                           topRight: Radius.circular(40.0), // Adjust the radius as needed
                                         ),
                                         image: DecorationImage(
                                             image: AssetImage("assets/images/booking1.png"),fit: BoxFit.cover
                                         )
                                     ),
                                   ),
                                   SizedBox(
                                     width: 10,
                                   ),
                                   Expanded(
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("Beauty Oasis", style: TextStyle(fontSize: 20,fontFamily: "Fontspring", fontWeight: FontWeight.w800 ),),
                                         SizedBox(
                                           height: 3,
                                         ),
                                         Row(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Icon(Icons.location_on_outlined, size: 20,),
                                             SizedBox(
                                               width: 5,
                                             ),
                                             Expanded(child: Text("8/101 Nicholson St, Camp Hill EC1A 1AE", style: TextStyle(fontSize: 10,),)),

                                           ],
                                         ),
                                         SizedBox(
                                           height: 10,
                                         ),
                                         Container(
                                           height: 35,
                                           //color: Colors.blue,
                                           child: ListView.builder(
                                             scrollDirection: Axis.horizontal,
                                             itemCount: 5,
                                             itemBuilder: (context, index){
                                               return  Container(
                                                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                   margin: EdgeInsets.all(5),
                                                   decoration: BoxDecoration(
                                                       color: bookPrimary.withOpacity(0.3),
                                                       borderRadius: BorderRadius.circular(5)
                                                   ),
                                                   child: Text("Hairstyle", style: TextStyle(fontSize: 10, ),));

                                             },
                                           ),
                                         ),
                                         InkWell(
                                           onTap: () {
                               /*

                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) => VerifyEmail())
                                              );
                               */

                                           },
                                           child: Container(
                                             padding: EdgeInsets.all(10),
                                             margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                             height: 45,
                                             width: MediaQuery.of(context).size.width,
                                             decoration: BoxDecoration(
                                                 color: bookPrimary,
                                                 borderRadius: BorderRadius.circular(7)),
                                             child: Center(
                                               child: Text(
                                                 "Book",
                                                 style: TextStyle(color: Colors.white),
                                               ),
                                             ),
                                           ),
                                         ),


                                       ],
                                     ),
                                   )

                                 ],
                               ),
                             ),
                           );
                         },
                        )
                    )

                  ],
                ),
              ),
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
                     // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BookingsScreen()));


                    },
                    child: Column(
                      children: [
                        Image.asset("assets/icons/add.png", height: 40, color: bookPrimary,)

                      ],
                    ),
                  ),

                  InkWell(
                    onTap: (){

                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ChatScreen()));

                    },
                    child: Column(
                      children: [
                        Image.asset("assets/icons/message.png", height: 25,)

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
    );
  }
}
