import '../../example/all_examples.dart';
import '../example/widgets/example_model.dart';
import '_base_examples_screen.dart';

class BasicExamplesScreen extends BaseExamplesScreen {
  static const String routeName = "/basic-examples";

  const BasicExamplesScreen({super.key});

  @override
  List<Example> getExampleList() {
    return [
      example_currency01a,
      example_catProduct08a,
      example_70a, // Scalar
      // -----------------------------------------------------------------------
      // example_appUser06a,
      // example_currency38a,
      // example_employee22a,
      // example_07a, // Activity
    ];
  }

  @override
  String getTopMenuTitle() {
    return "Basic Examples";
  }
}
