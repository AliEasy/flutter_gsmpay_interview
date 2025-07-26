import 'dart:typed_data';

import 'package:flutter_gsmpay_interview/core/model/base_use_case.dart';
import 'package:flutter_gsmpay_interview/core/model/result.dart';
import 'package:flutter_gsmpay_interview/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadNationalIdImageUseCase extends BaseUseCase<Result<int>, Uint8List> {
  final HomeRepository _homeRepository;

  UploadNationalIdImageUseCase(this._homeRepository);

  @override
  Future<Result<int>> call(Uint8List requestData) async {
    return _homeRepository.uploadNationalIdImage(requestData);
  }
}
