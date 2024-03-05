import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tripvisormajor/Widgets/offersection/offersection1.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection2.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection3.dart';
import 'dart:convert';
import 'package:tripvisormajor/backend/urlapi.dart';

class PackagesPage extends StatefulWidget {
  const PackagesPage({super.key});

  @override
  State<PackagesPage> createState() => _PackagesPageState();
}

class _PackagesPageState extends State<PackagesPage> {
  //

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //add all data to the listview.builder
      body: SingleChildScrollView(
        child: Column(
          children: [OfferSection2(title: ''), OfferSection3(title: '')],
        ),
      ),
    );
  }
}
