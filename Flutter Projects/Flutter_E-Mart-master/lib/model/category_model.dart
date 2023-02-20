// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.categories,
  });

  List<Category> categories;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.name,
    required this.subcategories,
  });

  String name;
  List<String> subcategories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        subcategories: List<String>.from(json["subcategories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "subcategories": List<dynamic>.from(subcategories.map((x) => x)),
      };
}
