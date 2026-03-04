import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';

class Country12aSortModelBuilder extends SortModelBuilder<CountryInfo> {
  Country12aSortModelBuilder({
    required super.clientSideSortMode,
    required super.serverSideSortMode,
  });

  @override
  SortModelStructure defineSortModelStructure() {
    return SortModelStructure(
      sortCriterionDefs: [
        SortCriterionDef(
          criterionName: 'nameInEnglish',
          text: 'Name In English',
          translationKey: "country.nameInEnglish",
        ),
        SortCriterionDef(
          criterionName: 'population',
          text: 'Population',
          translationKey: "country.population",
          serverSideConfig: SortCriterionConfig(
            initialSortDirection: SortDirection.desc,
          ),
        ),
        SortCriterionDef(
          criterionName: 'area',
          text: 'Area',
          translationKey: "country.area",
          serverSideConfig: SortCriterionConfig(
            initialSortDirection: SortDirection.asc,
          ),
        ),
      ],
    );
  }

  @override
  Comparable? getComparisonValue({
    required CountryInfo item,
    required String criterionName,
  }) {
    if (criterionName == "nameInEnglish") {
      return item.nameInEnglish;
    } else if (criterionName == "population") {
      return item.population;
    } else if (criterionName == "area") {
      return item.area;
    }
    return null;
  }

  @override
  String? getTranslationText({required String translationKey}) {
    return null;
  }
}
