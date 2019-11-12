import 'package:flutter/material.dart';

class DisabledOutlineInput extends StatefulWidget {
  final TextEditingController textController;
  final String labelText;
  final int lines;

  DisabledOutlineInput({
    @required this.textController,
    @required this.labelText,
    this.lines = 2,
  });

  @override
  _DisabledOutlineInputState createState() => _DisabledOutlineInputState();
}

class _DisabledOutlineInputState extends State<DisabledOutlineInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      style: TextStyle(color: Colors.black),
      maxLines: widget.lines,
      controller: widget.textController,
      decoration: new InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
