class Doas {
  List<Doa>? doa;

  Doas({this.doa});

  Doas.fromJson(Map<String, dynamic> json) {
    if (json['doa'] != null) {
      doa = <Doa>[];
      json['doa'].forEach((v) {
        doa!.add(Doa.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doa != null) {
      data['doa'] = doa!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doa {
  String? categoryName;
  int? categoryNo;
  int? chapterCount;
  String? icon;
  List<Chapters>? chapters;

  Doa(
      {this.categoryName,
      this.categoryNo,
      this.chapterCount,
      this.icon,
      this.chapters});

  Doa.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    categoryNo = json['category_no'];
    chapterCount = json['chapter_count'];
    icon = json['icon'];
    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters!.add(Chapters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_name'] = categoryName;
    data['category_no'] = categoryNo;
    data['chapter_count'] = chapterCount;
    if (chapters != null) {
      data['chapters'] = chapters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chapters {
  String? chapterName;
  int? chapterNo;
  List<Verses>? verses;

  Chapters({this.chapterName, this.chapterNo, this.verses});

  Chapters.fromJson(Map<String, dynamic> json) {
    chapterName = json['chapter_name'];
    chapterNo = json['chapter_no'];
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(Verses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chapter_name'] = chapterName;
    data['chapter_no'] = chapterNo;
    if (verses != null) {
      data['verses'] = verses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Verses {
  String? arabicText;
  int? duration;
  String? shareUrl;
  String? verseAudio;
  int? verseNo;
  String? verseText;

  Verses(
      {this.arabicText,
      this.duration,
      this.shareUrl,
      this.verseAudio,
      this.verseNo,
      this.verseText});

  Verses.fromJson(Map<String, dynamic> json) {
    arabicText = json['arabic_text'];
    duration = json['duration'];
    shareUrl = json['share_url'];
    verseAudio = json['verse_audio'];
    verseNo = json['verse_no'];
    verseText = json['verse_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['arabic_text'] = arabicText;
    data['duration'] = duration;
    data['share_url'] = shareUrl;
    data['verse_audio'] = verseAudio;
    data['verse_no'] = verseNo;
    data['verse_text'] = verseText;
    return data;
  }
}
