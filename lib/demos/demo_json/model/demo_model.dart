class FootballModel {
  List<Data>? data;

  FootballModel({this.data});

  FootballModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? slug;
  String? abbr;
  Logos? logos;

  Data({this.id, this.name, this.slug, this.abbr, this.logos});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    abbr = json['abbr'];
    logos = json['logos'] != null ? Logos.fromJson(json['logos']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['abbr'] = abbr;
    if (logos != null) {
      data['logos'] = logos!.toJson();
    }
    return data;
  }
}

class Logos {
  String? light;
  String? dark;

  Logos({this.light, this.dark});

  Logos.fromJson(Map<String, dynamic> json) {
    light = json['light'];
    dark = json['dark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['light'] = light;
    data['dark'] = dark;
    return data;
  }
}
