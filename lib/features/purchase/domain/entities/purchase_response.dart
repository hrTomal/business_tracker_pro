class PurchaseResponse {
  int? count;
  String? next;
  String? previous;
  List<Purchase>? results;

  PurchaseResponse({this.count, this.next, this.previous, this.results});

  PurchaseResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Purchase>[];
      json['results'].forEach((v) {
        results!.add(new Purchase.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Purchase {
  String? finalAmount;
  String? status;
  String? expectedDeliveryAt;
  String? totalProductPrice;
  String? note;
  String? deliveredAt;
  String? deliveryFee;
  String? discount;
  bool? isActive;
  List<LineItems>? lineItems;
  String? grossAmount;
  String? orderedAt;
  int? warehouse;
  String? invoiceGeneratedAt;
  String? netAmount;
  String? totalVat;
  int? id;
  String? vendorRef;
  String? vat;
  String? additionalFee;
  int? vendor;
  String? totalDiscount;

  Purchase(
      {this.finalAmount,
      this.status,
      this.expectedDeliveryAt,
      this.totalProductPrice,
      this.note,
      this.deliveredAt,
      this.deliveryFee,
      this.discount,
      this.isActive,
      this.lineItems,
      this.grossAmount,
      this.orderedAt,
      this.warehouse,
      this.invoiceGeneratedAt,
      this.netAmount,
      this.totalVat,
      this.id,
      this.vendorRef,
      this.vat,
      this.additionalFee,
      this.vendor,
      this.totalDiscount});

  Purchase.fromJson(Map<String, dynamic> json) {
    finalAmount = json['final_amount'];
    status = json['status'];
    expectedDeliveryAt = json['expected_delivery_at'];
    totalProductPrice = json['total_product_price'];
    note = json['note'];
    deliveredAt = json['delivered_at'];
    deliveryFee = json['delivery_fee'];
    discount = json['discount'];
    isActive = json['is_active'];
    if (json['line_items'] != null) {
      lineItems = <LineItems>[];
      json['line_items'].forEach((v) {
        lineItems!.add(new LineItems.fromJson(v));
      });
    }
    grossAmount = json['gross_amount'];
    orderedAt = json['ordered_at'];
    warehouse = json['warehouse'];
    invoiceGeneratedAt = json['invoice_generated_at'];
    netAmount = json['net_amount'];
    totalVat = json['total_vat'];
    id = json['id'];
    vendorRef = json['vendor_ref'];
    vat = json['vat'];
    additionalFee = json['additional_fee'];
    vendor = json['vendor'];
    totalDiscount = json['total_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['final_amount'] = this.finalAmount;
    data['status'] = this.status;
    data['expected_delivery_at'] = this.expectedDeliveryAt;
    data['total_product_price'] = this.totalProductPrice;
    data['note'] = this.note;
    data['delivered_at'] = this.deliveredAt;
    data['delivery_fee'] = this.deliveryFee;
    data['discount'] = this.discount;
    data['is_active'] = this.isActive;
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems!.map((v) => v.toJson()).toList();
    }
    data['gross_amount'] = this.grossAmount;
    data['ordered_at'] = this.orderedAt;
    data['warehouse'] = this.warehouse;
    data['invoice_generated_at'] = this.invoiceGeneratedAt;
    data['net_amount'] = this.netAmount;
    data['total_vat'] = this.totalVat;
    data['id'] = this.id;
    data['vendor_ref'] = this.vendorRef;
    data['vat'] = this.vat;
    data['additional_fee'] = this.additionalFee;
    data['vendor'] = this.vendor;
    data['total_discount'] = this.totalDiscount;
    return data;
  }
}

class LineItems {
  int? quantity;
  String? discount;
  int? cumulativeQuantity;
  int? id;
  String? unitPrice;
  String? movingAveragePrice;
  String? vat;
  String? totalPrice;
  String? finalPrice;
  int? product;

  LineItems(
      {this.quantity,
      this.discount,
      this.cumulativeQuantity,
      this.id,
      this.unitPrice,
      this.movingAveragePrice,
      this.vat,
      this.totalPrice,
      this.finalPrice,
      this.product});

  LineItems.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    discount = json['discount'];
    cumulativeQuantity = json['cumulative_quantity'];
    id = json['id'];
    unitPrice = json['unit_price'];
    movingAveragePrice = json['moving_average_price'];
    vat = json['vat'];
    totalPrice = json['total_price'];
    finalPrice = json['final_price'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['discount'] = this.discount;
    data['cumulative_quantity'] = this.cumulativeQuantity;
    data['id'] = this.id;
    data['unit_price'] = this.unitPrice;
    data['moving_average_price'] = this.movingAveragePrice;
    data['vat'] = this.vat;
    data['total_price'] = this.totalPrice;
    data['final_price'] = this.finalPrice;
    data['product'] = this.product;
    return data;
  }
}
