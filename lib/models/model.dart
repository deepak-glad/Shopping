// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.success,
    this.data,
    this.count,
  });

  bool success;
  List<Datum> data;
  int count;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "count": count,
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.description,
    this.shortProductDescription,
    this.productMrp,
    this.mrpBusiness,
    this.sku,
    this.igst,
    this.sgst,
    this.cgst,
    this.minimumQtyCustomer,
    this.barcode,
    this.available,
    this.createdAt,
    this.updatedAt,
    this.brandId,
    this.mediumId,
    this.medium,
    this.productGallery,
    this.productCategories,
    this.brand,
  });

  String id;
  String name;
  String description;
  String shortProductDescription;
  int productMrp;
  int mrpBusiness;
  String sku;
  int igst;
  double sgst;
  double cgst;
  int minimumQtyCustomer;
  dynamic barcode;
  bool available;
  int createdAt;
  int updatedAt;
  String brandId;
  dynamic mediumId;
  dynamic medium;
  List<dynamic> productGallery;
  List<ProductCategory> productCategories;
  Brand brand;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        shortProductDescription: json["short_product_description"],
        productMrp: json["product_mrp"],
        mrpBusiness: json["mrp_business"],
        sku: json["sku"],
        igst: json["igst"],
        sgst: json["sgst"].toDouble(),
        cgst: json["cgst"].toDouble(),
        minimumQtyCustomer: json["minimum_qty_customer"],
        barcode: json["barcode"],
        available: json["available"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        brandId: json["BrandId"],
        mediumId: json["MediumId"],
        medium: json["Medium"],
        productGallery:
            List<dynamic>.from(json["productGallery"].map((x) => x)),
        productCategories: List<ProductCategory>.from(
            json["ProductCategories"].map((x) => ProductCategory.fromJson(x))),
        brand: Brand.fromJson(json["Brand"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "short_product_description": shortProductDescription,
        "product_mrp": productMrp,
        "mrp_business": mrpBusiness,
        "sku": sku,
        "igst": igst,
        "sgst": sgst,
        "cgst": cgst,
        "minimum_qty_customer": minimumQtyCustomer,
        "barcode": barcode,
        "available": available,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "BrandId": brandId,
        "MediumId": mediumId,
        "Medium": medium,
        "productGallery": List<dynamic>.from(productGallery.map((x) => x)),
        "ProductCategories":
            List<dynamic>.from(productCategories.map((x) => x.toJson())),
        "Brand": brand.toJson(),
      };
}

class Brand {
  Brand({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.mediumId,
    this.medium,
  });

  String id;
  Name name;
  int createdAt;
  int updatedAt;
  dynamic mediumId;
  dynamic medium;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: nameValues.map[json["name"]],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        mediumId: json["MediumId"],
        medium: json["Medium"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "MediumId": mediumId,
        "Medium": medium,
      };
}

enum Name { FORTUNE, ALIFE, RAAG, KINGS, AADHAR, BULLET, JUBILEE, AVSAR }

final nameValues = EnumValues({
  "Aadhar": Name.AADHAR,
  "Alife": Name.ALIFE,
  "Avsar": Name.AVSAR,
  "Bullet": Name.BULLET,
  "Fortune": Name.FORTUNE,
  "Jubilee": Name.JUBILEE,
  "Kings": Name.KINGS,
  "Raag": Name.RAAG
});

class ProductCategory {
  ProductCategory({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.productId,
    this.categoryId,
    this.subCategoryId,
    this.category,
  });

  String id;
  int createdAt;
  int updatedAt;
  String productId;
  String categoryId;
  String subCategoryId;
  Category category;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        productId: json["ProductId"],
        categoryId: json["CategoryId"] == null ? null : json["CategoryId"],
        subCategoryId:
            json["SubCategoryId"] == null ? null : json["SubCategoryId"],
        category: json["Category"] == null
            ? null
            : Category.fromJson(json["Category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "ProductId": productId,
        "CategoryId": categoryId == null ? null : categoryId,
        "SubCategoryId": subCategoryId == null ? null : subCategoryId,
        "Category": category == null ? null : category.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.priority,
    this.status,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.mediumId,
    this.medium,
  });

  String id;
  String name;
  int priority;
  bool status;
  Description description;
  int createdAt;
  int updatedAt;
  String mediumId;
  Medium medium;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        priority: json["priority"],
        status: json["status"],
        description: json["description"] == null
            ? null
            : descriptionValues.map[json["description"]],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        mediumId: json["MediumId"],
        medium: Medium.fromJson(json["Medium"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "priority": priority,
        "status": status,
        "description":
            description == null ? null : descriptionValues.reverse[description],
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "MediumId": mediumId,
        "Medium": medium.toJson(),
      };
}

enum Description { RICE, OIL, ATT }

final descriptionValues = EnumValues(
    {"Att": Description.ATT, "Oil": Description.OIL, "Rice": Description.RICE});

class Medium {
  Medium({
    this.id,
    this.mediakey,
    this.url,
    this.ext,
    this.format,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String mediakey;
  String url;
  Ext ext;
  Ext format;
  int createdAt;
  int updatedAt;

  factory Medium.fromJson(Map<String, dynamic> json) => Medium(
        id: json["id"],
        mediakey: json["mediakey"],
        url: json["url"],
        ext: extValues.map[json["ext"]],
        format: extValues.map[json["format"]],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mediakey": mediakey,
        "url": url,
        "ext": extValues.reverse[ext],
        "format": extValues.reverse[format],
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

enum Ext { PNG, JPG }

final extValues = EnumValues({"jpg": Ext.JPG, "png": Ext.PNG});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
