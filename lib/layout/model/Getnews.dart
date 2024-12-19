class Getnews {
  int id;
  String title;
  String body;

  // Constructor
  Getnews({required this.id, required this.title, required this.body});

  // Factory method for creating an instance from JSON
  factory Getnews.fromJson(Map<String, dynamic> json) {
    return Getnews(
      id: json['id'], 
      title: json['title'], 
      body: json['body'],
    );
  }
}
