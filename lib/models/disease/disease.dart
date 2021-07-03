class Disease {
  String name;
  int severity;

  Disease({this.name, this.severity = 1});

  static Disease fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : Disease(
            name: data["name"] ?? "",
            severity: data["severity"] ?? 1,
          );
  }

  static List<Disease> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "name": name,
      "severity": severity,
    };
  }
}
