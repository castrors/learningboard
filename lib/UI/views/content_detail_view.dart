import 'package:flutter/material.dart';
import 'package:learningboard/core/enums/content_type.dart';
import 'package:learningboard/core/models/content.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;

class ContentDetailView extends StatefulWidget {
  @override
  _ContentDetailViewState createState() => _ContentDetailViewState();
}

class _ContentDetailViewState extends State<ContentDetailView> {
  Content content = Content();
  bool _isLearn = true;

  @override
  Widget build(BuildContext context) {
    final fs.Firestore firestore = fb.firestore();
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar conteúdo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Título'),
              onChanged: (title) {
                content.title = title;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Descrição'),
              onChanged: (description) {
                content.description = description;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Link'),
              onChanged: (link) {
                content.link = link;
              },
            ),
            SwitchListTile(
              value: _isLearn,
              onChanged: (isLearn) {
                setState(() {
                  _isLearn = isLearn;
                  content.contentType =
                      isLearn ? ContentType.Learn : ContentType.Teach;
                });
              },
              title: Text(content.showContentType),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          firestore.collection('contents').add(content.toJson());
          Navigator.pop(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
