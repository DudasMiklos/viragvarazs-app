// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$BlogService extends BlogService {
  _$BlogService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = BlogService;

  @override
  Future<Response<dynamic>> getAllPosts() {
    final Uri $url = Uri.parse('blog/all');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
