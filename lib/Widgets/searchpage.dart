import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final List<String> trekkingList;
  const SearchPage({Key? key, required this.trekkingList}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<String> filteredTrekkingList;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredTrekkingList = widget.trekkingList;
  }

  void _filterTrekkingList(String query) {
    setState(() {
      filteredTrekkingList = widget.trekkingList
          .where((trek) => trek.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _filterTrekkingList(value);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search for a trekking destination',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTrekkingList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredTrekkingList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
