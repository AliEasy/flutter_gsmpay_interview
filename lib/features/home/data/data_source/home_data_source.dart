import 'dart:typed_data';

abstract interface class HomeDataSource {
  Future<int> uploadNationalIdImage(Uint8List image);
  Future<int> uploadBirthCertificateImage(Uint8List image);
}
