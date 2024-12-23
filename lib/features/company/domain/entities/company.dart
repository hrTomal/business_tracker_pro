class Company {
  int? id;
  bool? isActive;
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
  int? division;
  int? district;
  int? latestActiveBilling;
  int? latestGeneratedBilling;
  List<int>? staffs;
  List<int>? owners;

  Company(
      {this.id,
      this.isActive,
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
      this.division,
      this.district,
      this.latestActiveBilling,
      this.latestGeneratedBilling,
      this.staffs,
      this.owners});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['is_active'];
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
    division = json['division'];
    district = json['district'];
    latestActiveBilling = json['latest_active_billing'];
    latestGeneratedBilling = json['latest_generated_billing'];
    staffs = json['staffs'].cast<int>();
    owners = json['owners'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_active'] = isActive;
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
    data['division'] = division;
    data['district'] = district;
    data['latest_active_billing'] = latestActiveBilling;
    data['latest_generated_billing'] = latestGeneratedBilling;
    data['staffs'] = staffs;
    data['owners'] = owners;
    return data;
  }
}
