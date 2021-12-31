class Feedback2 {
  int id = 0;
  String name = "";
  String email = "";
  String comments = "";

  Feedback2({
    required this.id,
    required this.name, required this.email, required this.comments});

  factory Feedback2.fromJson(Map<String, dynamic> json) {
    return Feedback2(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        comments: json['comments']);
  }

  dynamic toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'comments': comments
  };
}