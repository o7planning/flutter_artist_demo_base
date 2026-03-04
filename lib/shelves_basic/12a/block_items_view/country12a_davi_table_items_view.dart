import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_fa_davi_table/flutter_fa_davi_table.dart';
import 'package:intl/intl.dart';

import '../../../model/model.dart';
import '../../../widgets/image_url_view.dart';
import '../block/country12a_block.dart';

class Country12aDaviTableItemsView extends BlockItemsView<Country12aBlock> {
  final Color? selectedColor = Colors.lightGreen.withAlpha(100);
  final Color? currentColor = Colors.lightGreen;
  final Color? hoverColor = Colors.greenAccent.withAlpha(30);
  final formatter = NumberFormat("###,###,###", "en_US");

  Country12aDaviTableItemsView({required super.block, super.key});

  @override
  Widget buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 0),
      child: DaviTheme(
        data: _daviThemeData(),
        child: FaDaviTable<String, CountryInfo>(
          items: block.items,
          getItemId: (item) => item.id,
          sortRuleSide: SortRuleSide.blockSide,
          visibleRowsCount: 10,
          onRowTap: (CountryInfo countryInfo) {
            _setCurrentCountry(countryInfo);
          },
          rowColor: (param) {
            CountryInfo item = param.data;
            bool selected = block.isSelectedItem(item);
            bool current = block.isCurrentItem(item);
            if (current) {
              return currentColor;
            } else if (selected) {
              return selectedColor;
            }
            return null;
          },
          modelSettings: FaDaviTableModelSettings<CountryInfo>(
            ignoreDataComparators: true,
            sortingMode: SortingMode.disabled,
            columns: [
              DaviColumn(
                name: 'Flag',
                resizable: false,
                width: 60,
                cellWidget: (param) {
                  return Center(
                    child: ImageUrlView(
                      imageUrl: param.data.imageUrl,
                      size: 30,
                      boxShape: BoxShape.rectangle,
                    ),
                  );
                },
              ),
              DaviColumn(
                name: 'Name In English',
                grow: 1,
                cellValue: (param) {
                  return param.data.nameInEnglish;
                },
              ),
              DaviColumn(
                name: 'Population',
                width: 100,
                cellAlignment: Alignment.centerRight,
                cellValue: (param) {
                  return param.data.population;
                },
                cellValueStringify: _formatNumber,
              ),
              DaviColumn(
                name: 'Area (Km2)',
                width: 100,
                cellAlignment: Alignment.centerRight,
                cellValue: (param) {
                  return param.data.area;
                },
                cellValueStringify: _formatNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatNumber(dynamic value) {
    return formatter.format(value);
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
          if (block.isCurrentIndex(row)) {
            return currentColor;
          } else if (block.isSelectedIndex(row)) {
            return selectedColor;
          } else {
            return hoverColor;
          }
        },
      ),
      cell: CellThemeData(padding: EdgeInsets.all(5), contentHeight: 30),
    );
  }

  void _setCurrentCountry(CountryInfo countryInfo) {
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: {"countryInfo": countryInfo},
    );
    //
    block.refreshItemAndSetAsCurrent(item: countryInfo);
  }
}
