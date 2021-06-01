class Stop {
  String description;
  String location;

  Stop({
    this.description,
    this.location,
  });

  Stop.fromJson(Map<String, dynamic> json) {
    description = json['description'].cast<String>();
    location = json['location'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['location'] = this.location;
    return data;
  }
}