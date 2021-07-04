import 'package:sense_flutter/models/user/user.dart';

class Review {
  User user;
  String comment;
  int appreciation;

  Review({this.user, this.comment, this.appreciation});

  Review.copy(Review review)
      : this(
          user: User.copy(review?.user),
          comment: review.comment,
          appreciation: review.appreciation,
        );

  static Review fromMap(Map<String, dynamic> data) {
    return data == null
        ? null
        : Review(
            user: User.fromMap(data["user"]),
            comment: data["comment"] ?? "",
            appreciation: data["appreciation"] ?? 0,
          );
  }

  static List<Review> fromMapList(List<dynamic> data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "user": user?.toVariables(),
      "comment": comment,
      "appreciation": appreciation,
    };
  }
}
