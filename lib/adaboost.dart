import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

String adaboostt = "https://628db335a339dfef879ebd51.mockapi.io/Adaboost/1";

Future<dataadaboost> fetchAlbumAdaboost() async {
  final response = await http.get(Uri.parse(adaboostt));

  if (response.statusCode == 200) {
    return dataadaboost.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class dataadaboost {
  final String data1;
  final String data2;

  const dataadaboost({
    required this.data1,
    required this.data2,
  });

  factory dataadaboost.fromJson(Map<String, dynamic> json) {
    return dataadaboost(data1: json['abr_SBP'], data2: json["abr_DBP"]);
  }
}
