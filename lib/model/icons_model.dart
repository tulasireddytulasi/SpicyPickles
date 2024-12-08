// To parse this JSON data, do
//
//     final pickleIconsModel = pickleIconsModelFromJson(jsonString);

import 'dart:convert';

PickleIconsModel pickleIconsModelFromJson(String str) => PickleIconsModel.fromJson(json.decode(str));

String pickleIconsModelToJson(PickleIconsModel data) => json.encode(data.toJson());

class PickleIconsModel {
  List<PickleIcon>? pickleIcons;

  PickleIconsModel({
    this.pickleIcons,
  });

  factory PickleIconsModel.fromJson(Map<String, dynamic> json) => PickleIconsModel(
    pickleIcons: json["pickleIcons"] == null ? [] : List<PickleIcon>.from(json["pickleIcons"]!.map((x) => PickleIcon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pickleIcons": pickleIcons == null ? [] : List<dynamic>.from(pickleIcons!.map((x) => x.toJson())),
  };
}

class PickleIcon {
  String? imgUrl;
  String? title;

  PickleIcon({
    this.imgUrl,
    this.title,
  });

  factory PickleIcon.fromJson(Map<String, dynamic> json) => PickleIcon(
    imgUrl: json["imgUrl"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "imgUrl": imgUrl,
    "title": title,
  };
}
