import 'package:flutter/material.dart';
import 'package:virtoustack/services/dogServices.dart';
import '../widgets/commonWidgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog's Path"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getmyData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length - 1 ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var myData = snapshot.data[index];
                return containerText(
                    label1: myData.title.toString(),
                    label2: "Open Path",
                    label3: myData.subPaths.length.toString(),
                    onTapped: () {});
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
