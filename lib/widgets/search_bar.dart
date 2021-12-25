import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String title;
  final Function(String) onQueryChanged;

  SearchBar({this.title,this.onQueryChanged});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey)),
      child: TextField(
        cursorColor: Colors.grey,
        onChanged: onQueryChanged,
        decoration: InputDecoration(
          icon: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Icon(Icons.search,color: Colors.black,)
          ),
          hintText: 'Search $title',
          hintStyle: TextStyle(
              color: Colors.grey
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
