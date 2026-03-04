import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/rest_provider/customer_rest_provider.dart';

import '../../../model/model.dart';

class Customer43aVipUpdateAction
    extends
        BlockQuickItemUpdateAction<
          int, //
          CustomerInfo,
          CustomerData,
          EmptyFilterCriteria
        > {
  final bool vip;

  final _customerRestProvider = CustomerRestProvider();

  Customer43aVipUpdateAction({
    required super.item,
    required super.config,
    required this.vip,
    required super.needToConfirm,
    required super.actionInfo,
  });

  @override
  Future<ApiResult<CustomerData>> performQuickUpdateItem({
    required Object? parentBlockItem,
    required EmptyFilterCriteria filterCriteria,
  }) async {
    return await _customerRestProvider.updateVip(customerId: item.id, vip: vip);
  }

  @override
  CustomConfirmation? createCustomConfirmation() {
    return null;
  }
}
