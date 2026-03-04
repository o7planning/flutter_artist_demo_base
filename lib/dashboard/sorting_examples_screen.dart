import '../../example/all_examples.dart';
import '../example/widgets/example_model.dart';
import '_base_examples_screen.dart';

class SortingExamplesScreen extends BaseExamplesScreen {
  static const String routeName = "/sorting-examples";

  const SortingExamplesScreen({super.key});

  @override
  List<Example> getExampleList() {
    return [
      example_country12a,
      example_currency49a,
      // -----------------------------------------------------------------------
      // example_bestSelling52a,
      // example_currency37a,
    ];
  }

  @override
  String getTopMenuTitle() {
    return "Sorting Examples";
  }
}
