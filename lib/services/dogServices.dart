import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:virtoustack/models/dogModels.dart';

getmyData() async {
  String url = "https://5d55541936ad770014ccdf2d.mockapi.io/api/v1/paths";
  var responce = await http.get(url);
  var result = json.decode(responce.body);
  var dogList = List<DogModels>();
  var dogSubList = List<DogSubPaths>();
  for (var i = 0; i < result.length; i++) {
    DogSubPaths dogSubPaths = DogSubPaths(
      id: result[i]["id"],
      image: result[i]["image"],
      title: result[i]["title"],
    );
    dogSubList.add(dogSubPaths);
    print(dogSubList.length);

    DogModels dogModels = DogModels(
      id: result[i]["id"],
      title: result[i]["title"],
      subPaths: dogSubList,
    );
    dogList.add(dogModels);
  }
  return dogList;
}

getSubData() async {
  String url = "https://5d55541936ad770014ccdf2d.mockapi.io/api/v1/paths";
  var responce = await http.get(url);
  var result = json.decode(responce.body);
  var dogSubList = List<DogSubPaths>();
  for (var item in result["subpaths"]) {
    DogSubPaths dogSubPaths = DogSubPaths(
      id: item["id"],
      image: item["image"],
      title: item["title"],
    );
    dogSubList.add(dogSubPaths);
  }
  print(dogSubList.length);
  return dogSubList;
}
