import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../../model/model.dart';
import '../../../widgets/image_url_view.dart';
import '../block/country48a_block.dart';

class Country48aItemDetailView extends BlockItemDetailView<Country48aBlock> {
  const Country48aItemDetailView({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    CountryData? countryData = block.currentItemDetail;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 140,
              height: 80,
              child: countryData == null
                  ? null
                  : ImageUrlView(
                      imageUrl: countryData.imageUrl,
                      size: 20,
                      boxShape: BoxShape.rectangle,
                      fit: BoxFit.fill,
                    ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Code: ${countryData?.id ?? ' - '}"),
                  SizedBox(height: 10),
                  Text("Name: ${countryData?.name ?? ' - '}"),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text("Description:", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(
          countryData?.description ?? "",
          style: TextStyle(color: Colors.black38, fontSize: 13),
        ),
      ],
    );
  }
}
