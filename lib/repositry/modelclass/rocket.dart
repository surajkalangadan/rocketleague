class Rocketmodel {
  Rocketmodel({
      this.ranks, 
      this.reward,});

  Rocketmodel.fromJson(dynamic json) {
    if (json['ranks'] != null) {
      ranks = [];
      json['ranks'].forEach((v) {
        ranks?.add(Ranks.fromJson(v));
      });
    }
    reward = json['reward'] != null ? Reward.fromJson(json['reward']) : null;
  }
  List<Ranks>? ranks;
  Reward? reward;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (ranks != null) {
      map['ranks'] = ranks?.map((v) => v.toJson()).toList();
    }
    if (reward != null) {
      map['reward'] = reward?.toJson();
    }
    return map;
  }

}

class Reward {
  Reward({
      this.progress, 
      this.level,});

  Reward.fromJson(dynamic json) {
    progress = json['progress'];
    level = json['level'];
  }
  int? progress;
  String? level;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['progress'] = progress;
    map['level'] = level;
    return map;
  }

}

class Ranks {
  Ranks({
      this.division, 
      this.played, 
      this.rank, 
      this.playlist, 
      this.mmr, 
      this.streak,});

  Ranks.fromJson(dynamic json) {
    division = json['division'];
    played = json['played'];
    rank = json['rank'];
    playlist = json['playlist'];
    mmr = json['mmr'];
    streak = json['streak'];
  }
  dynamic division;
  dynamic played;
  dynamic rank;
  dynamic playlist;
  dynamic mmr;
  dynamic streak;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['division'] = division;
    map['played'] = played;
    map['rank'] = rank;
    map['playlist'] = playlist;
    map['mmr'] = mmr;
    map['streak'] = streak;
    return map;
  }

}