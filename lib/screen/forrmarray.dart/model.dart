class TableModel {
  String? hold;
  List<Entry>? entries;

  TableModel({this.hold, this.entries});

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      hold: json['hold'],
      entries: json['entries'] != null
          ? (json['entries'] as List).map((e) => Entry.fromJson(e)).toList()
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'hold': hold,
      'entries': entries?.map((entry) => entry.toJson()).toList(),
    };
  }
}

class Entry {
  String? dropdownField;
  DateTime? date;
  String? dday;
  String? dmiss;
  String? dexample;
  DateTime? time;
  String? daytext;
  String? seven;

  Entry({
    this.dropdownField,
    this.date,
    this.dday,
    this.dmiss,
    this.dexample,
    this.time,
    this.daytext,
    this.seven,
  });

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      dropdownField: json['dropdownField'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      dday: json['dday'],
      dmiss: json['dmiss'],
      dexample: json['dexample'],
      time: json['time'] != null ? DateTime.parse(json['time']) : null,
      daytext: json['daytext'],
      seven: json['seven'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dropdownField': dropdownField,
      'date': date?.toIso8601String(),
      'dday': dday,
      'dmiss': dmiss,
      'dexample': dexample,
      'time': time?.toIso8601String(),
      'daytext': daytext,
      'seven': seven,
    };
  }
}
