import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nafa_money/Model/payment_model.dart';
import 'package:nafa_money/Screens/Dashboard/scanQr.dart';
import 'package:nafa_money/Screens/api/language.dart';
import 'package:nafa_money/localization/language_constants.dart';
import 'package:nafa_money/main.dart';
import 'package:nafa_money/widgets/payment_card.dart';
import 'package:sizer/sizer.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../colors.dart';

class HomeDashBord extends StatefulWidget {
  const HomeDashBord({Key? key}) : super(key: key);

  @override
  _HomeDashBordState createState() => _HomeDashBordState();
}

class _HomeDashBordState extends State<HomeDashBord> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String dropdownValue = 'FR';

  List<PaymentModel> getPaymentsCard() {
    List<PaymentModel> paymentCards = [
      PaymentModel(
          Icons.chevron_right,
          Colors.greenAccent,
          getTranslated(context, "from_text").toString() + " Ahmed Diouf",
          "07-23",
          "20.04",
          251.00,
          -1),
      PaymentModel(
          Icons.chevron_left,
          Color(0xFFff415f),
          getTranslated(context, "to_text").toString() + " Moustapha Sow",
          "07-23",
          "14.01",
          64.00,
          -1),
      PaymentModel(
          Icons.my_library_books,
          Colors.blueGrey,
          getTranslated(context, "facture_text").toString() + " SENELEC",
          "07-23",
          "10.04",
          1151.00,
          -1),
      PaymentModel(
          Icons.location_city,
          Color(0xFF50f3e2),
          getTranslated(context, "from_text").toString() + " Amadou Diop",
          "07-23",
          "10.04",
          1151.00,
          -1),
      PaymentModel(
          Icons.mobile_friendly,
          Color(0xFF50f3e2),
          getTranslated(context, "buy_credit_for_text").toString() +
              " " +
              getTranslated(context, "to_text").toString().toLowerCase() +
              " Adama Séne",
          "07-23",
          "10.04",
          1151.00,
          -1),
      PaymentModel(
          Icons.location_city,
          Color(0xFF50f3e2),
          getTranslated(context, "to_text").toString() + " Pape Matar",
          "07-23",
          "10.04",
          1151.00,
          -1),
      PaymentModel(
          Icons.my_library_books,
          Colors.blueGrey,
          getTranslated(context, "facture_text").toString() + " SENELEC",
          "07-23",
          "10.04",
          1151.00,
          -1),
      PaymentModel(
          Icons.mobile_friendly,
          Color(0xFF50f3e2),
          getTranslated(context, "buy_credit_for_text").toString() +
              " " +
              getTranslated(context, "to_text").toString().toLowerCase() +
              " Ibrahima Dramé",
          "07-23",
          "10.04",
          1151.00,
          -1),
    ];

    return paymentCards;
  }

