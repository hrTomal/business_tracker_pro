class ProductsResponse {
  int? count;
  String? next;
  String? previous;
  List<ProductInfo>? results;
  String? message;

  ProductsResponse(
      {this.count, this.next, this.previous, this.results, this.message});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <ProductInfo>[];
      json['results'].forEach((v) {
        results!.add(new ProductInfo.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class ProductInfo {
  String? name;
  int? company;
  String? additionalIdentifier;
  int? category;
  List<int>? attributes;
  int? id;
  bool? isActive;
  String? retailPrice;
  String? wholesalePrice;
  int? parent;
  int? brand;
  String? cost;
  String? sku;
  String? description;
  bool? isSerializedProduct;
  int? subcategory;

  ProductInfo(
      {this.name,
      this.company,
      this.additionalIdentifier,
      this.category,
      this.attributes,
      this.id,
      this.isActive,
      this.retailPrice,
      this.wholesalePrice,
      this.parent,
      this.brand,
      this.cost,
      this.sku,
      this.description,
      this.isSerializedProduct,
      this.subcategory});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    company = json['company'];
    additionalIdentifier = json['additional_identifier'];
    category = json['category'];
    attributes = json['attributes'].cast<int>();
    id = json['id'];
    isActive = json['is_active'];
    retailPrice = json['retail_price'];
    wholesalePrice = json['wholesale_price'];
    parent = json['parent'];
    brand = json['brand'];
    cost = json['cost'];
    sku = json['sku'];
    description = json['description'];
    isSerializedProduct = json['is_serialized_product'];
    subcategory = json['subcategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['company'] = this.company;
    data['additional_identifier'] = this.additionalIdentifier;
    data['category'] = this.category;
    data['attributes'] = this.attributes;
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['retail_price'] = this.retailPrice;
    data['wholesale_price'] = this.wholesalePrice;
    data['parent'] = this.parent;
    data['brand'] = this.brand;
    data['cost'] = this.cost;
    data['sku'] = this.sku;
    data['description'] = this.description;
    data['is_serialized_product'] = this.isSerializedProduct;
    data['subcategory'] = this.subcategory;
    return data;
  }
}
