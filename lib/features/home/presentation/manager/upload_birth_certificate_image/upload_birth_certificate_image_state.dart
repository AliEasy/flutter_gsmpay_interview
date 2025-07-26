part of 'upload_birth_certificate_image_cubit.dart';

@freezed
class UploadBirthCertificateImageState with _$UploadBirthCertificateImageState {
  const factory UploadBirthCertificateImageState.initial() = _Initial;
  const factory UploadBirthCertificateImageState.loading() = _Loading;
  const factory UploadBirthCertificateImageState.success({required int imageId}) = _Success;
  const factory UploadBirthCertificateImageState.failure({String? message}) = _Failure;
}
