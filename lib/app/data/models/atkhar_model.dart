class Atkhtars {
  List<Atkhar>? athkar;

  Atkhtars({this.athkar});

  Atkhtars.fromJson(Map<String, dynamic> json) {
    if (json['athkar'] != null) {
      athkar = <Atkhar>[];
      json['athkar'].forEach((v) {
        athkar!.add(Atkhar.fromJson(v));
      });
    }
  }
}

class Atkhar {
  String? audioUrl;
  String? period;
  int? order;
  String? contentAr;
  int? readTimes;
  String? contentEn;
  String? contentId;
  String? desc;
  String? title;
  int? duration;

  Atkhar(
      {this.audioUrl,
      this.period,
      this.order,
      this.contentAr,
      this.readTimes,
      this.contentEn,
      this.contentId,
      this.desc,
      this.title,
      this.duration});

  Atkhar.fromJson(Map<String, dynamic> json) {
    audioUrl = json['audio_url'];
    period = json['period'];
    order = json['order'];
    contentAr = json['content_ar'];
    readTimes = json['read_times'];
    contentEn = json['content_en'];
    contentId = json['content_id'];
    desc = json['desc'];
    title = json['title'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['audio_url'] = audioUrl;
    data['period'] = period;
    data['order'] = order;
    data['content_ar'] = contentAr;
    data['read_times'] = readTimes;
    data['content_en'] = contentEn;
    data['content_id'] = contentId;
    data['desc'] = desc;
    data['title'] = title;
    data['duration'] = duration;
    return data;
  }
}
