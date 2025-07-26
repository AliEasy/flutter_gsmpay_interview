class SubmitInfoRequestEntity {
  final String name;
  final String nationalCode;
  final int salary;
  final String nationalCardImageId;
  final String birthCertificateImageId;

  SubmitInfoRequestEntity({
    required this.name,
    required this.nationalCode,
    required this.salary,
    required this.nationalCardImageId,
    required this.birthCertificateImageId,
  });
}
