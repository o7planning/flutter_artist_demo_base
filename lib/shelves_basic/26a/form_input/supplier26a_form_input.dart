import 'package:flutter_artist/flutter_artist.dart';

class Supplier26aFormInput extends FormInput {
  String email;
  String? supplierTypeCode;
  String address;
  String phone;

  Supplier26aFormInput({
    required this.email,
    required this.supplierTypeCode,
    required this.address,
    required this.phone,
  });

  Supplier26aFormInput.defaultForTest()
    : email = "testEmail@example.com",
      // DI = Distributors
      supplierTypeCode = "DI",
      address = "Test Address",
      phone = "123456789";
}
