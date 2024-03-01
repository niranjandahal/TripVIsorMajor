import 'package:flutter/material.dart';

class customsearchbar extends StatefulWidget {
  const customsearchbar({super.key});

  @override
  State<customsearchbar> createState() => _customsearchbarState();
}

class _customsearchbarState extends State<customsearchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.35,
      //glassmorphic searchbar
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 5,
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
      child: TextField(
        cursorColor: Colors.blue.withOpacity(0.5),
        cursorHeight: 5,
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search),
        ),
      ),

      //glassmorphic searchbar
    );
  }
}
