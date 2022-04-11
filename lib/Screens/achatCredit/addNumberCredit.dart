import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nafa_money/Screens/achatCredit/buyCreditSum.dart';
import 'package:nafa_money/localization/language_constants.dart';
import 'package:sizer/sizer.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class EnvoyerACreditUnNumero extends StatefulWidget {
  const EnvoyerACreditUnNumero({ Key? key }) : super(key: key);

  @override
  _EnvoyerACreditUnNumeroState createState() => _EnvoyerACreditUnNumeroState();
}

class _EnvoyerACreditUnNumeroState extends State<EnvoyerACreditUnNumero> {

   TextEditingController name = TextEditingController();

  TextEditingController numeroTelephone = TextEditingController();
   String initialCountry = 'SN';
   
  PhoneNumber number = PhoneNumber(isoCode: 'SN');
  String numero = "";
  //BuyCreditAmount

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
           elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              getTranslated(context,"buy_credit_home_toolbar_text").toString(),
              style: TextStyle(color: Colors.black,),
              ),
              leading: IconButton(
                 icon: Icon(Icons.arrow_back, color: Colors.black),
                 onPressed: () => Navigator.of(context).pop(),
                 ), 
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                    Container(
                      padding: EdgeInsets.only(top: 2.h,left: 3.h,right: 3.h),
                      margin: EdgeInsets.only(top:3.h),
            
                      child: TextField(
              controller: name, 
              decoration: InputDecoration(
               // prefix: Icon(Icons.search),
                labelText: getTranslated(context,"name_hint_text").toString(),
              ),
              onChanged: (value){
                  
              },
                      ),
                      
                    ),


                //  SizedBox(height: 1.h,),

                      Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: IntlPhoneField(
                     inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                    countries: ['SN','NG', 'GH', 'BJ' 'TG', 'CI'],
                      decoration: InputDecoration(
                        labelText:getTranslated(context,"phone_hint_text").toString(),
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      initialCountryCode: 'SN', //default country code
                      onChanged: (phone) {
                        //when phone number country code is changed
                        print(phone.completeNumber); //get complete number
                        print(phone.countryCode); // get country code only
                        print(phone.number); // only phone number

                        setState(() {
                          numero = phone.number!;
                        });
                      },),
                ),
                      
                      
                    
                //     Container(
                //   margin: EdgeInsets.only(left: 20,right: 20),
                //   child: InternationalPhoneNumberInput(
                //     hintText: "7X XXX XX XX",
                  
                //     onInputChanged: (PhoneNumber number) {
                //     print(number.phoneNumber);
                //      numero = number.phoneNumber;
                //     },
                //      onInputValidated: (bool value) {
                //     print(value);
                //   },
                //   selectorConfig: SelectorConfig(
                //     selectorType: PhoneInputSelectorType.DIALOG,
                    
                //   ),
                //   ignoreBlank: true,
                //   autoValidateMode: AutovalidateMode.disabled,
                //   selectorTextStyle: TextStyle(color: Colors.black),
                //   initialValue: number,
                //   textFieldController: numeroTelephone,
                //   formatInput: false,
                //   keyboardType:
                //       TextInputType.numberWithOptions(signed: true, decimal: true),
                //  // inputBorder: OutlineInputBorder(),
                 
                //   onSaved: (PhoneNumber number) {
                //     print('On Saved: $number');
                //   },
                //   ),
                // ),
            
                SizedBox(height: 51.h,),
                Container(
                  margin: EdgeInsets.only(left: 3.h,right: 3.h),
                  width: 100.w,
                  height: 7.h,
                  child: TextButton(
                     style:TextButton.styleFrom(
                          backgroundColor: numero != "" ? Colors.blueAccent : Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                              shadowColor: Colors.black,
                              elevation: 5
                              ),
                    child: Text(
                      getTranslated(context,"send_button_text").toString(),
                      style: TextStyle(color: Colors.white,fontSize: 13.sp),
                      ),
                    onPressed: numero != "" ? (){
                       Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => BuyCreditAmount(
                                name: name.text,
                                number: numero,
                            )));
                    } : null,
                  ),
                )
                ],
              ),
            ),
    );
  }
}