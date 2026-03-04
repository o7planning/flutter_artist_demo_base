import '../../example/all_examples.dart';
import '../example/widgets/example_model.dart';
import '_base_examples_screen.dart';

class StateExamplesScreen extends BaseExamplesScreen {
  static const String routeName = "/state-examples";

  const StateExamplesScreen({super.key});

  @override
  List<Example> getExampleList() {
    return [
      // -----------------------------------------------------------------------
      // example_28a, //
      // example_29a,
      // example_30a,
    ];
  }

  @override
  String getTopMenuTitle() {
    return "State Examples";
  }
}
