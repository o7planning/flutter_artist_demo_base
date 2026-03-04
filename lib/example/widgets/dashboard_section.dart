import 'package:flutter/material.dart';

import '../../widgets/custom_slivergriddelegate.dart';
import 'dashboard_header.dart';
import 'example_box.dart';
import 'example_model.dart';

class DashboardSection extends StatefulWidget {
  final List<Example> exampleList;

  const DashboardSection({super.key, required this.exampleList});

  @override
  State<StatefulWidget> createState() {
    return _DashboardSectionState();
  }
}

class _DashboardSectionState extends State<DashboardSection> {
  Example? selectedExample;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 10),
          Expanded(child: _buildExampleGrid()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const DashboardHeader();
  }

  Widget _buildExampleGrid() {
    return GridView.builder(
      itemCount: widget.exampleList.length,
      gridDelegate: const ChildFixedMainExtentAndMinCrossExtentSGD(
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childMainAxisExtent: 150, // Height
        minChildCrossAxisExtent: 260, // Weight
      ),
      itemBuilder: (BuildContext context, int index) {
        return ExampleBox(
          exampleNo: index + 1,
          example: widget.exampleList[index],
          selected: selectedExample == widget.exampleList[index],
          onSelectExample: (Example example) {
            selectedExample = example;
            setState(() {});
          },
        );
      },
    );
  }
}
