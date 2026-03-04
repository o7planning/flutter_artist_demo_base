import 'package:flutter/material.dart';
import 'package:flutter_artist/flutter_artist.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:intl/intl.dart';

import '../../../model/model.dart';
import '../block/country12a_block.dart';

class Country12aItemDetailView extends BlockItemDetailView<Country12aBlock> {
  const Country12aItemDetailView({super.key, required super.block});

  @override
  Widget buildContent(BuildContext context) {
    CountryData? customerData = block.currentItemDetail;
    var formatter = NumberFormat("###,###,###", "en_US");
    //
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconLabelText(label: "Name: ", text: customerData?.name ?? ' - '),
        SizedBox(height: 10),
        IconLabelText(
          label: "Name In English: ",
          text: customerData?.nameInEnglish ?? ' - ',
        ),
        SizedBox(height: 10),
        IconLabelText(
          label: "Iso Code2: ",
          text: customerData?.isoCode2 ?? ' - ',
        ),
        SizedBox(height: 10),
        IconLabelText(
          label: "Iso Code3: ",
          text: customerData?.isoCode3 ?? ' - ',
        ),
        SizedBox(height: 10),
        IconLabelText(
          label: "Country Code: ",
          text: customerData?.countryCode ?? ' - ',
        ),
        Divider(),
        IconLabelText(
          label: "Population: ",
          text: formatter.format(customerData?.population ?? 0),
        ),
        SizedBox(height: 10),
        IconLabelText(
          label: "Area: ",
          text: "${formatter.format(customerData?.area ?? 0)} KM2",
        ),
        SizedBox(height: 10),
        IconLabelText(
          label: "GDP: ",
          text: "${formatter.format(customerData?.gdp ?? 0)} Million USD",
        ),
        Divider(height: 20),
        IconLabelText(
          label: "Description: ",
          text: customerData?.description ?? ' - ',
        ),
      ],
    );
  }
}
