import 'package:flutter/material.dart';
import 'package:flutter_penseapp/controller/database/connection.dart';
import 'file:///C:/Users/Gabriel/AndroidStudioProjects/flutter_penseapp/lib/repositories/widgets/HexColor.dart';
import 'package:flutter_penseapp/view/login/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Connection().instance;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Connection().closeConnection();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplicativo Pense App',
        theme: ThemeData(
            primaryColor: HexColor("#aad5db"),
            buttonColor: HexColor("#4ccfe0"),
            textTheme: GoogleFonts.robotoTextTheme(),
            visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: LoginPage()
    );
  }
}
