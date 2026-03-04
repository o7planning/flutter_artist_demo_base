import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';

import '../block/employee40a_block.dart';
import '../filter_input/employee40a_filter_input.dart';

class Employee40aButtons extends BlockSectionView<Employee40aBlock> {
  const Employee40aButtons({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    final labelStyle = TextStyle(fontSize: 12);
    final textStyle = TextStyle(color: Colors.indigo, fontSize: 12);
    //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconLabelText(
          label: "Company Code: ",
          text: "VINFAST",
          labelStyle: labelStyle,
          textStyle: textStyle,
        ),
        IconLabelText(
          label: "Dept Codes: ",
          text: "VINFAST-FIN, VINFAST-SALES, VINFAST-HR",
          labelStyle: labelStyle,
          textStyle: textStyle,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _queryWithFilterInput1,
          child: Text("Query with FilterInput1"),
        ),
        // --------------------------
        const Divider(height: 20),
        IconLabelText(
          label: "Search Text: ",
          text: "g",
          labelStyle: labelStyle,
          textStyle: textStyle,
        ),
        IconLabelText(
          label: "Company Code: ",
          text: "VINHOMES",
          labelStyle: labelStyle,
          textStyle: textStyle,
        ),
        IconLabelText(
          label: "Dept Codes: ",
          text: "VINHOMES-FIN, VINHOMES-HR",
          labelStyle: labelStyle,
          textStyle: textStyle,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _queryWithFilterInput2,
          child: Text("Query with FilterInput2"),
        ),
        // ------------------------------
        const Divider(height: 20),
        IconLabelText(
          label: "Search Text: ",
          text: "",
          labelStyle: labelStyle,
          textStyle: textStyle,
        ),
        IconLabelText(
          label: "Company Code: ",
          text: "VINGROUP",
          labelStyle: labelStyle,
          textStyle: textStyle,
        ),
        IconLabelText(
          label: "Dept Codes: ",
          text: "VINGROUP-FIN",
          labelStyle: labelStyle,
          textStyle: textStyle,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _queryWithFilterInput3,
          child: Text("Query with FilterInput3"),
        ),
      ],
    );
  }

  Future<void> _queryWithFilterInput1() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    var filterInput1 = Employee40aFilterInput(
      searchText: null,
      companyCode: "VINFAST",
      departmentCodes: ["VINFAST-FIN", "VINFAST-SALES", "VINFAST-HR"],
    );
    await block.query(filterInput: filterInput1);
  }

  Future<void> _queryWithFilterInput2() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    var filterInput2 = Employee40aFilterInput(
      searchText: 'g',
      companyCode: "VINHOMES",
      departmentCodes: ["VINHOMES-FIN", "VINHOMES-HR"],
    );
    await block.query(filterInput: filterInput2);
  }

  Future<void> _queryWithFilterInput3() async {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    var filterInput3 = Employee40aFilterInput(
      searchText: '',
      companyCode: "VINGROUP",
      departmentCodes: ["VINGROUP-FIN"],
    );
    await block.query(filterInput: filterInput3);
  }
}
