class Stop {
  String description;
  String location;

  Stop({
    this.description,
    this.location,
  });

  static Stop fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Stop(
      description: map['description'],
      location: map['location'],
    );
  }  

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'location': location,
    };
  }
}