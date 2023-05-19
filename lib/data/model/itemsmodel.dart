class Itemsmodel {
  String? itemsId;
  String? itemsName;
  String? itemsNameTr;
  String? itemsDesc;
  String? itemsDescTr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscuont;
  String? itemsDate;
  String? itemsCat;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameTr;
  String? categoriesImage;
  String? categoriesDatetime;

  Itemsmodel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameTr,
      this.itemsDesc,
      this.itemsDescTr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscuont,
      this.itemsDate,
      this.itemsCat,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameTr,
      this.categoriesImage,
      this.categoriesDatetime});

  Itemsmodel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameTr = json['items_name_tr'];
    itemsDesc = json['items_desc'];
    itemsDescTr = json['items_desc_tr'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscuont = json['items_discuont'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameTr = json['categories_name_tr'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_tr'] = this.itemsNameTr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_tr'] = this.itemsDescTr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discuont'] = this.itemsDiscuont;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_tr'] = this.categoriesNameTr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}
