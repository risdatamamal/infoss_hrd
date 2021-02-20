import 'dart:convert';

List<ModelAllDataInbox> modelAllDataInboxFromJson(String str) =>
    new List<ModelAllDataInbox>.from(
        json.decode(str).map((x) => ModelAllDataInbox.fromJson(x)));
String modelAllDataInboxToJson(List<ModelAllDataInbox> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class ModelAllDataInbox {
  String id, photo, namaPengirim, isi, date;

  ModelAllDataInbox(
      {this.id, this.photo, this.namaPengirim, this.isi, this.date});

  factory ModelAllDataInbox.fromJson(Map<String, dynamic> json) =>
      new ModelAllDataInbox(
        id: json["id"],
        photo: json["photo"],
        namaPengirim: json["nama"],
        isi: json["isi"],
        date: json["tanggal"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "nama": namaPengirim,
        "isi": isi,
        "tanggal": date,
      };
}
