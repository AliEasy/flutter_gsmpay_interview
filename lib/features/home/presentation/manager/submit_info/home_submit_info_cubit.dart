import 'package:bloc/bloc.dart';
import 'package:flutter_gsmpay_interview/features/home/domain/entity/submit_info_request_entity.dart';
import 'package:flutter_gsmpay_interview/features/home/domain/use_case/submit_info_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_submit_info_state.dart';

part 'home_submit_info_cubit.freezed.dart';

@injectable
class HomeSubmitInfoCubit extends Cubit<HomeSubmitInfoState> {
  final SubmitInfoUseCase _submitInfoUseCase;

  HomeSubmitInfoCubit(this._submitInfoUseCase)
    : super(const HomeSubmitInfoState.initial());

  submit(SubmitInfoRequestEntity data) async {
    emit(const HomeSubmitInfoState.loading());
    final result = await _submitInfoUseCase.call(data);
    result.whenOrNull(
      success: (data) {
        emit(HomeSubmitInfoState.success(record: data ?? ''));
      },
      failure: (message) {
        emit(HomeSubmitInfoState.failure(message: message));
      },
    );
  }
}
