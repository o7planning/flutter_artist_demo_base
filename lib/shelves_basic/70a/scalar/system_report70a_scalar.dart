import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';

import '../../../model/model.dart';
import '../../../rest_provider/system_report_rest_provider.dart';

class SystemReport70aScalar
    extends
        Scalar<
          SystemReportData, // VALUE
          EmptyFilterInput,
          EmptyFilterCriteria
        > {
  static const scalarName = "system-report70a-scalar";

  final systemReportRestProvider = SystemReportRestProvider();

  SystemReport70aScalar({
    required super.name,
    required super.description,
    required super.config,
    required super.filterModelName,
  }) : super(childScalars: const []);

  @override
  Future<ApiResult<SystemReportData>> performQuery({
    required Object? parentScalarValue,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return await systemReportRestProvider.query();
  }
}
