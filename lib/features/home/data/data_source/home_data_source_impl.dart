import 'dart:typed_data';

import 'package:flutter_gsmpay_interview/core/common/util/util_func.dart';
import 'package:flutter_gsmpay_interview/features/home/data/data_source/home_data_source.dart';
import 'package:flutter_gsmpay_interview/features/home/data/model/submit_info_request_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<int> uploadNationalIdImage(Uint8List image) async {
    await Future.delayed(const Duration(seconds: 2));
    return generateRandom8DigitNumber();
  }

  @override
  Future<int> uploadBirthCertificateImage(Uint8List image) async {
    await Future.delayed(const Duration(seconds: 2));
    return generateRandom8DigitNumber();
  }

  @override
  Future<String> submitInfo(SubmitInfoRequestModel data) async {
    await Future.delayed(const Duration(seconds: 2));
    return data.toJson().toString();
  }
}
