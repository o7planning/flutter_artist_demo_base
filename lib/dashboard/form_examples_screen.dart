import '../../example/all_examples.dart';
import '../dashboard/_base_examples_screen.dart';
import '../example/widgets/example_model.dart';

class FormExamplesScreen extends BaseExamplesScreen {
  static const String routeName = "/form-examples";

  const FormExamplesScreen({super.key});

  @override
  List<Example> getExampleList() {
    return [
      example_supplier11a,
      example_empEmploymentHistory36a,
      example_supplier26a,
      example_salesOrder96a,
      // -----------------------------------------------------------------------
      // example_catProduct13a,
      // example_employee21a,
      // example_footballPlayer86a,
      // example_empEmploymentHistory60a,
    ];
  }

  @override
  String getTopMenuTitle() {
    return "Form Examples";
  }
}
