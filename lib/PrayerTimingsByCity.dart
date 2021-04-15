import 'package:dio/dio.dart';

class PrayerTimingsByCity {
  int code;
  String status;
  List<Data> data;

  PrayerTimingsByCity({this.code, this.status, this.data});

  PrayerTimingsByCity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Future<PrayerTimingsByCity> getTimings() async {
    var dateTime = DateTime.now();

    final url =
        "http://api.aladhan.com/v1/calendarByCity?city=Uttara&country=Bangladesh&method=2&month=${dateTime.month}&year=${dateTime.year}";
    Dio dio = new Dio();
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      var data = PrayerTimingsByCity.fromJson(response.data);

      return data;
    } else {}

    return null;
  }
}

class Data {
  Timings timings;
  Date date;

  Data({this.timings, this.date});

  Data.fromJson(Map<String, dynamic> json) {
    timings =
        json['timings'] != null ? new Timings.fromJson(json['timings']) : null;
    date = json['date'] != null ? new Date.fromJson(json['date']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.timings != null) {
      data['timings'] = this.timings.toJson();
    }
    if (this.date != null) {
      data['date'] = this.date.toJson();
    }
    return data;
  }
}

class Timings {
  String fajr;
  String sunrise;
  String dhuhr;
  String asr;
  String sunset;
  String maghrib;
  String isha;
  String imsak;
  String midnight;

  Timings(
      {this.fajr,
      this.sunrise,
      this.dhuhr,
      this.asr,
      this.sunset,
      this.maghrib,
      this.isha,
      this.imsak,
      this.midnight});

  Timings.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    sunset = json['Sunset'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
    imsak = json['Imsak'];
    midnight = json['Midnight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Fajr'] = this.fajr;
    data['Sunrise'] = this.sunrise;
    data['Dhuhr'] = this.dhuhr;
    data['Asr'] = this.asr;
    data['Sunset'] = this.sunset;
    data['Maghrib'] = this.maghrib;
    data['Isha'] = this.isha;
    data['Imsak'] = this.imsak;
    data['Midnight'] = this.midnight;
    return data;
  }
}

class Date {
  String readable;
  String timestamp;
  Gregorian gregorian;
  Hijri hijri;

  Date({this.readable, this.timestamp, this.gregorian, this.hijri});

  Date.fromJson(Map<String, dynamic> json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    gregorian = json['gregorian'] != null
        ? new Gregorian.fromJson(json['gregorian'])
        : null;
    hijri = json['hijri'] != null ? new Hijri.fromJson(json['hijri']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['readable'] = this.readable;
    data['timestamp'] = this.timestamp;
    if (this.gregorian != null) {
      data['gregorian'] = this.gregorian.toJson();
    }
    if (this.hijri != null) {
      data['hijri'] = this.hijri.toJson();
    }
    return data;
  }
}

class Gregorian {
  String date;
  String format;
  String day;
  GeorgianMonth month;
  String year;

  Gregorian({this.date, this.format, this.day, this.month, this.year});

  Gregorian.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    month = json['month'] != null
        ? new GeorgianMonth.fromJson(json['month'])
        : null;
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['format'] = this.format;
    data['day'] = this.day;
    if (this.month != null) {
      data['month'] = this.month.toJson();
    }
    data['year'] = this.year;
    return data;
  }
}

class Weekday {
  String en;

  Weekday({this.en});

  Weekday.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    return data;
  }
}

class GeorgianMonth {
  int number;
  String en;

  GeorgianMonth({this.number, this.en});

  GeorgianMonth.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['en'] = this.en;
    return data;
  }
}

class Hijri {
  String date;
  String format;
  String day;
  HijriMonth month;
  String year;

  Hijri({this.date, this.format, this.day, this.month, this.year});

  Hijri.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    month =
        json['month'] != null ? new HijriMonth.fromJson(json['month']) : null;
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['format'] = this.format;
    data['day'] = this.day;

    if (this.month != null) {
      data['month'] = this.month.toJson();
    }
    data['year'] = this.year;

    return data;
  }
}

class HijriMonth {
  int number;
  String en;
  String ar;

  HijriMonth({this.number, this.en, this.ar});

  HijriMonth.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}
