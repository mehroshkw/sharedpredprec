import 'dart:convert';

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.word,
    this.phonetic,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
  });

  String? word;
  String? phonetic;
  List<Phonetic>? phonetics;
  List<Meaning>? meanings;
  License? license;
  List<String>? sourceUrls;

  factory User.fromJson(Map<String, dynamic> json) => User(
        word: json["word"],
        phonetic: json["phonetic"],
        phonetics: List<Phonetic>.from(
            json["phonetics"].map((x) => Phonetic.fromJson(x))),
        meanings: List<Meaning>.from(
            json["meanings"].map((x) => Meaning.fromJson(x))),
        license: License.fromJson(json["license"]),
        sourceUrls: List<String>.from(json["sourceUrls"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "phonetic": phonetic,
        "phonetics": List<dynamic>.from(phonetics!.map((x) => x.toJson())),
        "meanings": List<dynamic>.from(meanings!.map((x) => x.toJson())),
        "license": license!.toJson(),
        "sourceUrls": List<dynamic>.from(sourceUrls!.map((x) => x)),
      };
}

class License {
  License({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory License.fromJson(Map<String, dynamic> json) => License(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Meaning {
  Meaning({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  String? partOfSpeech;
  List<Definition>? definitions;
  List<String>? synonyms;
  List<dynamic>? antonyms;

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"],
        definitions: List<Definition>.from(
            json["definitions"].map((x) => Definition.fromJson(x))),
        synonyms: List<String>.from(json["synonyms"].map((x) => x)),
        antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions": List<dynamic>.from(definitions!.map((x) => x.toJson())),
        "synonyms": List<dynamic>.from(synonyms!.map((x) => x)),
        "antonyms": List<dynamic>.from(antonyms!.map((x) => x)),
      };
}

class Definition {
  Definition({
    this.definition,
    this.synonyms,
    this.antonyms,
    this.example,
  });

  String? definition;
  List<String>? synonyms;
  List<dynamic>? antonyms;
  String? example;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json["definition"],
        synonyms: List<String>.from(json["synonyms"].map((x) => x)),
        antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
        example: json["example"] == null ? null : json["example"],
      );

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "synonyms": List<dynamic>.from(synonyms!.map((x) => x)),
        "antonyms": List<dynamic>.from(antonyms!.map((x) => x)),
        "example": example == null ? null : example,
      };
}

class Phonetic {
  Phonetic({
    this.text,
    this.audio,
    this.sourceUrl,
    this.license,
  });

  String? text;
  String? audio;
  String? sourceUrl;
  License? license;

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        text: json["text"],
        audio: json["audio"],
        sourceUrl: json["sourceUrl"] == null ? null : json["sourceUrl"],
        license:
            json["license"] == null ? null : License.fromJson(json["license"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "audio": audio,
        "sourceUrl": sourceUrl == null ? null : sourceUrl,
        "license": license == null ? null : license!.toJson(),
      };
}





// Response responseFromJson(String str) => Response.fromJson(json.decode(str));

// String responseToJson(Response data) => json.encode(data.toJson());

// class Response {
//     Response({
//         this.status,
//         this.data,
//     });

//     String? status;
//     Data? data;

//     factory Response.fromJson(Map<String, dynamic> json) => Response(
//         status: json["status"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": data!.toJson(),
//     };
// }

// class Data {
//     Data({
//         this.productId,
//         this.barcode,
//         this.pages,
//         this.title,
//         this.description,
//         this.slug,
//         this.sku,
//         this.image,
//         this.price,
//         this.salePrice,
//         this.instock,
//         this.usedPrice,
//         this.ocrCode,
//     });

//     int? productId;
//     String? barcode;
//     String? pages;
//     String? title;
//     String? description;
//     String? slug;
//     String? sku;
//     dynamic image;
//     int? price;
//     int? salePrice;
//     String? instock;
//     String? usedPrice;
//     String? ocrCode;

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         productId: json["product_id"],
//         barcode: json["barcode"],
//         pages: json["pages"],
//         title: json["title"],
//         description: json["description"],
//         slug: json["slug"],
//         sku: json["sku"],
//         image: json["image"],
//         price: json["price"],
//         salePrice: json["sale_price"],
//         instock: json["instock"],
//         usedPrice: json["used_price"],
//         ocrCode: json["ocr_code"],
//     );

//     Map<String, dynamic> toJson() => {
//         "product_id": productId,
//         "barcode": barcode,
//         "pages": pages,
//         "title": title,
//         "description": description,
//         "slug": slug,
//         "sku": sku,
//         "image": image,
//         "price": price,
//         "sale_price": salePrice,
//         "instock": instock,
//         "used_price": usedPrice,
//         "ocr_code": ocrCode,
//     };
// }

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

// import 'dart:convert';

// List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

// String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class User {
//     User({
//         this.id,
//         this.notifyType,
//         this.image,
//         this.description,
//         this.expiryDate,
//         this.status,
//     });

//     int? id;
//     String? notifyType;
//     String? image;
//     String? description;
//     DateTime? expiryDate;
//     String? status;

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         notifyType: json["notify_type"],
//         image: json["image"],
//         description: json["description"],
//         expiryDate: DateTime.parse(json["expiry_date"]),
//         status: json["status"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "notify_type": notifyType,
//         "image": image,
//         "description": description,
//         "expiry_date": expiryDate!.toIso8601String(),
//         "status": status,
//     };
// }
