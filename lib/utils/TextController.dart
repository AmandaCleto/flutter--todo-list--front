import 'package:flutter/material.dart';

class TextController extends TextEditingController {
  TextController({String text: ''}) {
    this.text = text;
  }

  set text(String newText) {
    value = value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
        composing: TextRange.empty);
  }
}
