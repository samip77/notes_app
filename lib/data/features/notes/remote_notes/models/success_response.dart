// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'success_response.freezed.dart';
part 'success_response.g.dart';

@freezed
class SuccessResponse with _$SuccessResponse {
  const factory SuccessResponse({
    required bool success,
  }) = _SuccessResponse;

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessResponseFromJson(json);
}
