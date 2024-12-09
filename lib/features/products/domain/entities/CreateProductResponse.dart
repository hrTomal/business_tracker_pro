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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attributes'] = this.attributes;
    data['is_active'] = this.isActive;
    data['name'] = this.name;
    data['cost'] = this.cost;
    data['retail_price'] = this.retailPrice;
    data['wholesale_price'] = this.wholesalePrice;
    data['sku'] = this.sku;
    data['additional_identifier'] = this.additionalIdentifier;
    data['is_serialized_product'] = this.isSerializedProduct;
    data['description'] = this.description;
    data['company'] = this.company;
    data['parent'] = this.parent;
    data['brand'] = this.brand;
    data['subcategory'] = this.subcategory;
    return data;
  }
}
