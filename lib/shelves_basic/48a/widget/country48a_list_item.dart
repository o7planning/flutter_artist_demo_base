import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_demo_base/widgets/image_url_view.dart';

import '../../../model/model.dart';

class Country48aListItem extends StatelessWidget {
  final CountryInfo countryInfo;
  final bool selected;
  final Function(CountryInfo countryInfo) onCountryPressed;

  const Country48aListItem({
    super.key,
    required this.countryInfo,
    required this.selected,
    required this.onCountryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.indigo.withAlpha(30) : null,
      child: ListTile(
        leading: ImageUrlView(
          imageUrl: countryInfo.imageUrl,
          size: 40,
          boxShape: BoxShape.rectangle,
        ),
        title: Text(
          countryInfo.id,
          style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
        ),
        subtitle: Text(
          countryInfo.name,
          style: const TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
        ),
        onTap: _onTap,
      ),
    );
  }

  void _onTap() {
    // Write Log:
    FlutterArtist.codeFlowLogger.addMethodCall(
      ownerClassInstance: this,
      currentStackTrace: StackTrace.current,
      parameters: null,
    );
    //
    onCountryPressed(countryInfo);
  }
}
