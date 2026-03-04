import '../../example/all_examples.dart';
import '../example/widgets/example_model.dart';
import '_base_examples_screen.dart';

class FilterExamplesScreen extends BaseExamplesScreen {
  static const String routeName = "/filter-examples";

  const FilterExamplesScreen({super.key});

  @override
  List<Example> getExampleList() {
    return [
      example_song02a,
      example_employee03a,
      example_employee40a,
      example_employee33a, // Same as 04a.
      example_employee59a,
      example_product77a,
      // -----------------------------------------------------------------------
      // example_employee32a,
      // example_employee20a,
      // example_employee44a,
      // example_employee04a,
      // example_employee59b,
      // example_employee59c,
      // example_song56a,
    ];
  }

  @override
  String getTopMenuTitle() {
    return "Filter Examples";
  }
}
