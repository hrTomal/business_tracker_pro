class Company {
  int? id;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? addressLine1;
  String? addressLine2;
  String? companyCost;
  String? perOwnerCost;
  String? perUserCost;
  String? fixedCost;
  bool? useFixedCost;
  bool? useCustomCompanyCost;
  bool? useCustomUserCost;
  bool? useCustomOwnerCost;
  String? subscriptionExpiresAt;
  int? createdBy;
  int? updatedBy;
  int? division;
  int? district;
  int? latestBilling;
  List<int>? staffs;
  List<int>? owners;

  Company(
      {this.id,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.addressLine1,
      this.addressLine2,
      this.companyCost,
      this.perOwnerCost,
      this.perUserCost,
      this.fixedCost,
      this.useFixedCost,
      this.useCustomCompanyCost,
      this.useCustomUserCost,
      this.useCustomOwnerCost,
      this.subscriptionExpiresAt,
      this.createdBy,
      this.updatedBy,
      this.division,
      this.district,
      this.latestBilling,
      this.staffs,
      this.owners});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    companyCost = json['company_cost'];
    perOwnerCost = json['per_owner_cost'];
    perUserCost = json['per_user_cost'];
    fixedCost = json['fixed_cost'];
    useFixedCost = json['use_fixed_cost'];
    useCustomCompanyCost = json['use_custom_company_cost'];
    useCustomUserCost = json['use_custom_user_cost'];
    useCustomOwnerCost = json['use_custom_owner_cost'];
    subscriptionExpiresAt = json['subscription_expires_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    division = json['division'];
    district = json['district'];
    latestBilling = json['latest_billing'];
    staffs = json['staffs'].cast<int>();
    owners = json['owners'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['company_cost'] = companyCost;
    data['per_owner_cost'] = perOwnerCost;
    data['per_user_cost'] = perUserCost;
    data['fixed_cost'] = fixedCost;
    data['use_fixed_cost'] = useFixedCost;
    data['use_custom_company_cost'] = useCustomCompanyCost;
    data['use_custom_user_cost'] = useCustomUserCost;
    data['use_custom_owner_cost'] = useCustomOwnerCost;
    data['subscription_expires_at'] = subscriptionExpiresAt;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['division'] = division;
    data['district'] = district;
    data['latest_billing'] = latestBilling;
    data['staffs'] = staffs;
    data['owners'] = owners;
    return data;
  }
}
