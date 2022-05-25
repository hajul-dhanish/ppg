import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

String DTR = "https://628db335a339dfef879ebd51.mockapi.io/Dtr/1";

Future<datadtr> fetchAlbumDtr() async {
  final response = await http.get(Uri.parse(DTR));

  if (response.statusCode == 200) {
    return datadtr.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class datadtr {
  final String data1;
  final String data2;

  const datadtr({
    required this.data1,
    required this.data2,
  });

  factory datadtr.fromJson(Map<String, dynamic> json) {
    return datadtr(data1: json['dtr-SBP'], data2: json["dtr-DBP"]);
  }
}
