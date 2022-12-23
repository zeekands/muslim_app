class MenuModel {
  List<Menu>? menu;

  MenuModel({this.menu});

  MenuModel.fromJson(Map<String, dynamic> json) {
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add(new Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.menu != null) {
      data['menu'] = this.menu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menu {
  String? name;
  String? image;
  String? routes;

  Menu({this.name, this.image, this.routes});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    routes = json['routes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['routes'] = this.routes;
    return data;
  }
}
