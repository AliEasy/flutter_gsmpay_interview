part of 'upload_national_id_image_cubit.dart';

@freezed
class UploadNationalIdImageState with _$UploadNationalIdImageState {
  const factory UploadNationalIdImageState.initial() = _Initial;
  const factory UploadNationalIdImageState.loading() = _Loading;
  const factory UploadNationalIdImageState.success({required int imageId}) = _Success;
  const factory UploadNationalIdImageState.failure({String? message}) = _Failure;
}
