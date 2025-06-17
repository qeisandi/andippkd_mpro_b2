// ignore_for_file: constant_identifier_names
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

class Welcome {
  List<Anime>? data;

  Welcome({this.data});

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    data:
        json["data"] == null
            ? []
            : List<Anime>.from(json["data"].map((x) => Anime.fromJson(x))),
  );
}

class Anime {
  int? malId;
  String? url;
  Map<String, Image>? images;
  Trailer? trailer;
  bool? approved;
  List<Title>? titles;
  String? title;
  String? titleEnglish;
  String? titleJapanese;
  List<String>? titleSynonyms;
  DatumType? type;
  Source? source;
  int? episodes;
  Status? status;
  bool? airing;
  Aired? aired;
  String? duration;
  Rating? rating;
  double? score;
  int? scoredBy;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  String? background;
  Season? season;
  int? year;
  Broadcast? broadcast;
  List<Demographic>? producers;
  List<Demographic>? licensors;
  List<Demographic>? studios;
  List<Demographic>? genres;
  List<dynamic>? explicitGenres;
  List<Demographic>? themes;
  List<Demographic>? demographics;

  Anime({
    this.malId,
    this.url,
    this.images,
    this.trailer,
    this.approved,
    this.titles,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.explicitGenres,
    this.themes,
    this.demographics,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
    malId: json["mal_id"],
    url: json["url"],
    images:
        json["images"] == null
            ? null
            : Map.from(
              json["images"],
            ).map((k, v) => MapEntry(k, Image.fromJson(v))),
    trailer: json["trailer"] == null ? null : Trailer.fromJson(json["trailer"]),
    approved: json["approved"],
    titles:
        json["titles"] == null
            ? []
            : List<Title>.from(json["titles"].map((x) => Title.fromJson(x))),
    title: json["title"],
    titleEnglish: json["title_english"],
    titleJapanese: json["title_japanese"],
    titleSynonyms:
        json["title_synonyms"] == null
            ? []
            : List<String>.from(json["title_synonyms"]),
    type: datumTypeValues.map[json["type"]],
    source: sourceValues.map[json["source"]],
    episodes: json["episodes"],
    status: statusValues.map[json["status"]],
    airing: json["airing"],
    aired: json["aired"] == null ? null : Aired.fromJson(json["aired"]),
    duration: json["duration"],
    rating: ratingValues.map[json["rating"]],
    score: json["score"]?.toDouble(),
    scoredBy: json["scored_by"],
    rank: json["rank"],
    popularity: json["popularity"],
    members: json["members"],
    favorites: json["favorites"],
    synopsis: json["synopsis"],
    background: json["background"],
    season: seasonValues.map[json["season"]],
    year: json["year"],
    broadcast:
        json["broadcast"] == null
            ? null
            : Broadcast.fromJson(json["broadcast"]),
    producers:
        json["producers"] == null
            ? []
            : List<Demographic>.from(
              json["producers"].map((x) => Demographic.fromJson(x)),
            ),
    licensors:
        json["licensors"] == null
            ? []
            : List<Demographic>.from(
              json["licensors"].map((x) => Demographic.fromJson(x)),
            ),
    studios:
        json["studios"] == null
            ? []
            : List<Demographic>.from(
              json["studios"].map((x) => Demographic.fromJson(x)),
            ),
    genres:
        json["genres"] == null
            ? []
            : List<Demographic>.from(
              json["genres"].map((x) => Demographic.fromJson(x)),
            ),
    explicitGenres:
        json["explicit_genres"] == null
            ? []
            : List<dynamic>.from(json["explicit_genres"]),
    themes:
        json["themes"] == null
            ? []
            : List<Demographic>.from(
              json["themes"].map((x) => Demographic.fromJson(x)),
            ),
    demographics:
        json["demographics"] == null
            ? []
            : List<Demographic>.from(
              json["demographics"].map((x) => Demographic.fromJson(x)),
            ),
  );
}

class Aired {
  String? from;
  String? to;

  Aired({this.from, this.to});

  factory Aired.fromJson(Map<String, dynamic> json) =>
      Aired(from: json["from"], to: json["to"]);
}

class Broadcast {
  String? day;
  String? time;
  Timezone? timezone;
  String? string;

  Broadcast({this.day, this.time, this.timezone, this.string});

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
    day: json["day"],
    time: json["time"],
    timezone: timezoneValues.map[json["timezone"]],
    string: json["string"],
  );
}

class Demographic {
  int? malId;
  String? type;
  String? name;
  String? url;

  Demographic({this.malId, this.type, this.name, this.url});

  factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
    malId: json["mal_id"],
    type: json["type"],
    name: json["name"],
    url: json["url"],
  );
}

class Image {
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  Image({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    imageUrl: json["image_url"],
    smallImageUrl: json["small_image_url"],
    largeImageUrl: json["large_image_url"],
  );
}

class Title {
  String? type;
  String? title;

  Title({this.type, this.title});

  factory Title.fromJson(Map<String, dynamic> json) =>
      Title(type: json["type"], title: json["title"]);
}

class Trailer {
  String? url;
  String? embedUrl;

  Trailer({this.url, this.embedUrl});

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      Trailer(url: json["url"], embedUrl: json["embed_url"]);
}

// ENUMS & Helpers

enum DatumType { TV, MOVIE, OVA, SPECIAL, ONA, MUSIC }

final datumTypeValues = EnumValues({
  "TV": DatumType.TV,
  "Movie": DatumType.MOVIE,
  "OVA": DatumType.OVA,
  "Special": DatumType.SPECIAL,
  "ONA": DatumType.ONA,
  "Music": DatumType.MUSIC,
});

enum Source { MANGA, ORIGINAL, LIGHT_NOVEL, GAME, NOVEL, OTHER, UNKNOWN }

final sourceValues = EnumValues({
  "Manga": Source.MANGA,
  "Original": Source.ORIGINAL,
  "Light novel": Source.LIGHT_NOVEL,
  "Game": Source.GAME,
  "Novel": Source.NOVEL,
  "Other": Source.OTHER,
  "Unknown": Source.UNKNOWN,
});

enum Status { FINISHED_AIRING, CURRENTLY_AIRING, NOT_YET_AIRED }

final statusValues = EnumValues({
  "Finished Airing": Status.FINISHED_AIRING,
  "Currently Airing": Status.CURRENTLY_AIRING,
  "Not yet aired": Status.NOT_YET_AIRED,
});

enum Rating { PG_13, R_17, G, R_PLUS, NC_17 }

final ratingValues = EnumValues({
  "PG-13 - Teens 13 or older": Rating.PG_13,
  "R - 17+ (violence & profanity)": Rating.R_17,
  "G - All Ages": Rating.G,
  "R+ - Mild Nudity": Rating.R_PLUS,
  "Rx - Hentai": Rating.NC_17,
});

enum Season { WINTER, SPRING, SUMMER, FALL }

final seasonValues = EnumValues({
  "Winter": Season.WINTER,
  "Spring": Season.SPRING,
  "Summer": Season.SUMMER,
  "Fall": Season.FALL,
});

enum Timezone { ASIA_TOKYO }

final timezoneValues = EnumValues({"Asia/Tokyo": Timezone.ASIA_TOKYO});

class EnumValues<T> {
  final Map<String, T> map;
  late final Map<T, String> reverseMap;

  EnumValues(this.map) {
    reverseMap = map.map((k, v) => MapEntry(v, k));
  }
}
