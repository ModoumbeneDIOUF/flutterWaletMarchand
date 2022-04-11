import 'package:flutter/material.dart';
import 'package:nafa_money/Screens/Splash/splashScreen.dart';
import 'package:nafa_money/localization/demo_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  
  @override
  Widget build(BuildContext context) {

     return Sizer(
      builder:(context,orientation,deviceType){
           return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

        locale: _locale ,
        supportedLocales: [
          Locale("en", "US"),
          Locale("fr", "FR"),
        ],
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      home: SplashScreen()
    );
      });
   
  }
}


