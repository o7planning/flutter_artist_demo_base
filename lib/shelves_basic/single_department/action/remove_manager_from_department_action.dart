import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/rest_provider/department_rest_provider.dart';

class RemoveManagerFromDepartmentAction
    extends BlockBackendAction<int, dynamic> {
  final _departmentRestProvider = DepartmentRestProvider();
  final int departmentId;

  RemoveManagerFromDepartmentAction({
    required this.departmentId,
    required super.needToConfirm,
    super.actionInfo = "Remove manager from department",
  });

  @override
  BlockBackendActionConfig initDefaultConfig() {
    return BlockBackendActionConfig(
      afterBackendAction: AfterBlockBackendAction.query,
    );
  }

  @override
  Future<ApiResult<dynamic>> performBackendOperation() async {
    ApiResult<void> result = await _departmentRestProvider.removeManager(
      departmentId: departmentId,
    );
    return result;
  }

  @override
  int? suggestNewCurrentItemId({required data}) {
    return null;
  }

  @override
  CustomConfirmation? createCustomConfirmation() {
    return null;
  }
}
