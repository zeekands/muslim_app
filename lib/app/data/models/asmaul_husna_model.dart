class AsmaulHusna {
  List<Names>? names;

  AsmaulHusna({this.names});

  AsmaulHusna.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add(Names.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (names != null) {
      data['names'] = names!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Names {
  int? duration;
  String? name;
  String? nameArabic;
  String? nameAudio;
  String? nameSimple;
  int? serialNo;
  String? shareUrl;

  Names(
      {this.duration,
      this.name,
      this.nameArabic,
      this.nameAudio,
      this.nameSimple,
      this.serialNo,
      this.shareUrl});

  Names.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    name = json['name'];
    nameArabic = json['name_arabic'];
    nameAudio = json['name_audio'];
    nameSimple = json['name_simple'];
    serialNo = json['serial_no'];
    shareUrl = json['share_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['duration'] = duration;
    data['name'] = name;
    data['name_arabic'] = nameArabic;
    data['name_audio'] = nameAudio;
    data['name_simple'] = nameSimple;
    data['serial_no'] = serialNo;
    data['share_url'] = shareUrl;
    return data;
  }
}
