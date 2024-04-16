class IpApi {
  String instancia;
  String id;
  String url;

  IpApi({
    required this.instancia,
    required this.id,
    required this.url,
  });

  factory IpApi.fromJson(Map<String, dynamic> json) => IpApi(
    instancia: json["instancia"],
    id: json["id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "instancia": instancia,
    "id": id,
    "url": url,
  };
}
