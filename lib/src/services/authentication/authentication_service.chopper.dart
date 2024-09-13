// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AuthenticationService extends AuthenticationService {
  _$AuthenticationService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AuthenticationService;

  @override
  Future<Response<dynamic>> login({
    required String email,
    required String password,
  }) {
    final Uri $url = Uri.parse('login');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>(
        'email',
        email,
      ),
      PartValue<String>(
        'password',
        password,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUser() {
    final Uri $url = Uri.parse('user');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
