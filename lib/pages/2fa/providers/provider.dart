import 'package:dio/dio.dart';
import 'package:ferrous/global/client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final verifyOTPEmailProvider =
    FutureProvider.family<Map<String, dynamic>, Map<String, String>>(
        (ref, args) async {
  final response = await FerrousClient().dio.post(
        "/auth/verify",
        data: {"email": args["email"], "otp": args["otp"]},
        options: Options(
          contentType: "application/json",
        ),
      );

  return response.data;
});
