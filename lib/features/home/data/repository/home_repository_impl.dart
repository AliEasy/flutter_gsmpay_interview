import 'dart:typed_data';

import 'package:flutter_gsmpay_interview/core/model/result.dart';
import 'package:flutter_gsmpay_interview/features/home/data/data_source/home_data_source.dart';
import 'package:flutter_gsmpay_interview/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepositoryImpl(this._homeDataSource);

  @override
  Future<Result<int>> uploadNationalIdImage(Uint8List image) async {
    try {
      final result = await _homeDataSource.uploadNationalIdImage(image);
      return Result.success(data: result);
    } catch (e) {
      return const Result.failure(message: 'Error');
    }
  }

  @override
  Future<Result<int>> uploadBirthCertificateImage(Uint8List image) async {
    try {
      final result = await _homeDataSource.uploadBirthCertificateImage(image);
      return Result.success(data: result);
    } catch (e) {
      return const Result.failure(message: 'Error');
    }
  }
}
