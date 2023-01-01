class HajiUmrahs {
  List<HajiUmrah>? hajiUmrah;

  HajiUmrahs({this.hajiUmrah});

  HajiUmrahs.fromJson(Map<String, dynamic> json) {
    if (json['haji_umrah'] != null) {
      hajiUmrah = <HajiUmrah>[];
      json['haji_umrah'].forEach((v) {
        hajiUmrah!.add(new HajiUmrah.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hajiUmrah != null) {
      data['haji_umrah'] = this.hajiUmrah!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HajiUmrah {
  String? categoryName;
  int? categoryNo;
  String? icon;
  int? chapterCount;
  List<Chapters>? chapters;

  HajiUmrah(
      {this.categoryName,
      this.categoryNo,
      this.icon,
      this.chapterCount,
      this.chapters});

  HajiUmrah.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    categoryNo = json['category_no'];
    icon = json['icon'];
    chapterCount = json['chapter_count'];
    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters!.add(new Chapters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = this.categoryName;
    data['category_no'] = this.categoryNo;
    data['icon'] = this.icon;
    data['chapter_count'] = this.chapterCount;
    if (this.chapters != null) {
      data['chapters'] = this.chapters!.map((v) => v.toJson()).toList();
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
        verses!.add(new Verses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chapter_name'] = this.chapterName;
    data['chapter_no'] = this.chapterNo;
    if (this.verses != null) {
      data['verses'] = this.verses!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arabic_text'] = this.arabicText;
    data['duration'] = this.duration;
    data['share_url'] = this.shareUrl;
    data['verse_audio'] = this.verseAudio;
    data['verse_no'] = this.verseNo;
    data['verse_text'] = this.verseText;
    return data;
  }
}
