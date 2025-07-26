part of 'home_form_validator_cubit.dart';

@freezed
class HomeFormValidatorState with _$HomeFormValidatorState {
    const factory HomeFormValidatorState.valid() = _Valid;
  const factory HomeFormValidatorState.invalid() = _Invalid;
}
