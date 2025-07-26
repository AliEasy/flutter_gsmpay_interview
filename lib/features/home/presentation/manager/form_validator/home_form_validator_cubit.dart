import 'package:bloc/bloc.dart';
import 'package:flutter_gsmpay_interview/core/common/constant/regex.dart';
import 'package:flutter_gsmpay_interview/core/common/status/form_field_status.dart';
import 'package:flutter_gsmpay_interview/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_form_validator_state.dart';

part 'home_form_validator_cubit.freezed.dart';

@injectable
class HomeFormValidatorCubit extends Cubit<HomeFormValidatorState> {
  HomeFormValidatorCubit() : super(const HomeFormValidatorState.invalid());

  FormFieldStatus _fullNameStatus = FormFieldStatus.empty;
  FormFieldStatus _nationalCodeStatus = FormFieldStatus.empty;
  FormFieldStatus _nationalIdImageId = FormFieldStatus.empty;
  FormFieldStatus _birthCertificateImageId = FormFieldStatus.empty;

  String? validateFullName(String? fullName) {
    final trimmed = fullName?.trim() ?? '';
    if (trimmed.length >= 3) {
      _fullNameStatus = FormFieldStatus.valid;
      _validateForm();
      return null;
    } else if (trimmed.isEmpty) {
      _fullNameStatus = FormFieldStatus.empty;
      _validateForm();
      return S.current.full_name_is_required;
    } else {
      _fullNameStatus = FormFieldStatus.invalid;
      _validateForm();
      return S.current.full_name_min_char;
    }
  }

  String? validateNationalCode(String? nationalCode) {
    final trimmed = nationalCode?.trim() ?? '';
    final regex = RegExp(nationalCodeRegex);
    if (trimmed.isEmpty) {
      _nationalCodeStatus = FormFieldStatus.empty;
      _validateForm();
      return S.current.national_code_required;
    } else if (regex.hasMatch(trimmed)) {
      _nationalCodeStatus = FormFieldStatus.valid;
      _validateForm();
      return null;
    } else {
      _nationalCodeStatus = FormFieldStatus.invalid;
      _validateForm();
      return S.current.national_code_not_valid;
    }
  }

  validateNationalIdImageId(int? imageId) {
    if ((imageId ?? 0) != 0) {
      _nationalIdImageId = FormFieldStatus.valid;
    } else {
      _nationalIdImageId = FormFieldStatus.invalid;
    }
    _validateForm();
  }

  validateBirthCertificateImageId(int? imageId) {
    if ((imageId ?? 0) != 0) {
      _birthCertificateImageId = FormFieldStatus.valid;
    } else {
      _birthCertificateImageId = FormFieldStatus.invalid;
    }
    _validateForm();
  }

  _validateForm() {
    if (_fullNameStatus == FormFieldStatus.valid &&
        _nationalCodeStatus == FormFieldStatus.valid &&
        _nationalIdImageId == FormFieldStatus.valid &&
        _birthCertificateImageId == FormFieldStatus.valid) {
      emit(const HomeFormValidatorState.valid());
    } else {
      emit(const HomeFormValidatorState.invalid());
    }
  }
}
