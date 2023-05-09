// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductsModel {
  final double barcode;
  final String brandName;
  final String companyName;
  final String family;
  final double hsnCode;
  int productQuantity = 1;
  final String images;
  final double mrp;
  final String parentCategory;
  final String sku;
  final String subCategory;
  final double tax;
  final String unit;
  final double weight;
  ProductsModel({
    required this.barcode,
    required this.brandName,
    required this.companyName,
    required this.family,
    required this.hsnCode,
    required this.images,
    required this.mrp,
    required this.parentCategory,
    required this.sku,
    required this.subCategory,
    required this.tax,
    required this.unit,
    required this.weight,
  });

  ProductsModel copyWith({
    double? barcode,
    String? brandName,
    String? companyName,
    String? family,
    double? hsnCode,
    String? images,
    double? mrp,
    String? parentCategory,
    String? sku,
    String? subCategory,
    double? tax,
    String? unit,
    double? weight,
  }) {
    return ProductsModel(
      barcode: barcode ?? this.barcode,
      brandName: brandName ?? this.brandName,
      companyName: companyName ?? this.companyName,
      family: family ?? this.family,
      hsnCode: hsnCode ?? this.hsnCode,
      images: images ?? this.images,
      mrp: mrp ?? this.mrp,
      parentCategory: parentCategory ?? this.parentCategory,
      sku: sku ?? this.sku,
      subCategory: subCategory ?? this.subCategory,
      tax: tax ?? this.tax,
      unit: unit ?? this.unit,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Barcode': barcode,
      'Brand Name': brandName,
      'Company Name': companyName,
      'Family': family,
      'HSN Code': hsnCode,
      'Images': images,
      'MRP': mrp,
      'Parent Category': parentCategory,
      'SKU': sku,
      'Sub Category': subCategory,
      'Tax': tax,
      'Unit': unit,
      'Weight': weight,
      'Quantity': productQuantity
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      barcode: double.parse(map['Barcode'].toString()),
      brandName: map['Brand Name'] as String,
      companyName: map['Company Name'] as String,
      family: map['Family'] as String,
      hsnCode: double.parse(map['HSN Code'].toString()),
      images: map['Images'] as String,
      mrp: double.parse(map['MRP'].toString()),
      parentCategory: map['Parent Category'] as String,
      sku: map['SKU'] as String,
      subCategory: map['Sub Category'] as String,
      tax: double.parse(map['Tax'].toString()),
      unit: map['Unit'] as String,
      weight: double.parse(map['Weight'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) =>
      ProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductsModel(barcode: $barcode, brandName: $brandName, companyName: $companyName, family: $family, hsnCode: $hsnCode, images: $images, mrp: $mrp, parentCategory: $parentCategory, sku: $sku, subCategory: $subCategory, tax: $tax, unit: $unit, weight: $weight)';
  }

  @override
  bool operator ==(covariant ProductsModel other) {
    if (identical(this, other)) return true;

    return other.barcode == barcode &&
        other.brandName == brandName &&
        other.companyName == companyName &&
        other.family == family &&
        other.hsnCode == hsnCode &&
        other.images == images &&
        other.mrp == mrp &&
        other.parentCategory == parentCategory &&
        other.sku == sku &&
        other.subCategory == subCategory &&
        other.tax == tax &&
        other.unit == unit &&
        other.weight == weight;
  }

  @override
  int get hashCode {
    return barcode.hashCode ^
        brandName.hashCode ^
        companyName.hashCode ^
        family.hashCode ^
        hsnCode.hashCode ^
        images.hashCode ^
        mrp.hashCode ^
        parentCategory.hashCode ^
        sku.hashCode ^
        subCategory.hashCode ^
        tax.hashCode ^
        unit.hashCode ^
        weight.hashCode;
  }
}
