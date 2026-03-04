import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_demo_base/widgets/image_url_view.dart';
import 'package:flutter_fa_davi_table/flutter_fa_davi_table.dart';

import '../../../model/model.dart';
import '../../../utils/number_format_utils.dart';
import '../block/product08a_block.dart';
import '../dialog/product_dialog.dart';

// Docs: [14813] - FlutterArtist Davi Table.
// Docs: [14773] - CatProduct08a
class Product08aDaviTableItemsView extends BlockItemsView<Product08aBlock> {
  const Product08aDaviTableItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: DaviTheme(
        data: _daviThemeData(),
        child: FaDaviTable<int, ProductInfo>(
          items: block.items,
          getItemId: (item) => item.id,
          sortRuleSide: SortRuleSide.blockSide,
          visibleRowsCount: 10,
          onRowTap: (ProductInfo productInfo) {
            _onSelectProduct(productInfo);
          },
          rowColor: (RowColorParams<ProductInfo> param) {
            return param.data.id == block.currentItem?.id
                ? Colors.indigo.withAlpha(50)
                : null;
          },
          modelSettings: FaDaviTableModelSettings<ProductInfo>(
            columns: [
              DaviColumn(
                name: 'Image',
                resizable: false,
                width: 70,
                cellWidget: (param) {
                  return Center(
                    child: ImageUrlView(
                      // param.data = ProductInfo
                      imageUrl: param.data.imageUrl,
                      size: 30,
                      boxShape: BoxShape.rectangle,
                    ),
                  );
                },
              ),
              DaviColumn(
                name: 'Name',
                grow: 1,
                cellValue: (param) {
                  return param.data.name;
                },
              ),
              DaviColumn(
                name: 'Detail',
                headerAlignment: Alignment.center,
                width: 50,
                cellWidget: (param) {
                  return Center(
                    child: SimpleSmallIconButton(
                      onPressed: () {
                        _showProductDetail(context, param.data);
                      },
                      iconData: Icons.remove_red_eye_outlined,
                    ),
                  );
                },
              ),
              DaviColumn(
                name: 'Price (\$)',
                cellWidget: (params) {
                  return Text(formatCurrency(params.data.price));
                },
              ),
              DaviColumn(
                name: 'Active',
                width: 60,
                cellWidget: (param) {
                  return Checkbox(value: param.data.active, onChanged: null);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showProductDetail(
    BuildContext context,
    ProductInfo product,
  ) async {
    // Product08aBlock block:
    if (!block.isCurrentItem(product)) {
      BlockCurrentItemSettingResult result = await block
          .refreshItemAndSetAsCurrent(item: product);
      if (!result.successForAll) {
        return;
      }
    }
    Product08aDialog.showProduct08aDialog(context);
  }

  DaviThemeData _daviThemeData() {
    return DaviThemeData(
      columnDividerThickness: 0.4,
      columnDividerFillHeight: true,
      decoration: BoxDecoration(
        border: Border.all(width: 0.2, color: Colors.grey),
      ),
      scrollbar: TableScrollbarThemeData(
        horizontalOnlyWhenNeeded: true,
        verticalOnlyWhenNeeded: true,
      ),
      header: HeaderThemeData(),
      headerCell: HeaderCellThemeData(padding: EdgeInsets.all(5), height: 30),
      row: RowThemeData(
        dividerThickness: 0.4,
        fillHeight: true,
        color: null,
        hoverBackground: (int row) {
          return Colors.greenAccent.withAlpha(30);
        },
      ),
      cell: CellThemeData(padding: EdgeInsets.all(5), contentHeight: 30),
    );
  }

  Future<void> _onSelectProduct(ProductInfo product) async {
    await block.refreshItemAndSetAsCurrent(item: product);
  }
}
