import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter_gsmpay_interview/features/home/domain/use_case/upload_national_id_image_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_national_id_image_state.dart';

part 'upload_national_id_image_cubit.freezed.dart';

@injectable
class UploadNationalIdImageCubit extends Cubit<UploadNationalIdImageState> {
  final UploadNationalIdImageUseCase _uploadNationalIdImageUseCase;

  UploadNationalIdImageCubit(this._uploadNationalIdImageUseCase)
    : super(const UploadNationalIdImageState.initial());

  upload(XFile image) async {
    emit(const UploadNationalIdImageState.loading());
    final result = await _uploadNationalIdImageUseCase.call(
      await image.readAsBytes(),
    );
    result.whenOrNull(
      success: (data) {
        emit(UploadNationalIdImageState.success(imageId: data ?? 0));
      },
      failure: (message) {
        emit(UploadNationalIdImageState.failure(message: message));
      },
    );
  }
}
