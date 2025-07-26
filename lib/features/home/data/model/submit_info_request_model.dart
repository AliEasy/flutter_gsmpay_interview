class SubmitInfoRequestModel {
  final String name;
  final String nationalCode;
  final int salary;
  final String nationalCardImageId;
  final String birthCertificateImageId;

  SubmitInfoRequestModel({
    required this.name,
    required this.nationalCode,
    required this.salary,
    required this.nationalCardImageId,
    required this.birthCertificateImageId,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['nationalCode'] = nationalCode;
    map['salary'] = salary;
    map['nationalCardImageId'] = nationalCardImageId;
    map['birthCertificateImageId'] = birthCertificateImageId;
    return map;
  }
}
