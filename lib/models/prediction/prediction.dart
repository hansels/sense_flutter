class Prediction {
  String name;
  String verdict;
  String description;
  bool isDetected;
  String image;

  Prediction({
    this.name,
    this.verdict,
    this.description,
    this.isDetected,
    this.image,
  });

  static Prediction fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : Prediction(
            name: data["name"] ?? "",
            verdict: data["verdict"] ?? "",
            description: data["description"] ?? "",
            isDetected: data["is_detected"] ?? false,
            image: data["image"] ?? "",
          );
  }

  Map<String, dynamic> toVariables() {
    return {
      "name": name,
      "verdict": verdict,
      "description": description,
      "is_detected": isDetected,
      "image": image,
    };
  }
}
