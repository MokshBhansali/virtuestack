//Facebook Login
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

getMyFacebookLogin({BuildContext context}) async {
  final facebookLogin = FacebookLogin();
  facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  getsetUserLoggedIn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString("loggedIn", "true");
  }

  try {
    final result = await facebookLogin.logIn(['email', 'public_profile']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        FacebookAccessToken facebookAccessToken = result.accessToken;
        final AuthCredential credential =
            FacebookAuthProvider.credential(facebookAccessToken.token);
        User firebaseUser =
            (await _firebaseAuth.signInWithCredential(credential)).user;
        print("facebook sign in" + firebaseUser.toString());
        await getsetUserLoggedIn();
        Navigator.pushReplacementNamed(context, "/Home");
        break;
      case FacebookLoginStatus.cancelledByUser:
        throw Exception();
        break;
      case FacebookLoginStatus.error:
        throw Exception();
        break;
    }
  } catch (e) {
    print(e);
    throw Exception();
  }
}
