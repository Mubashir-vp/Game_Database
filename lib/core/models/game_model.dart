// To parse this JSON data, do
//
//     final gameModel = gameModelFromJson(jsonString);

import 'dart:convert';

List<GameModel> gameModelFromJson(String str) => List<GameModel>.from(json.decode(str).map((x) => GameModel.fromJson(x)));

String gameModelToJson(List<GameModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GameModel {
    GameModel({
        this.id,
        this.category,
        this.createdAt,
        this.externalGames,
        this.firstReleaseDate,
        this.genres,
        this.name,
        this.platforms,
        this.releaseDates,
        this.similarGames,
        this.slug,
        this.summary,
        this.tags,
        this.updatedAt,
        this.url,
        this.checksum,
        this.ageRatings,
        this.cover,
        this.involvedCompanies,
        this.screenshots,
        this.gameModes,
        this.playerPerspectives,
        this.themes,
        this.websites,
        this.alternativeNames,
        this.artworks,
        this.gameEngines,
        this.keywords,
        this.status,
    });

    int? id;
    int? category;
    int? createdAt;
    List<int?>? externalGames;
    int? firstReleaseDate;
    List<int?>? genres;
    String? name;
    List<int?>? platforms;
    List<int?>? releaseDates;
    List<int?>? similarGames;
    String ?slug;
    String ?summary;
    List<int>? tags;
    int? updatedAt;
    String? url;
    String? checksum;
    List<int> ?ageRatings;
    int? cover;
    List<int?>? involvedCompanies;
    List<int?>? screenshots;
    List<int?>? gameModes;
    List<int?>? playerPerspectives;
    List<int?>? themes;
    List<int?>? websites;
    List<int?>? alternativeNames;
    List<int?>? artworks;
    List<int?>? gameEngines;
    List<int?>? keywords;
    int? status;

    factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        id: json["id"],
        category: json["category"],
        createdAt: json["created_at"],
        externalGames: List<int>.from(json["external_games"].map((x) => x)),
        firstReleaseDate: json["first_release_date"] == null ? null : json["first_release_date"],
        genres: json["genres"] == null ? null : List<int>.from(json["genres"].map((x) => x)),
        name: json["name"],
        platforms: json["platforms"] == null ? null : List<int>.from(json["platforms"].map((x) => x)),
        releaseDates: json["release_dates"] == null ? null : List<int>.from(json["release_dates"].map((x) => x)),
        similarGames: json["similar_games"] == null ? null : List<int>.from(json["similar_games"].map((x) => x)),
        slug: json["slug"],
        summary: json["summary"] == null ? null : json["summary"],
        tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((x) => x)),
        updatedAt: json["updated_at"],
        url: json["url"],
        checksum: json["checksum"],
        ageRatings: json["age_ratings"] == null ? null : List<int>.from(json["age_ratings"].map((x) => x)),
        cover: json["cover"] == null ? null : json["cover"],
        involvedCompanies: json["involved_companies"] == null ? null : List<int>.from(json["involved_companies"].map((x) => x)),
        screenshots: json["screenshots"] == null ? null : List<int>.from(json["screenshots"].map((x) => x)),
        gameModes: json["game_modes"] == null ? null : List<int>.from(json["game_modes"].map((x) => x)),
        playerPerspectives: json["player_perspectives"] == null ? null : List<int>.from(json["player_perspectives"].map((x) => x)),
        themes: json["themes"] == null ? null : List<int>.from(json["themes"].map((x) => x)),
        websites: json["websites"] == null ? null : List<int>.from(json["websites"].map((x) => x)),
        alternativeNames: json["alternative_names"] == null ? null : List<int>.from(json["alternative_names"].map((x) => x)),
        artworks: json["artworks"] == null ? null : List<int>.from(json["artworks"].map((x) => x)),
        gameEngines: json["game_engines"] == null ? null : List<int>.from(json["game_engines"].map((x) => x)),
        keywords: json["keywords"] == null ? null : List<int>.from(json["keywords"].map((x) => x)),
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "created_at": createdAt,
        "external_games": List<dynamic>.from(externalGames!.map((x) => x)),
        "first_release_date": firstReleaseDate == null ? null : firstReleaseDate,
        "genres": genres == null ? null : List<dynamic>.from(genres!.map((x) => x)),
        "name": name,
        "platforms": platforms == null ? null : List<dynamic>.from(platforms!.map((x) => x)),
        "release_dates": releaseDates == null ? null : List<dynamic>.from(releaseDates!.map((x) => x)),
        "similar_games": similarGames == null ? null : List<dynamic>.from(similarGames!.map((x) => x)),
        "slug": slug,
        "summary": summary == null ? null : summary,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "updated_at": updatedAt,
        "url": url,
        "checksum": checksum,
        "age_ratings": ageRatings == null ? null : List<dynamic>.from(ageRatings!.map((x) => x)),
        "cover": cover == null ? null : cover,
        "involved_companies": involvedCompanies == null ? null : List<dynamic>.from(involvedCompanies!.map((x) => x)),
        "screenshots": screenshots == null ? null : List<dynamic>.from(screenshots!.map((x) => x)),
        "game_modes": gameModes == null ? null : List<dynamic>.from(gameModes!.map((x) => x)),
        "player_perspectives": playerPerspectives == null ? null : List<dynamic>.from(playerPerspectives!.map((x) => x)),
        "themes": themes == null ? null : List<dynamic>.from(themes!.map((x) => x)),
        "websites": websites == null ? null : List<dynamic>.from(websites!.map((x) => x)),
        "alternative_names": alternativeNames == null ? null : List<dynamic>.from(alternativeNames!.map((x) => x)),
        "artworks": artworks == null ? null : List<dynamic>.from(artworks!.map((x) => x)),
        "game_engines": gameEngines == null ? null : List<dynamic>.from(gameEngines!.map((x) => x)),
        "keywords": keywords == null ? null : List<dynamic>.from(keywords!.map((x) => x)),
        "status": status == null ? null : status,
    };
}