//  @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }

  bool hideSum = false;

  void _changeLanguage(Language language) {
    Locale _temps;

    switch (language.languageCode) {
      case 'en':
        _temps = Locale(language.languageCode, 'US');
        break;
      case 'fr':
        _temps = Locale(language.languageCode, 'FR');
        break;
      default:
        _temps = Locale(language.languageCode, 'FR');
    }

    MyApp.setLocale(context, _temps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children:[
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                
              ),
            ),
           

          Container(
          margin: EdgeInsets.only(left: 1.h, top: 4.3.h),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                      color: Colors.white,
                    ),

                    onPressed: () {}),
                  
                      Container(
                        margin: EdgeInsets.only(right: 1.h),
                        child: DropdownButton(
                            onChanged: (Language? language) {
                              setState(() {
                                _changeLanguage(language!);
                              });
                            },
                            underline: SizedBox(),
                            icon: Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            items: Language.languageList()
                                .map<DropdownMenuItem<Language>>(
                                    (lang) => DropdownMenuItem(
                                          value: lang,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(lang.name),
                                              Text(lang.flag),
                                            ],
                                          ),
                                        ))
                                .toList()),
                      )
            ],
          )
          ),
           Container(
              margin: EdgeInsets.only(left: 3.h, top: 20.h),
              child: Column(
                children: [
                  Text(
                    "Hamidou Diallo",
                    style: TextStyle(color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.bold),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 2.5.h, top: 0.h),
                      child: Text(
                      "Compte marchand",
                      style: TextStyle(color: Colors.white.withOpacity(0.3),fontSize: 13.sp,fontWeight: FontWeight.w400),
                      ),
                    ),
                ],
              ),
            ),
            Container(
            width: 90.w,
            height: 17.h, 
            margin: EdgeInsets.only(left: 3.h, right: 3.h, top: 32.h),
           // padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    // spreadRadius: 5
                  )
                ]),
                child: Container(
                  margin: EdgeInsets.only(top:3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                             margin: EdgeInsets.only(left: 3.h,),
                            child: Text(
                              "Mon solde",
                              style:TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600,fontSize: 13.sp)
                              ),
                          ),
                           Container(
                             margin: EdgeInsets.only(left: 3.h,),
                            child: InkWell(
                          onTap: () {
                            setState(() {
                              hideSum = !hideSum;
                            });
                          },
                          child: Icon(!hideSum
                              ? Icons.remove_red_eye_sharp
                              : Icons.remove_red_eye_outlined)),
                          ),

                         
                        ],
                      ),
                       Container(
                              margin: EdgeInsets.only(left: 3.h,top: 0.5.h),
                              child:  !hideSum ? Text(
                                "2 500 100 FCFA",
                                 style: TextStyle(color: kPrimaryColor,fontSize: 18.sp,fontWeight: FontWeight.bold),
                                ): 
                                Container(
                              child: Row(
                              children: [
                                Container(
                                  height: 5.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: kPrimaryColor,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: kPrimaryColor,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: kPrimaryColor,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: kPrimaryColor,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: kPrimaryColor,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: kPrimaryColor,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: kPrimaryColor,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: kPrimaryColor,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                )
                              ],
                            )),
                              
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 1.h,left: 3.h),
                            child: Text("Mise à jour le 22/03/2021"),
                          )
                    ],
                  ),
                ),
            ),
            
            Container(
              margin: EdgeInsets.only(top: 52.h,left: 2.h),
              child: ListView(
              scrollDirection: Axis.horizontal,
              children:[
                
                Column(
                    children: [
                         InkWell(
                           onTap: (){
                             print("test");
                           },
                           child: PhysicalShape(
                                color: kPrimaryColor,
                                shadowColor: Colors.grey,
                                elevation: 10,
                                clipper: ShapeBorderClipper(shape: CircleBorder()),
                                child: Container(
                                 height: 10.h,
                                 width: 20.w,
                                ),
                                              ),
                         ),
                     
                     Container(
                       margin: EdgeInsets.only(top: 1.5.h),
                       child: Text(
                         "NAFA",
                         style: TextStyle(color: kPrimaryColor,fontSize: 12.sp,fontWeight: FontWeight.w400),
                         ),
                     )
                    ],
                  ),
                
              SizedBox(width: 2.w,),
               
                Column(
                    children: [
                         InkWell(
                           onTap: (){

                           },
                           child: PhysicalShape(
                              color: Colors.orange,
                              shadowColor: Colors.grey,
                              elevation: 10,
                              clipper: ShapeBorderClipper(shape: CircleBorder()),
                              child: Container(
                              height: 10.h,
                               width: 20.w,
                             ),
                                              ),
                         ),
                     
                     Container(
                       margin: EdgeInsets.only(top: 1.5.h),
                       child: Text(
                         "ORANGE",
                         style: TextStyle(color: kPrimaryColor,fontSize: 12.sp,fontWeight: FontWeight.w400),
                         ),
                     )
                    ],
                  ),
                
                SizedBox(width: 2.w,),
                
                   Column(
                    children: [
                         InkWell(
                           onTap: (){},
                           child: PhysicalShape(
                              color: Colors.red,
                              shadowColor: Colors.grey,
                              elevation: 10,
                              clipper: ShapeBorderClipper(shape: CircleBorder()),
                              child: Container(
                                height: 10.h,
                                width: 20.w,
                                             ),
                                              ),
                         ),
                     
                     Container(
                       margin: EdgeInsets.only(top: 1.5.h),
                       child: Text(
                         "FREE MONEY",
                         style: TextStyle(color: kPrimaryColor,fontSize: 12.sp,fontWeight: FontWeight.w400),
                         ),
                     )
                    ],
                  ),
                
                SizedBox(width: 2.w,),
                  
                   Column(
                    children: [
                         InkWell(
                           onTap: (){},
                           child: PhysicalShape(
                                color: Colors.purple,
                                shadowColor: Colors.grey,
                                elevation: 10,
                                clipper: ShapeBorderClipper(shape: CircleBorder()),
                                child: Container(
                                    height: 10.h,
                                    width: 20.w,
                                             ),
                                              ),
                         ),
                     
                     Container(
                       margin: EdgeInsets.only(top: 1.5.h),
                       child: Text(
                         "E-MONEY",
                         style: TextStyle(color: kPrimaryColor,fontSize: 12.sp,fontWeight: FontWeight.w400),
                         ),
                     )
                    ],
                  ),  
                
                  ],
               ),
            ),
            Container(
               margin: EdgeInsets.only(top: 70.h,left: 0.h),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Text(
                     "Transactions",
                     style: TextStyle(color: kPrimaryColor,fontSize: 17.sp,fontWeight: FontWeight.w800),
                     ),
                    InkWell(
                      onTap: (){
                        print("voir tout");
                      },
                      child: Container(
                      width: 25.w,
                       height: 5.h,
                        decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5,
                      // spreadRadius: 5
                                      )
                                    ]),
                        child: Center(
                          child: Text(
                       "VOIR TOUT",
                       style: TextStyle(color: kPrimaryColor,fontSize: 11.sp,fontWeight: FontWeight.w600),
                       ),
                        ) ,
                      ),
                    )

                 ],
               ),

            ),

            Container(
            width: 90.w,
            height: 12.h, 
            margin: EdgeInsets.only(left: 3.h, right: 3.h, top: 77.h),
           // padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    // spreadRadius: 5
                  )
                ]),
                child: ListTile(
                  title: Text("Boubabacar Ndoye") ,
                  subtitle: Text("Transfert Nafa"),
                  trailing: Container(
                    margin: EdgeInsets.only(top: 2.h),
                    child: Column(
                      children: [
                          Text("2000 FCFA"),
                          Text("il ya 1 jour"),
                    ],),
                  ),
                leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.3),
          child: Material(
            elevation: 7,
            shape: CircleBorder(),
           // shadowColor: widget.payment.color.withOpacity(0.4),
            child: Container(
              height: 25.h,
              width: 16.w,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CircleAvatar(backgroundImage: AssetImage("assets/images/nafa_splash.jpg")  )
              ),
            ),
          ),
        ), 
                 
      )
                
     ),

                Container(
            width: 90.w,
            height: 12.h, 
            margin: EdgeInsets.only(left: 3.h, right: 3.h, top: 87.h),
           // padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    // spreadRadius: 5
                  )
                ]),
                child: ListTile(
                  title: Text("Boubabacar Ndoye") ,
                  subtitle: Text("Transfert Nafa"),
                  trailing: Container(
                    margin: EdgeInsets.only(top: 2.h),
                    child: Column(
                      children: [
                          Text("2000 FCFA"),
                          Text("il ya 1 jour"),
                    ],),
                  ),
                leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.3),
          child: Material(
            elevation: 7,
            shape: CircleBorder(),
           // shadowColor: widget.payment.color.withOpacity(0.4),
            child: Container(
              height: 25.h,
              width: 16.w,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CircleAvatar(backgroundImage: AssetImage("assets/images/orange.jpg")  )
              ),
            ),
          ),
        ), 
                 
      )
                
     ),
            
          ]
        )
    );
  }

  Widget transaction() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        NotificationListener<OverscrollIndicatorNotification>(
          child: ListView.separated(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 85.0),
                child: Divider(),
              );
            },
            padding: EdgeInsets.zero,
            itemCount: getPaymentsCard().length,
            itemBuilder: (BuildContext context, int index) {
              return PaymentCardWidget(
                payment: getPaymentsCard()[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Container transfert() => Container(
        width: 100.w,
        height: 70.h,
        margin: EdgeInsets.only(left: 15, right: 20, top: 1.h),
        padding: EdgeInsets.only(left: 1),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5,
                // spreadRadius: 5
              )
            ]),
        child: Column(
          children: [
            ListTile(
              title: Text(
                getTranslated(context, "from_text").toString() + " Ahmed",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "10.000F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                getTranslated(context, "to_text").toString() + " Moustapha Sow",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "12.500F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                getTranslated(context, "to_text").toString() + " Fatou Ndiaye",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "8.500F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                getTranslated(context, "from_text").toString() + " Amadou Diop",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "13.000F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                getTranslated(context, "to_text").toString() + " Adama Séne",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "25.000F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                getTranslated(context, "to_text").toString() + " Pape Matar",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "500.000F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                getTranslated(context, "to_text").toString() + " Malick Fall",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "50.000F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              dense: true,
              trailing: Text(
                "50.000F",
                style: TextStyle(
                    inherit: true, fontWeight: FontWeight.w700, fontSize: 16.0),
              ),
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Material(
                  elevation: 10,
                  shape: CircleBorder(),
                  shadowColor: Colors.green.withOpacity(0.4),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Modou",
                    style: TextStyle(
                        inherit: true,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      controller.dispose();
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
