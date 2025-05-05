class DiseaseInfo {
  String? sId;
  String? diseaseName;
  List<String>? image;
  int? iV;

  DiseaseInfo({this.sId, this.diseaseName, this.image, this.iV});

  DiseaseInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    diseaseName = json['disease_name'];
    image = json['image'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['disease_name'] = this.diseaseName;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}
