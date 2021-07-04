class Prediction {
  String verdict;
  bool isDetected;
  String image;

  Prediction({
    this.verdict,
    this.isDetected,
    this.image,
  });

  static Prediction fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : Prediction(
            verdict: data["verdict"] ?? "",
            isDetected: data["is_detected"] ?? false,
            image: data["image"] ?? "",
          );
  }

  Map<String, dynamic> toVariables() {
    return {
      "verdict": verdict,
      "is_detected": isDetected,
      "image": image,
    };
  }
}
