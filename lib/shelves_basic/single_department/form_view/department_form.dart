import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';

import '../../../model/model.dart';
import '../form_model/single_department_form_model.dart';

class DepartmentFormView extends FormView<SingleDepartmentFormModel> {
  const DepartmentFormView({super.key, required super.formModel});

  @override
  Widget buildContent(BuildContext context) {
    return _buildFormFields();
  }

  Widget _buildFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconLabelText(
          label: "Company: ",
          text: formModel.company?.name ?? " - ",
        ),
        Divider(),
        FaFormBuilderTextField.topLabel(
          name: "code",
          labelText: "Department Code",
        ),
        SizedBox(height: 10),
        FaFormBuilderTextField.topLabel(
          name: "name",
          labelText: "Department Name",
        ),
        SizedBox(height: 10),
        FaFormBuilderDeselectableDropdown<EmployeeInfo>.topLabel(
          name: "manager",
          items: formModel.employeeInfoListXData?.items ?? [],
          labelText: "Manager",
          getItemText: (item) => item.name,
        ),
        SizedBox(height: 10),
        FaFormBuilderTextField.topLabel(
          name: "description",
          minLines: 3,
          labelText: "Description",
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
