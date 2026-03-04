import '../../example/all_examples.dart';
import '../example/widgets/example_model.dart';
import '_base_examples_screen.dart';

class AdvancedExamplesScreen extends BaseExamplesScreen {
  static const String routeName = "/advanced-examples";

  const AdvancedExamplesScreen({super.key});

  @override
  List<Example> getExampleList() {
    return [
      // -----------------------------------------------------------------------
      // example_companyExt31a,
      // example_systemLog51a,
      // example_64a,
    ];
  }

  @override
  String getTopMenuTitle() {
    return "Advanced Examples";
  }
}
