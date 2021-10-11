class Line {
  String title;

  Line({
    this.title,
  });

  static Line fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Line(
      title: map['title'],
    );
  }  

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }
}