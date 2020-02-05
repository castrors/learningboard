import 'package:firebase/firestore.dart';
import 'package:learningboard/core/enums/content_type.dart';

class Content {
  String id;
  String title;
  String description;
  String link;
  ContentType contentType;
  int votes;

  Content(
      {this.title,
      this.description,
      this.link,
      this.contentType = ContentType.Learn,
      this.votes});

  Content.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    title = snapshot.get('title');
    description = snapshot.get('description');
    link = snapshot.get('link');
    contentType = ContentType.values[snapshot.get('content_type')];
    votes = snapshot.get('votes');
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'link': link,
        'content_type': contentType.index,
        'votes': votes,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Content &&
          runtimeType == other.runtimeType &&
          title == other.title;

  @override
  int get hashCode => title.hashCode;

  String get showContentType =>
      contentType == ContentType.Learn ? 'Quero aprender' : 'Quero ensinar';
}
