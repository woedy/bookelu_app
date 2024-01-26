import 'package:bookelu_app/Bookings/cancel_booking.dart';
import 'package:bookelu_app/HomeScreen/bookings_screen.dart';
import 'package:bookelu_app/HomeScreen/home_screen.dart';
import 'package:bookelu_app/Message/chat_screen.dart';
import 'package:bookelu_app/Profile/UserProfile.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserBookings extends StatefulWidget {
  const UserBookings({super.key});

  @override
  State<UserBookings> createState() => _UserBookingsState();
}

class _UserBookingsState extends State<UserBookings> {

  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;



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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Bookings", style: TextStyle(fontSize: 46, fontWeight: FontWeight.w500),),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)
                              ),
                                child: Icon(Icons.calendar_today_outlined, color: Colors.white,
                                ))
                          ],
                        ),
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
                                    labelText: "Search shop or staff  here",

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
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: bookPrimary.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    buildNavItem("Upcoming", 0),
                                    buildNavItem("History", 1),

                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: PageView(

                                  controller: _pageController,
                                  onPageChanged: (int page) {
                                    setState(() {
                                      currentPage = page;
                                    });
                                  },
                                  children: [
                                    _upcoming(),
                                    _history()
                                    // Add more pages as needed
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
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
                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserBookings()));
                      },
                      child: Column(
                        children: [
                          Image.asset("assets/icons/card.png", height: 25, color: bookPrimary,)
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BookingsScreen()));


                      },
                      child: Column(
                        children: [
                          Image.asset("assets/icons/add.png", height: 40,)

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
      ),
    );
  }

  Widget _upcoming(){
    return Container(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index){
          return  InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CancelBookings()));

            },
            child: Column(

              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/images/shop_g.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text("Beauty Oasis", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: "Fontspring"),),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                                width: 120,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Center(child: Text("\$70.00", style: TextStyle(fontSize: 16, color: Colors.white),))),

                          ],
                        ),
                      ],
                    ),
                    Text("23rd March 2022", style: TextStyle(fontSize: 12,)),


                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Hair Re Touch", style: TextStyle(fontSize: 14, )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 150,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: bookPrimary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(child: Text("7 : 00 am", style: TextStyle(fontSize: 16,),))),
                    Icon(Icons.arrow_forward_rounded),
                    Container(
                        width: 150,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: bookPrimary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(child: Text("7 : 50 am", style: TextStyle(fontSize: 16,),))),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),


                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _history(){
    return Container(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/shop_g.png"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text("Beauty Oasis", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: "Fontspring"),),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                              width: 120,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(child: Text("\$70.00", style: TextStyle(fontSize: 16, color: Colors.white),))),

                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("23rd March 2022", style: TextStyle(fontSize: 12,)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 60,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5)

                              ),
                              child: Center(child: Text("Paid", style: TextStyle(fontSize: 12,)))),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Cash", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text("Hair Re Touch", style: TextStyle(fontSize: 14, )),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 150,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: bookPrimary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child: Text("7 : 00 am", style: TextStyle(fontSize: 16,),))),
                  Icon(Icons.arrow_forward_rounded),
                  Container(
                      width: 150,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: bookPrimary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child: Text("7 : 50 am", style: TextStyle(fontSize: 16,),))),
                ],
              ),
              SizedBox(
                height: 25,
              ),


              Divider(),
            ],
          ),


        ],
      ),
    );
  }


  Widget buildNavItem(String title, int pageIndex) {
    bool isSelected = currentPage == pageIndex;

    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          pageIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        width: 120,
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.withOpacity(0.3) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
