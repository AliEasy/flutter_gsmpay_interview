import 'dart:typed_data';

import 'package:flutter_gsmpay_interview/core/model/result.dart';
import 'package:flutter_gsmpay_interview/features/home/domain/entity/submit_info_request_entity.dart';

abstract interface class HomeRepository {
  Future<Result<int>> uploadNationalIdImage(Uint8List image);
  Future<Result<int>> uploadBirthCertificateImage(Uint8List image);
  Future<Result<String>> submitInfo(SubmitInfoRequestEntity data);
}