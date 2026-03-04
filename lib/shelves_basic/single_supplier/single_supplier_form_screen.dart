import 'package:flutter/cupertino.dart';
import 'package:flutter_artist/flutter_artist.dart';

import '../../layout/my_face_screen.dart';
import 'block/single_supplier_block.dart';
import 'form_model/single_supplier_form_model.dart';
import 'form_view/single_supplier_form_view.dart';
import 'shelf/single_supplier_shelf.dart';

class SingleSupplierFormScreen extends MyFaceScreen {
  const SingleSupplierFormScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    SingleSupplierShelf shelf = FlutterArtist.storage.findShelf();
    SingleSupplierBlock block = shelf.findSingleSupplierBlock();
    SingleSupplierFormModel formModel =
        block.formMode as SingleSupplierFormModel;

    return SingleSupplierFormView(formModel: formModel);
  }

  @override
  String getTopMenuTitle() {
    return "SingleSupplier";
  }
}
