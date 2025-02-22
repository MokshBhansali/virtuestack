class DogModels {
  String id;
  String title;
  List<DogSubPaths> subPaths;

  DogModels({this.id, this.title, this.subPaths});

  DogModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['sub_paths'] != null) {
      subPaths = new List<DogSubPaths>();
      json['sub_paths'].forEach((v) {
        subPaths.add(new DogSubPaths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.subPaths != null) {
      data['sub_paths'] = this.subPaths.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DogSubPaths {
  String id;
  String title;
  String image;

  DogSubPaths({this.id, this.title, this.image});

  DogSubPaths.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}
