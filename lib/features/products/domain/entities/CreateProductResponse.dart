class CreateProductResponse {
  int? id;
  List<int>? attributes;
  bool? isActive;
  String? name;
  String? cost;
  String? retailPrice;
  String? wholesalePrice;
  String? sku;
  String? additionalIdentifier;
  bool? isSerializedProduct;
  String? description;
  int? company;
  int? parent;
  int? brand;
  int? subcategory;

  CreateProductResponse(
      {this.id,
      this.attributes,
      this.isActive,
      this.name,
      this.cost,
      this.retailPrice,
      this.wholesalePrice,
      this.sku,
      this.additionalIdentifier,
      this.isSerializedProduct,
      this.description,
      this.company,
      this.parent,
      this.brand,
      this.subcategory});

  CreateProductResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'].cast<int>();
    isActive = json['is_active'];
    name = json['name'];
    cost = json['cost'];
    retailPrice = json['retail_price'];
    wholesalePrice = json['wholesale_price'];
    sku = json['sku'];
    additionalIdentifier = json['additional_identifier'];
    isSerializedProduct = json['is_serialized_product'];
    description = json['description'];
    company = json['company'];
    parent = json['parent'];
    brand = json['brand'];
    subcategory = json['subcategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['attributes'] = attributes;
    data['is_active'] = isActive;
    data['name'] = name;
    data['cost'] = cost;
    data['retail_price'] = retailPrice;
    data['wholesale_price'] = wholesalePrice;
    data['sku'] = sku;
    data['additional_identifier'] = additionalIdentifier;
    data['is_serialized_product'] = isSerializedProduct;
    data['description'] = description;
    data['company'] = company;
    data['parent'] = parent;
    data['brand'] = brand;
    data['subcategory'] = subcategory;
    return data;
  }
}
