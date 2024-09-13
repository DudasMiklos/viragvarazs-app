// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CategoryService extends CategoryService {
  _$CategoryService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CategoryService;

  @override
  Future<Response<dynamic>> getAllTotalCategories() {
    final Uri $url = Uri.parse('category/all');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCategoryProducts({required int id}) {
    final Uri $url = Uri.parse('category/products');
    final List<PartValue> $parts = <PartValue>[
      PartValue<int>(
        'id',
        id,
      )
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
}
