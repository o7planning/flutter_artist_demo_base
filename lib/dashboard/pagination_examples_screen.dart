import '../../example/all_examples.dart';
import '../example/widgets/example_model.dart';
import '_base_examples_screen.dart';

class PaginationExamplesScreen extends BaseExamplesScreen {
  static const String routeName = "/pagination-examples";

  const PaginationExamplesScreen({super.key});

  @override
  List<Example> getExampleList() {
    return [
      example_teacher14a,
      example_teacher15a,
      example_country48a,
      // -----------------------------------------------------------------------
      // example_country54a,
      // example_country61a,
    ];
  }

  @override
  String getTopMenuTitle() {
    return "Pagination Examples";
  }
}
