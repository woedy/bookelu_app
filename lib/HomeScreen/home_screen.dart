import 'package:bookelu_app/Bookings/user_bookings.dart';
import 'package:bookelu_app/HomeScreen/bookings_screen.dart';
import 'package:bookelu_app/Message/chat_screen.dart';
import 'package:bookelu_app/Message/messages.dart';
import 'package:bookelu_app/Profile/UserProfile.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Good Morning", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                                Text("Bessie Coopers", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: "Fontspring"),),

                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.notifications_active_outlined,size: 28,),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserProfile()));

                                  },
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage: AssetImage("assets/images/shop_g.png"),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
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
                                    labelText: "Search service here",

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
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Promotions", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 133,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 133,
                                                width: 260,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/images/shop_g.png"),
                                                    fit: BoxFit.cover
                                                  ),
                                                  borderRadius: BorderRadius.circular(15)
                                                ),
                                              ),
                                              Container(
                                                height: 133,
                                                width: 260,
                                                decoration: BoxDecoration(

                                                  borderRadius: BorderRadius.circular(15),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [Colors.transparent, Colors.black],
                                                  ),
                                                ),
                                                child: Container(
                                                  margin: EdgeInsets.all(15),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [

                                                          Container(
                                                            padding: EdgeInsets.all(10),
                                                            decoration: BoxDecoration(
                                                                color: Colors.transparent,
                                                                borderRadius: BorderRadius.circular(10)
                                                            ),
                                                            child: Text(
                                                              "",
                                                              style: TextStyle(fontSize: 16, color: Colors.white),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,

                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Hair Re Touch", style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "Fontspring"),),


                                                                  Container(
                                                                      padding: EdgeInsets.all(2),
                                                                      width: 70,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors.green,
                                                                          borderRadius: BorderRadius.circular(5)
                                                                      ),
                                                                      child: Center(child: Text("Available", style: TextStyle(color: Colors.white,fontSize: 10,),))),

                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "\$30.00",
                                                                style: TextStyle(fontSize: 10, color: Colors.white, decoration: TextDecoration.lineThrough, decorationColor: Colors.white),
                                                              ),
                                                              Text(
                                                                "\$30.00",
                                                                style: TextStyle(fontSize: 15, color: Colors.white),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Bookings(Today)", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                        child: Icon(Icons.calendar_today_outlined, color: Colors.white, size: 15,))
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 133,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(right: 10),

                                            decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("9:30 Am - 10:30 Am", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),

                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage: AssetImage("assets/images/shop_g.png"),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Christiana Seema", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                                                        Text("Massage", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),),
                                                      ],
                                                    ),

                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(right: 10),

                                            decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("9:30 Am - 10:30 Am", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),

                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage: AssetImage("assets/images/shop_g.png"),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Christiana Seema", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                                                        Text("Massage", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),),
                                                      ],
                                                    ),

                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(right: 10),

                                            decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("9:30 Am - 10:30 Am", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),

                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage: AssetImage("assets/images/shop_g.png"),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Christiana Seema", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                                                        Text("Massage", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),),
                                                      ],
                                                    ),

                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),



                                Text("Category", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 140,
                                  //color: Colors.red,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 89,
                                              padding: EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.withOpacity(0.2),
                                                  borderRadius: BorderRadius.circular(50)
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset("assets/icons/hair_cut.png", height: 35,),

                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Haircut",
                                              style: TextStyle(fontSize: 10,),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 89,
                                              padding: EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.withOpacity(0.2),
                                                  borderRadius: BorderRadius.circular(50)
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset("assets/icons/styilng.png", height: 35,),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Styling",
                                              style: TextStyle(fontSize: 10,),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 89,
                                              padding: EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.withOpacity(0.2),
                                                  borderRadius: BorderRadius.circular(50)
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset("assets/icons/dryer.png", height: 35,),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Hair Dryer",
                                              style: TextStyle(fontSize: 10,),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 89,
                                              padding: EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.withOpacity(0.2),
                                                  borderRadius: BorderRadius.circular(50)
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset("assets/icons/massage.png", height: 35,),

                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Massage",
                                              style: TextStyle(fontSize: 10,),
                                            ),
                                          ],
                                        ),
                                      ),
                                 
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
                        /*      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
                      */  },
                      child: Column(
                        children: [
                          Image.asset("assets/icons/home.png", height: 25, color: bookPrimary,)
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

}
