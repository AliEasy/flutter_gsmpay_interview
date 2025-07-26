import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter_gsmpay_interview/features/home/domain/use_case/upload_birth_certificate_image_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_birth_certificate_image_state.dart';

part 'upload_birth_certificate_image_cubit.freezed.dart';

@injectable
class UploadBirthCertificateImageCubit
    extends Cubit<UploadBirthCertificateImageState> {
  final UploadBirthCertificateImageUseCase _uploadBirthCertificateImageUseCase;

  UploadBirthCertificateImageCubit(this._uploadBirthCertificateImageUseCase)
    : super(const UploadBirthCertificateImageState.initial());

  upload(XFile image) async {
    emit(const UploadBirthCertificateImageState.loading());
    final result = await _uploadBirthCertificateImageUseCase.call(
      await image.readAsBytes(),
    );
    result.whenOrNull(
      success: (data) {
        emit(UploadBirthCertificateImageState.success(imageId: data ?? 0));
      },
      failure: (message) {
        emit(UploadBirthCertificateImageState.failure(message: message));
      },
    );
  }
}
