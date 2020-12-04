import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:virtoustack/global/images.dart';
import 'package:virtoustack/utils/screenUtils.dart';

Text myDataText(
    {String text, int maxLines, TextStyle myTextStyle, TextAlign myTextAlign}) {
  return Text(
    text ?? "",
    maxLines: maxLines ?? 1,
    textAlign: myTextAlign,
    overflow: TextOverflow.ellipsis,
    style: myTextStyle,
  );
}

SizedBox mySizedBox(
    {@required double myHeight, @required double myWidth, child}) {
  return SizedBox(
    height: double.parse("$myHeight"),
    width: double.parse("$myWidth"),
    child: child,
  );
}

myAuthBtns({icon, context, color, text, @required Function onTapped}) {
  return Container(
    height: 45,
    width: getScreenWidth(context, .4),
    child: FlatButton(
        onPressed: onTapped ?? () {},
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showSvgImage(icon),
            SizedBox(width: 10),
            Text(
              text ?? 'Sign In with Facebook',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        )),
  );
}

showSvgImage(icon) {
  return SvgPicture.asset(
    icon ?? MyImage.FacebookImage,
    width: 20,
    height: 20,
  );
}

Container containerText({
  Function onTapped,
  String label1,
  String label2,
  String label3,
}) {
  return Container(
    height: 60,
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myDataText(
                maxLines: 1,
                text: label1 ?? '',
                myTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
              myDataText(
                maxLines: 1,
                text: label3 + " Sub Paths" ?? '3 found',
                myTextStyle: TextStyle(fontSize: 11, color: Colors.white),
              ),
            ],
          ),
          FlatButton(
            onPressed: onTapped ?? () {},
            child: Text(label2 ?? ''),
            padding: EdgeInsets.all(0),
            textColor: Colors.white,
          )
        ],
      ),
    ),
  );
}

showSnackbar(ScaffoldState key, String text, Color color) {
  key.showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: color ?? Colors.red,
  ));
}
