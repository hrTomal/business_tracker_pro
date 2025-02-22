class Address {
  bool? isActive;
  bool? isDelivery;
  int? id;
  bool? isDefault;
  String? suburb;
  String? city;
  String? streetAddress;
  int? country;
  bool? isInvoice;
  String? state;

  Address(
      {this.isActive,
      this.isDelivery,
      this.id,
      this.isDefault,
      this.suburb,
      this.city,
      this.streetAddress,
      this.country,
      this.isInvoice,
      this.state});

  Address.fromJson(Map<String, dynamic> json) {
    isActive = json['is_active'];
    isDelivery = json['is_delivery'];
    id = json['id'];
    isDefault = json['is_default'];
    suburb = json['suburb'];
    city = json['city'];
    streetAddress = json['street_address'];
    country = json['country'];
    isInvoice = json['is_invoice'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_active'] = this.isActive;
    data['is_delivery'] = this.isDelivery;
    data['id'] = this.id;
    data['is_default'] = this.isDefault;
    data['suburb'] = this.suburb;
    data['city'] = this.city;
    data['street_address'] = this.streetAddress;
    data['country'] = this.country;
    data['is_invoice'] = this.isInvoice;
    data['state'] = this.state;
    return data;
  }
}
