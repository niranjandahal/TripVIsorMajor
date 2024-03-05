import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripvisormajor/Widgets/searchpage.dart';

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
        onSubmitted: (value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchPage(trekkingList: [
                        'Annapurna Base Camp',
                        'Everest Base Camp',
                        'Langtang Valley',
                        'Manaslu Circuit',
                        'Upper Mustang',
                      ])));
        },
        cursorColor: Colors.black,
        cursorHeight: 23,
        cursorWidth: 1.2,
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
