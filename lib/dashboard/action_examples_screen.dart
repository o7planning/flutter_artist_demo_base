import '../../example/all_examples.dart';
import '../example/widgets/example_model.dart';
import '_base_examples_screen.dart';

class ActionExamplesScreen extends BaseExamplesScreen {
  static const String routeName = "/action-examples";

  const ActionExamplesScreen({super.key});

  @override
  List<Example> getExampleList() {
    return [
      example_customer43a,
      example_note42a,
      example_system_log25a,
      // -----------------------------------------------------------------------
      // example_cdeDiagram39a,
      // example_bookExt41a,
      // example_demo17a,
      // example_69a,
      // example_98a,
      // example_82a,
      // example_65a,
      // example_84a,
    ];
  }

  @override
  String getTopMenuTitle() {
    return "Action Examples";
  }
}
