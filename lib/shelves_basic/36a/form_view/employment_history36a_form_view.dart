import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/model/model.dart';
import 'package:flutter_fa_form_builder/flutter_fa_form_builder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../form_model/employment_history36a_form_model.dart';

class EmploymentHistory36aFormView
    extends FormView<EmploymentHistory36aFormModel> {
  const EmploymentHistory36aFormView({super.key, required super.formModel});

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FaFormBuilderDateTimePicker.topLabel(
                name: "fromDate",
                labelText: "From Date",
                pattern: "yyyy-MM-dd",
                inputType: InputType.date,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: FaFormBuilderDateTimePicker.topLabel(
                name: "toDate",
                labelText: "To Date",
                pattern: "yyyy-MM-dd",
                inputType: InputType.date,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        FaFormBuilderDropdown.topLabel(
          name: "company",
          labelText: "Company",
          items: formModel.getMultiOptPropData("company") ?? [],
          getItemText: (item) => item.name,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
        ),
        SizedBox(height: 12),
        FaFormBuilderDropdown.topLabel(
          name: "department",
          labelText: "Department",
          items: formModel.getMultiOptPropData("department") ?? [],
          getItemText: (item) => item.name,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
        ),
        SizedBox(height: 12),
        FaFormBuilderDropdown<EmployeePositionInfo>.topLabel(
          name: "employeePosition",
          labelText: "Position",
          items: formModel.getMultiOptPropData("employeePosition") ?? [],
          getItemText: (item) => item.name,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
        ),
      ],
    );
  }
}
