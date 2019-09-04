import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final _linkRegex = RegExp(
    r"(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)",
    caseSensitive: false);
final _tagRegex = RegExp(r"\B#\w*[a-zA-Z]+\w*", caseSensitive: false);

class HashtagText extends EditableText {
  HashtagText({
    Key key,
    FocusNode focusNode,
    TextEditingController controller,
    TextStyle style,
    int maxLines,
    ValueChanged<String> onChanged,
    ValueChanged<String> onSubmitted,
    Color cursorColor,
    Color selectionColor,
    TextSelectionControls selectionControls,
    Color backgroundCursorColor,
  }) : super(
    key: key,
    focusNode: focusNode,
    controller: controller,
    cursorColor: cursorColor,
    maxLines: maxLines,
    style: style,
    keyboardType: TextInputType.multiline,
    autocorrect: true,
    autofocus: true,
    backgroundCursorColor: backgroundCursorColor,
    selectionColor: selectionColor,
    selectionControls: selectionControls,
    onChanged: onChanged,
    onSubmitted: onSubmitted,
  );

  @override
  HashtagInputTextState createState() => new HashtagInputTextState();
}

class HashtagInputTextState extends EditableTextState {
  @override
  HashtagText get widget => super.widget;

  List<dynamic> getTextParts() {
    String text = widget.controller.text;
    if (text.length > 0) {
      List array = text.split(" ");
      return array;
    } else {
      return [];
    }
  }

  @override
  TextSpan buildTextSpan() {
    // TODO: Odkomentuj to poniżej i zakomentuj resztę - klikanie działa jak w normalnym text inpucie.

//    return TextSpan(style: widget.style, text: widget.controller.text);

    if (getTextParts().length > 0) {
      var children = <TextSpan>[];
      for (var item in getTextParts()) {
        if (_tagRegex.hasMatch(item)) {
          children.add(TextSpan(
              style:
              TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              text: item));
        } else if (item.startsWith("@")) {
          children.add(
              TextSpan(style: TextStyle(color: Colors.green), text: item));
        } else if (_linkRegex.hasMatch(item)) {
          children.add(
              TextSpan(style: TextStyle(color: Colors.green), text: item));
        } else {
          children.add(TextSpan(
              style: TextStyle(
                color: Colors.black,
              ),
              text: item));
        }
      }
      return TextSpan(
          style: widget.style,
          children: children
              .expand(
                  (widget) => [widget, TextSpan(style: TextStyle(), text: " ")])
              .toList());
    }
    return TextSpan(style: widget.style, text: "Wprowadź tekst");
  }
}
