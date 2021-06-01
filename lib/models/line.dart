class Line {
  List<String> districts;
  List<String> stops;

  Line({
    this.districts,
    this.stops
  });

  Line.fromJson(Map<String, dynamic> json) {
    districts = json['districts'].cast<String>();
    stops = json['stops'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['districts'] = this.districts;
    data['stops'] = this.stops;
    return data;
  }
}