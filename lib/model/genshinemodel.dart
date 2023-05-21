import 'dart:convert';

import 'package:http/http.dart' as http;

class GiCharacter {
  Result? result;
  bool? success;
  String? creator;

  GiCharacter({this.result, this.success, this.creator});

  GiCharacter.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
    success = json['success'];
    creator = json['creator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['success'] = success;
    data['creator'] = creator;
    return data;
  }
  static Future<GiCharacter> fetchCharacter(String? query) async {
    GiCharacter result;
    final response = await http.get(Uri.parse('https://wibu-api.eu.org/api/game/gi/character?name=$query'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      result = GiCharacter.fromJson(data);
    }else {
        throw Exception('Failed to load character');
    }
    return result;
  }
}

class Result {
  String? name;
  String? title;
  String? vision;
  String? weapon;
  String? nation;
  String? affiliation;
  int? rarity;
  String? constellation;
  String? birthday;
  String? description;
  String? visionKey;
  String? weaponType;

  Result(
      {this.name,
      this.title,
      this.vision,
      this.weapon,
      this.nation,
      this.affiliation,
      this.rarity,
      this.constellation,
      this.birthday,
      this.description,
      this.visionKey,
      this.weaponType});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      name : json['name'],
      title : json['title'],
      vision : json['vision'],
      weapon : json['weapon'],
      nation : json['nation'],
      affiliation : json['affiliation'],
      rarity : json['rarity'],
      constellation : json['constellation'],
      birthday : json['birthday'],
      description : json['description'],
      visionKey : json['vision_key'],
      weaponType : json['weapon_type'],
    );
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['title'] = title;
    data['vision'] = vision;
    data['weapon'] = weapon;
    data['nation'] = nation;
    data['affiliation'] = affiliation;
    data['rarity'] = rarity;
    data['constellation'] = constellation;
    data['birthday'] = birthday;
    data['description'] = description;
    data['vision_key'] = visionKey;
    data['weapon_type'] = weaponType;
    return data;
  }
}

class SkillTalents {
  String? name;
  String? unlock;
  String? description;
  List<Upgrades>? upgrades;
  String? type;

  SkillTalents(
      {this.name, this.unlock, this.description, this.upgrades, this.type});

  SkillTalents.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    unlock = json['unlock'];
    description = json['description'];
    if (json['upgrades'] != null) {
      upgrades = <Upgrades>[];
      json['upgrades'].forEach((v) {
        upgrades!.add(Upgrades.fromJson(v));
      });
    }
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['unlock'] = unlock;
    data['description'] = description;
    if (upgrades != null) {
      data['upgrades'] = upgrades!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    return data;
  }
}

class Upgrades {
  String? name;
  String? value;

  Upgrades({this.name, this.value});

  Upgrades.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}

class PassiveTalents {
  String? name;
  String? unlock;
  String? description;
  int? level;

  PassiveTalents({this.name, this.unlock, this.description, this.level});

  PassiveTalents.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    unlock = json['unlock'];
    description = json['description'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['unlock'] = unlock;
    data['description'] = description;
    data['level'] = level;
    return data;
  }
}
