import 'package:flutter/cupertino.dart';

import '../global/alert_viewmodel.dart';

class CategoryViewModel extends AlertViewModel {
  final TextEditingController _textController = TextEditingController();
  get textController => _textController;

  void updateCategoryName(company) {
    textController.text;
  }

}