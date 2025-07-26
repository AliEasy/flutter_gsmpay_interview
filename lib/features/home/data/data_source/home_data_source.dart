import 'dart:typed_data';

import 'package:flutter_gsmpay_interview/features/home/data/model/submit_info_request_model.dart';

abstract interface class HomeDataSource {
  Future<int> uploadNationalIdImage(Uint8List image);
  Future<int> uploadBirthCertificateImage(Uint8List image);
  Future<String> submitInfo(SubmitInfoRequestModel data);
}
