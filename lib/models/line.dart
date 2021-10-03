class Line {
  List<String> districts;

  Line({
    this.districts,
  });

  static Line fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Line(
      districts: map['districts'],
    );
  }  

  Map<String, dynamic> toMap() {
    return {
      'districts': districts,
    };
  }
}