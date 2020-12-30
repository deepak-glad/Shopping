// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome with ChangeNotifier {
  Welcome({
    this.count,
    this.data,
    this.success,
  });

  int count;
  List<Datum> data;
  bool success;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
      };
}

class Datum {
  Datum({
    this.brand,
    this.brandId,
    this.productCategories,
    this.available,
    this.cgst,
    this.createdAt,
    this.description,
    this.id,
    this.igst,
    this.minimumQtyCustomer,
    this.mrpBusiness,
    this.name,
    this.productMrp,
    this.sgst,
    this.shortProductDescription,
    this.sku,
    this.updatedAt,
  });

  Brand brand;
  String brandId;
  List<ProductCategory> productCategories;
  bool available;
  double cgst;
  int createdAt;
  String description;
  String id;
  int igst;
  int minimumQtyCustomer;
  int mrpBusiness;
  String name;
  int productMrp;
  double sgst;
  String shortProductDescription;
  String sku;
  int updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        brand: Brand.fromJson(json["Brand"]),
        brandId: json["BrandId"],
        productCategories: List<ProductCategory>.from(
            json["ProductCategories"].map((x) => ProductCategory.fromJson(x))),
        available: json["available"],
        cgst: json["cgst"].toDouble(),
        createdAt: json["createdAt"],
        description: json["description"],
        id: json["id"],
        igst: json["igst"],
        minimumQtyCustomer: json["minimum_qty_customer"],
        mrpBusiness: json["mrp_business"],
        name: json["name"],
        productMrp: json["product_mrp"],
        sgst: json["sgst"].toDouble(),
        shortProductDescription: json["short_product_description"],
        sku: json["sku"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "Brand": brand.toJson(),
        "BrandId": brandId,
        "ProductCategories":
            List<dynamic>.from(productCategories.map((x) => x.toJson())),
        "available": available,
        "cgst": cgst,
        "createdAt": createdAt,
        "description": description,
        "id": id,
        "igst": igst,
        "minimum_qty_customer": minimumQtyCustomer,
        "mrp_business": mrpBusiness,
        "name": name,
        "product_mrp": productMrp,
        "sgst": sgst,
        "short_product_description": shortProductDescription,
        "sku": sku,
        "updatedAt": updatedAt,
      };
}

class Brand {
  Brand({
    this.createdAt,
    this.id,
    this.name,
    this.updatedAt,
  });

  int createdAt;
  String id;
  Name name;
  int updatedAt;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        createdAt: json["createdAt"],
        id: json["id"],
        name: nameValues.map[json["name"]],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "id": id,
        "name": nameValues.reverse[name],
        "updatedAt": updatedAt,
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
    this.category,
    this.categoryId,
    this.productId,
    this.subCategoryId,
    this.createdAt,
    this.id,
    this.updatedAt,
  });

  Category category;
  String categoryId;
  String productId;
  String subCategoryId;
  int createdAt;
  String id;
  int updatedAt;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        category: json["Category"] == null
            ? null
            : Category.fromJson(json["Category"]),
        categoryId: json["CategoryId"] == null ? null : json["CategoryId"],
        productId: json["ProductId"],
        subCategoryId:
            json["SubCategoryId"] == null ? null : json["SubCategoryId"],
        createdAt: json["createdAt"],
        id: json["id"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "Category": category == null ? null : category.toJson(),
        "CategoryId": categoryId == null ? null : categoryId,
        "ProductId": productId,
        "SubCategoryId": subCategoryId == null ? null : subCategoryId,
        "createdAt": createdAt,
        "id": id,
        "updatedAt": updatedAt,
      };
}

class Category {
  Category({
    this.medium,
    this.mediumId,
    this.createdAt,
    this.id,
    this.name,
    this.priority,
    this.status,
    this.updatedAt,
    this.description,
  });

  Medium medium;
  String mediumId;
  int createdAt;
  String id;
  String name;
  int priority;
  bool status;
  int updatedAt;
  Description description;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        medium: Medium.fromJson(json["Medium"]),
        mediumId: json["MediumId"],
        createdAt: json["createdAt"],
        id: json["id"],
        name: json["name"],
        priority: json["priority"],
        status: json["status"],
        updatedAt: json["updatedAt"],
        description: json["description"] == null
            ? null
            : descriptionValues.map[json["description"]],
      );

  Map<String, dynamic> toJson() => {
        "Medium": medium.toJson(),
        "MediumId": mediumId,
        "createdAt": createdAt,
        "id": id,
        "name": name,
        "priority": priority,
        "status": status,
        "updatedAt": updatedAt,
        "description":
            description == null ? null : descriptionValues.reverse[description],
      };
}

enum Description { RICE, OIL, ATT }

final descriptionValues = EnumValues(
    {"Att": Description.ATT, "Oil": Description.OIL, "Rice": Description.RICE});

class Medium {
  Medium({
    this.createdAt,
    this.ext,
    this.format,
    this.id,
    this.mediakey,
    this.updatedAt,
    this.url,
  });

  int createdAt;
  Ext ext;
  Ext format;
  String id;
  String mediakey;
  int updatedAt;
  String url;

  factory Medium.fromJson(Map<String, dynamic> json) => Medium(
        createdAt: json["createdAt"],
        ext: extValues.map[json["ext"]],
        format: extValues.map[json["format"]],
        id: json["id"],
        mediakey: json["mediakey"],
        updatedAt: json["updatedAt"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "ext": extValues.reverse[ext],
        "format": extValues.reverse[format],
        "id": id,
        "mediakey": mediakey,
        "updatedAt": updatedAt,
        "url": url,
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
