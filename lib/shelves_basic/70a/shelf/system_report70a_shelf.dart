import 'package:flutter_artist/flutter_artist.dart';

import '../scalar/system_report70a_scalar.dart';

class SystemReport70aShelf extends Shelf {
  @override
  ShelfStructure defineShelfStructure() {
    return ShelfStructure(
      filterModels: {},
      blocks: [],
      scalars: [
        SystemReport70aScalar(
          name: SystemReport70aScalar.scalarName,
          description: '',
          filterModelName: null,
          config: ScalarConfig(),
        ),
      ],
    );
  }

  SystemReport70aScalar findSystemReport70aScalar() {
    return findScalar(SystemReport70aScalar.scalarName)
        as SystemReport70aScalar;
  }
}
