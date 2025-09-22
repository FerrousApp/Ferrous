import 'package:dio/dio.dart';
import 'package:ferrous/global/client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInWithEmailProvider =
    FutureProvider.family<String, String>((ref, email) async {
  final response = await FerrousClient().dio.post(
        "/auth/initiate",
        data: {"email": email},
        options: Options(
          contentType: "application/json",
        ),
      );

  return response.data["message"];
});
