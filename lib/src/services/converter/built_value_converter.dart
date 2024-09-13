import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:forest_logger/forest_logger.dart';

class BuiltValueConverter extends JsonConverter {
  static const bool forcedLogging = true;

  @override
  Request convertRequest(Request request) {
    try {
      if (forcedLogging) {
        for (var e in request.parts) {
          Forest.info("Part: ${e.name}:${e.value}");
        }
      }
      if (request.body == null) {
        return super.convertRequest(request);
      }

      try {
        if (request.body is Map) {
          Forest.info("map");
          return super.convertRequest(
            const JsonConverter().encodeJson(
              request,
            ),
          );
        }
      } catch (e) {
        Forest.error(e.toString());
      }

      return request;
    } catch (e) {
      return super.convertRequest(request);
    }
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
      Response response) async {
    try {
      final Response dynamicResponse = await super.convertResponse(
        await const JsonConverter().decodeJson(
          response,
        ),
      );
      Map<String, Object> bodyWithoutNull =
          removeNullAndEmptyParams(dynamicResponse.body);

      return dynamicResponse.copyWith(
          body: _convertToCustomObject(bodyWithoutNull));
    } catch (e) {
      Forest.error("Response parse failed");
      return super.convertResponse(response);
    }
  }

  dynamic _convertToCustomObject<SingleItemType>(dynamic element) {
    // If the type which the response should hold is explicitly set to a dynamic Map,
    // there's nothing we can convert.
    if (element is SingleItemType) {
      return element;
    }
    throw UnimplementedError();
  }

  Map<String, Object> removeNullAndEmptyParams(Map<String, Object> _mapToEdit) {
    Map<String, Object> mapToEdit = _mapToEdit;
// Remove all null values; they cause validation errors
    final keys = mapToEdit.keys.toList(growable: false);
    for (String key in keys) {
      final value = mapToEdit[key];
      if (value == null) {
        mapToEdit.remove(key);
      } else if (value is String) {
        if (value.isEmpty) {
          mapToEdit.remove(key);
        }
      } else if (value is Map) {
        mapToEdit[key] = removeNullAndEmptyParams(value as Map<String, Object>);
      } else if (value is List) {
        mapToEdit[key] = removeNullAndEmptyParamsInList(value as List<Object>);
      }
    }
    return mapToEdit;
  }

  List<Object?> removeNullAndEmptyParamsInList(List<Object?> _mapToEdit) {
    List<Object?> listToEdit = _mapToEdit;
// Remove all null values; they cause validation errors
    for (int a = 0; a < listToEdit.length; a++) {
      if (listToEdit[a] == null) {
        listToEdit.remove(listToEdit[a]);
      } else if (listToEdit[a] is String) {
        if ((listToEdit[a] as String).isEmpty) {
          listToEdit.remove(listToEdit[a]);
        }
      } else if (listToEdit[a] is Map) {
        listToEdit[a] =
            removeNullAndEmptyParams(listToEdit[a] as Map<String, Object>);
      } else if (listToEdit[a] is List) {
        listToEdit[a] =
            removeNullAndEmptyParamsInList(listToEdit[a] as List<Object>);
      }
    }
    return listToEdit;
  }
}
