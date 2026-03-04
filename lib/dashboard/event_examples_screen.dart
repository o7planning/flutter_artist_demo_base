import '../../example/all_examples.dart';
import '../example/widgets/example_model.dart';
import '_base_examples_screen.dart';

class EventExamplesScreen extends BaseExamplesScreen {
  static const String routeName = "/event-examples";

  const EventExamplesScreen({super.key});

  @override
  List<Example> getExampleList() {
    return [
      example_supplier27a,
      example_supplier71a,
      // -----------------------------------------------------------------------
      // example_supplier27b,
      // example_supplier71b,
      // example_24a,
      // example_79a,
      // example_50a,
      // example_16a,
    ];
  }

  @override
  String getTopMenuTitle() {
    return "Event Examples";
  }
}
