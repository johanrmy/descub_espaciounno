import 'dart:convert';

Coupon couponFromJson(String str) => Coupon.fromJson(json.decode(str));

String couponToJson(Coupon data) => json.encode(data.toJson());

class Coupon {
  String id;
  String discount;
  bool status;
  String couponGenerateId;
  CouponGenerate couponGenerate;

  Coupon({
    required this.id,
    required this.discount,
    required this.status,
    required this.couponGenerateId,
    required this.couponGenerate,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    id: json["id"],
    discount: json["discount"],
    status: json["status"],
    couponGenerateId: json["coupon_generate_id"],
    couponGenerate: CouponGenerate.fromJson(json["coupon_generate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "discount": discount,
    "status": status,
    "coupon_generate_id": couponGenerateId,
    "COUPON_GENERATE": couponGenerate.toJson(),
  };
}

class CouponGenerate {
  DateTime validUntil;

  CouponGenerate({
    required this.validUntil,
  });

  factory CouponGenerate.fromJson(Map<String, dynamic> json) => CouponGenerate(
    validUntil: DateTime.parse(json["valid_until"]),
  );

  Map<String, dynamic> toJson() => {
    "valid_until": formatDate(validUntil),
  };

  String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
