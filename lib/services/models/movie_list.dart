// To parse this JSON data, do
//
//     final searchList = searchListFromJson(jsonString);

import 'dart:convert';

SearchList searchListFromJson(String str) => SearchList.fromJson(json.decode(str));

String searchListToJson(SearchList data) => json.encode(data.toJson());

class SearchList {
    List<Search> search;
    String totalResults;
    String response;

    SearchList({
        required this.search,
        required this.totalResults,
        required this.response,
    });

    factory SearchList.fromJson(Map<String, dynamic> json) => SearchList(
        search: List<Search>.from(json["Search"].map((x) => Search.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
    );

    Map<String, dynamic> toJson() => {
        "Search": List<dynamic>.from(search.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
    };
}

class Search {
    String title;
    String year;
    String imdbId;
    String type;
    String poster;

    Search({
        required this.title,
        required this.year,
        required this.imdbId,
        required this.type,
        required this.poster,
    });

    factory Search.fromJson(Map<String, dynamic> json) => Search(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: json["Type"],
        poster: json["Poster"],
    );

    Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": type,
        "Poster": poster,
    };
}
