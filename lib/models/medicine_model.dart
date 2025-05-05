class MedicineModel {
  String? sId;
  String? diseaseData;
  String? medicineName;
  int? price;
  String? description;
  String? image1;
  String? image2;
  String? image3;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MedicineModel(
      {this.sId,
        this.diseaseData,
        this.medicineName,
        this.price,
        this.description,
        this.image1,
        this.image2,
        this.image3,
        this.createdAt,
        this.updatedAt,
        this.iV});

  MedicineModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    diseaseData = json['disease_data'];
    medicineName = json['medicine_name'];
    price = json['price'];
    description = json['description'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['disease_data'] = this.diseaseData;
    data['medicine_name'] = this.medicineName;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}