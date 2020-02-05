import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as Firebase;
import 'package:learningboard/UI/views/content_list_view.dart';
import 'package:learningboard/helpers/dependency_injection.dart';

void main() {
  if (Firebase.apps.isEmpty) {
    print(Firebase.apps);
    Firebase.initializeApp(
      apiKey: '${{secrets.apiKey}}',
      authDomain: '${{secrets.authDomain}}',
      databaseURL: '${{secrets.databaseURL}}',
      projectId: '${{secrets.projectId}}',
      storageBucket: '${{secrets.storageBucket}}',
      messagingSenderId: '${{secrets.messagingSenderId}}',
      appId: '${{secrets.appId}}',
      measurementId: '${{secrets.measurementId}}',
    );
  }
  setupDependencyInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContentListView(),
    );
  }
}
