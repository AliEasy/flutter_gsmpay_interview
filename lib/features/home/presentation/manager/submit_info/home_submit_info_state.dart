part of 'home_submit_info_cubit.dart';

@freezed
class HomeSubmitInfoState with _$HomeSubmitInfoState {
  const factory HomeSubmitInfoState.initial() = _Initial;
  const factory HomeSubmitInfoState.loading() = _Loading;
  const factory HomeSubmitInfoState.success({required String record}) = _Success;
  const factory HomeSubmitInfoState.failure({String? message}) = _Failure;
}
