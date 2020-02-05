import 'package:flutter/material.dart';
import 'package:learningboard/core/models/content.dart';

class ContentColumn extends StatelessWidget {
  final String title;
  final List<Content> contents;

  const ContentColumn({this.title, this.contents});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(title),
          Expanded(
            child: ListView.builder(
              itemCount: contents.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(contents[index].title),
                  subtitle: Text(contents[index].description),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
