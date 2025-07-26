import 'package:flutter_gsmpay_interview/core/model/base_use_case.dart';
import 'package:flutter_gsmpay_interview/core/model/result.dart';
import 'package:flutter_gsmpay_interview/features/home/domain/entity/submit_info_request_entity.dart';
import 'package:flutter_gsmpay_interview/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubmitInfoUseCase extends BaseUseCase<Result<String>, SubmitInfoRequestEntity> {
  final HomeRepository _homeRepository;

  SubmitInfoUseCase(this._homeRepository);

  @override
  Future<Result<String>> call(SubmitInfoRequestEntity data) async {
    return _homeRepository.submitInfo(data);
  }
}
