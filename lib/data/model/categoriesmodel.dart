class Categoriesmodel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameTr;
  String? categoriesImage;
  String? categoriesDatetime;

  Categoriesmodel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameTr,
      this.categoriesImage,
      this.categoriesDatetime});

  Categoriesmodel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameTr = json['categories_name_tr'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_tr'] = this.categoriesNameTr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}
