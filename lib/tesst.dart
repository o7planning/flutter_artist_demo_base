import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Multi Select',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'FormBuilder Test', key: Key("XX")),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({required super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int i = 0;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: PopScope(
        onPopInvokedWithResult: (_, __) {
          //
        },
        child: AbsorbPointer(
          absorbing: false,
          child: FormBuilder(
            key: _formKey,
            onChanged: () async {
              await Get.showOverlay(
                asyncFunction: () async {
                  print("Change ${i++}");
                  await Future.delayed(Duration(seconds: 2));
                },
              );
              setState(() {});
            },
            child: Column(
              children: [
                FormBuilderTextField(name: "address"),
                SizedBox(height: 10),
                FormBuilderCheckbox(name: "active", title: Text("Active")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
