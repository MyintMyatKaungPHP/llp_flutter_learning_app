import 'package:flutter/material.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key, required this.title, required this.demo, required this.path});

  final String title;
  final Widget demo;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: WidgetWithCodeView(
        filePath: 'lib/$path',
        child: demo,
      ),
    );
  }
}
