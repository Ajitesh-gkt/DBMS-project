import 'dart:convert';

data dataFromJson(String str) => data.fromJson(json.decode(str));

String dataToJson(data data) => json.encode(data.toJson());

class data {
    data({
        required this.image,
        required this.model,
        required this.rent,
    });

    String image;
    String model;
    int rent;

    factory data.fromJson(Map<String, dynamic> json) => data(
        image: json["image"],
        model: json["model"],
        rent: json["rent"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "model": model,
        "rent": rent,
    };
}
