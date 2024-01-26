import 'package:bookelu_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CancelBookings extends StatefulWidget {
  const CancelBookings({super.key});

  @override
  State<CancelBookings> createState() => _CancelBookingsState();
}

class _CancelBookingsState extends State<CancelBookings> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: 250,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/shop1.png"),
                                      fit: BoxFit.cover
                                  )
                              )

                          ),
                          Container(
                            height: 250,
                            decoration: BoxDecoration(

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
                                      InkWell(
                                          onTap: (){
                                            Navigator.of(context).pop();
                                          },
                                          child: Icon(Icons.arrow_back, size: 35, color: Colors.white,)),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Text(
                                          "\$70",
                                          style: TextStyle(fontSize: 16, color: Colors.white),
                                        ),
                                      ),

                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Hair Re Touch", style: TextStyle(color: Colors.white,fontSize: 48, fontWeight: FontWeight.w500, fontFamily: "Fontspring"),),


                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.location_on_outlined, size: 20, color: Colors.white,),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(child: Text("8/101 Nicholson St, Camp Hill EC1A 1AE", style: TextStyle(color: Colors.white,fontSize: 14,),)),

                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                  padding: EdgeInsets.all(2),
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  child: Center(child: Text("Open", style: TextStyle(color: Colors.white,fontSize: 10,),))),

                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.star_rounded, color: Colors.yellow, size: 40,),
                                          Text("4.5", style: TextStyle(color: Colors.white,fontSize: 20,),),

                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                        padding: EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,),
                                      Text("November 2023", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),),

                                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text("SUN", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("15", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),

                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Column(
                                          children: [
                                            Text("MON", style: TextStyle(color: Colors.black,fontSize: 12, fontWeight: FontWeight.w600),),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text("16", style: TextStyle(color: Colors.black,fontSize: 12, fontWeight: FontWeight.w600),),

                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text("TUE", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("17", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),

                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("WED", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("18", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),

                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("THU", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("19", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),

                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("FRI", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("20", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),

                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("SAT", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("21", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),

                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),



                    ],
                  ),
                ),
                InkWell(
                  onTap: () {

                    /* Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => VerifyEmail())
                                          );*/

                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    height: 59,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(7),
                        border:
                        Border.all(color: Colors.red.withOpacity(0.8))
                    ),

                    child: Center(
                      child: Text(
                        "Cancel Appointment",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Available Slots", style: TextStyle(fontSize: 10,),),

                          SizedBox(height: 15,),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),


                                    ),
                                    child: Center(
                                      child: Text("7:00 AM - 9:30 AM", style: TextStyle(fontSize: 14),),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),


                                    ),
                                    child: Center(
                                      child: Text("7:00 AM - 9:30 AM", style: TextStyle(fontSize: 14),),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),


                                    ),
                                    child: Center(
                                      child: Text("7:00 AM - 9:30 AM", style: TextStyle(fontSize: 14),),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),


                                    ),
                                    child: Center(
                                      child: Text("7:00 AM - 9:30 AM", style: TextStyle(fontSize: 14),),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),



                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          CupertinoSwitch(value: false, onChanged: (value) {
                          }),
                          SizedBox(width: 10,),

                          Text("Home Service", style: TextStyle(fontSize: 10,))
                        ],
                      )
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),

                        child: Text("Hair Re-Touch Specialist", style: TextStyle(fontSize: 10,))),

                    Container(
                      height: 200,
                      //color: Colors.red,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 200,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),



                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    //height: 70,
                                    decoration: BoxDecoration(
                                      //color: Colors.red,
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/shop_g.png"),
                                            fit: BoxFit.cover

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text("Marvin McKinney", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                                Text("Hair stylist", style: TextStyle(fontSize: 10,),),
                                Row(
                                  children: [
                                    Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star_rounded, size: 15, color: Colors.yellow,)
                                  ],
                                )

                              ],
                            ),
                          ),
                          Container(
                            width: 200,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),



                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    //height: 70,
                                    decoration: BoxDecoration(
                                      //color: Colors.red,
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/shop_g.png"),
                                            fit: BoxFit.cover

                                        )

                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text("Marvin McKinney", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                                Text("Hair stylist", style: TextStyle(fontSize: 10,),),
                                Row(
                                  children: [
                                    Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                                    Icon(Icons.star_rounded, size: 15, color: Colors.yellow,)
                                  ],
                                )

                              ],
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),

                InkWell(
                  onTap: () {

                    /* Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => VerifyEmail())
                                          );*/

                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    height: 59,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: bookPrimary,
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Text(
                        "Book Appointment",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 45,)





              ],
            ),
          ),
        ),
      ),
    );
  }







}
