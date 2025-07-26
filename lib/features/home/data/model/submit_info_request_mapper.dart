import 'package:flutter_gsmpay_interview/features/home/data/model/submit_info_request_model.dart';
import 'package:flutter_gsmpay_interview/features/home/domain/entity/submit_info_request_entity.dart';

extension OnSubmitInfoRequestEntity on SubmitInfoRequestEntity {
  SubmitInfoRequestModel mapper() {
    return SubmitInfoRequestModel(
        name: name,
        nationalCode: nationalCode,
        salary: salary,
        nationalCardImageId: nationalCardImageId,
        birthCertificateImageId: birthCertificateImageId,
    );
  }
}