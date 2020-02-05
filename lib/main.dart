import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as Firebase;
import 'package:learningboard/UI/views/content_list_view.dart';
import 'package:learningboard/helpers/dependency_injection.dart';

void main() {
  if (Firebase.apps.isEmpty) {
    print(Firebase.apps);
    Firebase.initializeApp(
      apiKey: "AIzaSyANeZj_oNVh4lQ_aTkful3XP6wrwshQuig",
      authDomain: "personalbudgetworkshop.firebaseapp.com",
      databaseURL: "https://personalbudgetworkshop.firebaseio.com",
      projectId: "personalbudgetworkshop",
      storageBucket: "personalbudgetworkshop.appspot.com",
      messagingSenderId: "539443181051",
      appId: "1:539443181051:web:4adc6c3927d2b9e72c475e",
      measurementId: "G-85NTBWFE4X",
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
