import 'dart:convert';

List<Posts> transFromJson(String str) =>
    List<Posts>.from(json.decode(str).map((x) => Posts.fromMap(x)));

class Posts{
  Posts({this.id, this.title, this.datePub, this.body, this.snippet});
  String? id;
  String? title;
  String? body;
  String? snippet;
  String? datePub;

  factory Posts.fromMap(Map<String, dynamic> json) => Posts(
    id: json["_id"],
    title: json["title"],
    body: json["body"],
    snippet: json["snippet"],
    datePub: json["createdAt"],
  );

}