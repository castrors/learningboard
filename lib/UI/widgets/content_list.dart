import 'package:flutter/material.dart';
import 'package:learningboard/UI/widgets/content_column.dart';
import 'package:learningboard/core/enums/content_type.dart';
import 'package:learningboard/core/models/content.dart';

class ContentList extends StatelessWidget {
  const ContentList(this.contents);

  final List<Content> contents;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ContentColumn(
          title: 'Quero aprender',
          contents: contents
              .where((content) => content.contentType == ContentType.Learn)
              .toList(),
        ),
        ContentColumn(
          title: 'Quero ensinar',
          contents: contents
              .where((content) => content.contentType == ContentType.Teach)
              .toList(),
        ),
      ],
    );
  }
}
