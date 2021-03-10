import 'package:flutter/material.dart';
import 'file:///C:/Users/Gabriel/AndroidStudioProjects/flutter_penseapp/lib/repositories/widgets/HexColor.dart';

class MyAppButton extends StatelessWidget {

  String text;
  Function onPressed;
  bool showProgress;
  String color1;
  String color2;

  MyAppButton(this.text, {this.onPressed, this.showProgress = false, this.color1, this.color2});

  @override
  Widget build(BuildContext context) {

    final bkground1 = HexColor(color1 ?? '#FF9129');
    final bkground2 = HexColor(color2 ?? '#FF9129');

    return Container(
        margin: EdgeInsets.fromLTRB(8, 16, 8, 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
                colors: [bkground1, bkground2],
                stops: [0.0, 1.0],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomCenter
            )
        ),
        child: FlatButton(
          child: showProgress ? Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ) : Text(
              text, style: TextStyle(color: Colors.white, fontSize: 18)
          ),
          onPressed: onPressed,
        )
    );
  }
}
