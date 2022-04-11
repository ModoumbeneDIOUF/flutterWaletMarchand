import 'package:flutter/material.dart';
import 'package:nafa_money/localization/language_constants.dart';
import 'package:sizer/sizer.dart';

class PaymentHome extends StatefulWidget {
  const PaymentHome({ Key? key }) : super(key: key);

  @override
  _PaymentHomeState createState() => _PaymentHomeState();
}

class _PaymentHomeState extends State<PaymentHome> {



  List<Map<String, String>>? _searchable1 = [
    {
      'nom':'Woyofal',
      'image':'assets/images/woyofal.jpg'
    },
    {
      'nom':'Senelec',
      'image':'assets/images/senelec.jpg'
    },
    {
      'nom':'SEN\'EAU',
      'image':'assets/images/seneau.jpg'
    },
     {
      'nom':'Rapido',
      'image':'assets/images/rapido.jpg'
    },
     {
      'nom':'Aquatec',
      'image':'assets/images/aqua.png'
    },
     {
      'nom':'TNT',
      'image':'assets/images/tnt.png'
    },
  ];

  List<String>? items = [];

  List<Map<String, String>>? items1 = [];

  bool existe = false;

@override
  void initState() {
    
    super.initState();
   
    items1!.addAll(_searchable1!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
               getTranslated(context,"payment_home_toolbar_text").toString(),
              style: TextStyle(color: Colors.black,),
              ),
              leading: IconButton(
                 icon: Icon(Icons.arrow_back, color: Colors.black),
                 onPressed: () => Navigator.of(context).pop(),
                 ), 
            ),

            body: Column(
              children: [

                  Container(
          padding: EdgeInsets.only(top: 1.h,left: 3.h,right: 3.h),
          margin: EdgeInsets.only(top:1.h),
          width: 100.w,
          height: 7.h,
          child: TextField(
            
            decoration: InputDecoration(
               border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
            // prefix: Icon(Icons.search),
              labelText: getTranslated(context,"payment_home_search_hint_text").toString(),
            ),
            onChanged: (value){

                existe =true;
                filterSearch(value.toLowerCase());
            },
            
          ),
        ),
        SizedBox(height: 3.h,),
        Expanded(

          child: ListView.builder(

            itemCount: items1!.length,
            itemBuilder: (context,index){

          

            
                return ListTile(
                title: Text('${items1![index]['nom']}'),
                leading: CircleAvatar(
                      backgroundImage: AssetImage('${items1![index]['image']}')
                    )
              );
            }

          ) ,
        )
              ],
            ),
      
    );
  }

  void filterSearch(String searchTerm){

    List<Map<String, String>>? tmpSeachList = [];

    tmpSeachList.addAll(_searchable1!);

    if (searchTerm.isNotEmpty) {

        List<Map<String, String>>? tmpList = [];
        tmpSeachList.forEach((element) {
          
          if(element['nom']!.toLowerCase().contains(searchTerm)){

              tmpList.add(element);
          
            }
        });

        setState(() {
          
          items1!.clear();
          existe = true;
          items1!.addAll(tmpList);
        });
         
    } 
    else {

      setState(() {
          
          items1!.clear();
          
          items1!.addAll(_searchable1!);
        });
    }
  }
}