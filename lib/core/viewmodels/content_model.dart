import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' ;
import 'package:learningboard/core/enums/view_state.dart';
import 'package:learningboard/core/models/content.dart';
import 'package:learningboard/core/viewmodels/base_model.dart';

class ContentModel extends BaseModel {
  final Firestore firestore = fb.firestore();

  List<Content> _contents;

  List<Content> get contents {
    return _contents;
  }

  void getContent() async {
    applyState(ViewState.Busy);
    _contents = await firestore
        .collection('contents')
        .orderBy('votes', 'desc')
        .get()
        .then((data) => data.docs.map((doc) => Content.fromDocumentSnapshot(doc)).toList());
    applyState(ViewState.Idle);
  }

  addContent(Content content) {
    applyState(ViewState.Busy);
    firestore.collection('contents').add(content.toJson());
    applyState(ViewState.Idle);
  }
}
