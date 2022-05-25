import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

String svrr = "https://628db335a339dfef879ebd51.mockapi.io/Svr/1";

Future<datasvr> fetchAlbumSvr() async {
  final response = await http.get(Uri.parse(svrr));

  if (response.statusCode == 200) {
    return datasvr.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class datasvr {
  final String data1;
  final String data2;

  const datasvr({
    required this.data1,
    required this.data2,
  });

  factory datasvr.fromJson(Map<String, dynamic> json) {
    return datasvr(data1: json['svr_SBP'], data2: json["svr_DBP"]);
  }
}
