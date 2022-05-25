// ignore_for_file: non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'adaboost.dart';
import 'dtr.dart';
import 'svr.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

TextEditingController ipfield = TextEditingController();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Balu',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const bodypage(),
    );
  }
}

class bodypage extends StatefulWidget {
  const bodypage({Key? key}) : super(key: key);

  @override
  State<bodypage> createState() => _bodypageState();
}

class _bodypageState extends State<bodypage> {
  late Future<datadtr> futureAlbumdtr;
  late Future<datasvr> futureAlbumsvr;
  late Future<dataadaboost> futureAlbumadaboost;

  void initState() {
    super.initState();
    futureAlbumdtr = fetchAlbumDtr();
    futureAlbumsvr = fetchAlbumSvr();
    futureAlbumadaboost = fetchAlbumAdaboost();
  }
  //

  final bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BP - Estimation'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              TextField(
                controller: ipfield,
                decoration: const InputDecoration(
                  // errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  border: OutlineInputBorder(),
                  labelText: 'Enter Your IP',
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _launchUrl_dtr();
                      },
                      child: const Text("DTR-Load")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: FutureBuilder<datadtr>(
                                      future: futureAlbumdtr,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  "dtr - SBP Data: ${snapshot.data!.data1}",
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              ListTile(
                                                title: Text(
                                                    "dtr - DBP Data: ${snapshot.data!.data2}",
                                                    style: const TextStyle(
                                                        fontSize: 20)),
                                              ),
                                            ],
                                          );
                                        } else if (snapshot.hasError) {
                                          return Text('${snapshot.error}');
                                        }

                                        return const Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ));
                        });
                      },
                      child: const Text("DTR-Show")),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _launchUrl_svr();
                      },
                      child: const Text("SVR-Load")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: FutureBuilder<datasvr>(
                                      future: futureAlbumsvr,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  "svr - SBP Data: ${snapshot.data!.data1}",
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              ListTile(
                                                title: Text(
                                                    "svr - DBP Data: ${snapshot.data!.data2}",
                                                    style: const TextStyle(
                                                        fontSize: 20)),
                                              ),
                                            ],
                                          );
                                        } else if (snapshot.hasError) {
                                          return Text('${snapshot.error}');
                                        }

                                        return const Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ));
                        });
                      },
                      child: const Text("SVR-Show")),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _launchUrl_adaboost();
                      },
                      child: const Text("Adaboost-Load")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: FutureBuilder<dataadaboost>(
                                      future: futureAlbumadaboost,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  "Adaboost - SBP Data: ${snapshot.data!.data1}",
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              ListTile(
                                                title: Text(
                                                    "Adaboost - DBP Data: ${snapshot.data!.data2}",
                                                    style: const TextStyle(
                                                        fontSize: 20)),
                                              ),
                                            ],
                                          );
                                        } else if (snapshot.hasError) {
                                          return Text('${snapshot.error}');
                                        }

                                        return const Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ));
                        });
                      },
                      child: const Text("Adaboost-Show")),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}

// -----------------
//
final Uri _dtr = Uri.parse('http://${ipfield.text}/dtr');

void _launchUrl_dtr() async {
  if (!await launchUrl(_dtr, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $_dtr';
  }
}
// -----------------
//

final Uri _svr = Uri.parse('http://${ipfield.text}/svr');

void _launchUrl_svr() async {
  if (!await launchUrl(_svr, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $_svr';
  }
}

// -----------------
//
final Uri _adaboost = Uri.parse('http://${ipfield.text}/adaboost');

void _launchUrl_adaboost() async {
  if (!await launchUrl(_adaboost, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $_adaboost';
  }
}

// -----------------


