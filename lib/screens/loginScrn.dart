import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtoustack/controller/authController.dart';
import 'package:virtoustack/global/images.dart';
import 'package:virtoustack/widgets/commonWidgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool facebookSignInStarted = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            myDataText(
                text: "Sign In",
                myTextStyle:
                    TextStyle(fontSize: 35, fontWeight: FontWeight.w500)),
            mySizedBox(myHeight: 20, myWidth: 0),
            myDataText(
                text: "Sign in with facebook account",
                myTextStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            mySizedBox(myHeight: 20, myWidth: 0),
            myAuthBtns(
                onTapped: () {
                  getMyFacebookLogin(context: context);
                },
                color: Colors.indigo,
                context: context,
                icon: MyImage.FacebookImage,
                text: "Sign In Facebook")
          ],
        ),
      ),
    );
  }


  afterSignIn() {
    Navigator.pushReplacementNamed(context, "/Home");
  }

  getauthTrue() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool("authenticated", true);
  }
}
