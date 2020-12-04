import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtoustack/global/images.dart';
import 'package:virtoustack/widgets/commonWidgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool authenticated = false;
  var showed;
  @override
  void initState() {
    super.initState();
    getNewScreen();
    getauthTrue();
    showLoggedIn();
  }

  showLoggedIn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    var usersdsf = sp.getString("loggedIn");
    if (usersdsf != null) {
      setState(() {
        showed = usersdsf;
      });
    }
  }

  getauthTrue() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    var user = sp.getBool("authenticated");
    setState(() {
      authenticated = user;
    });
  }

  getNewScreen() async {
    await Future.delayed(Duration(seconds: 3)).then((value) {
      showed == true ? gotoHomePage() : gotoSignInPage();
    });
  }

  gotoHomePage() {
    Navigator.pushReplacementNamed(context, "/Home");
  }

  gotoSignInPage() {
    Navigator.pushReplacementNamed(context, "/Login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              MyImage.SplashImage,
              height: 200,
              fit: BoxFit.fill,
            ),
            myDataText(
                text: "Dog's Path",
                myTextStyle:
                    TextStyle(fontSize: 35, fontWeight: FontWeight.w500)),
            mySizedBox(myHeight: 10, myWidth: 0),
            myDataText(
                text: "by",
                myTextStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            mySizedBox(myHeight: 10, myWidth: 0),
            myDataText(
                text: "VirtouStack Softwares Pvt. Ltd.",
                myTextStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
