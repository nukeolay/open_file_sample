import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:open_filex/open_filex.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _openResult = 'Unknown';

  Future<void> openFile() async {
    _openWebFile();
  }

  _openWebFile() async {
    FilePickerResult? fileResult = await FilePicker.platform.pickFiles();
    final file = fileResult?.files.first;
    if (file != null) {
      final result = await OpenFilex.open(file.path);
      setState(() {
        _openResult = "type=${result.type}  message=${result.message}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('open result: $_openResult\n'),
              TextButton(
                onPressed: openFile,
                child: const Text('Tap to open file'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
