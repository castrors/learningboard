import 'package:flutter/material.dart';
import 'package:learningboard/UI/views/base_view.dart';
import 'package:learningboard/UI/views/content_detail_view.dart';
import 'package:learningboard/UI/widgets/content_list.dart';
import 'package:learningboard/core/enums/view_state.dart';
import 'package:learningboard/core/viewmodels/content_model.dart';

class ContentListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ContentModel>(
      onModelReady: (model) => model.getContent(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('LearningBoard'),
        ),
        body: model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : ContentList(model.contents),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContentDetailView()),
            );
          },
        ),
      ),
    );
  }
}
