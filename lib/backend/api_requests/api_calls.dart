import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'https://mothershub.org/api/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
        'password': password,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.data.token''',
      );
}

class RegisterCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? cPassword = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: 'https://mothershub.org/api/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'email': email,
        'password': password,
        'c_password': cPassword,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic rToken(dynamic response) => getJsonField(
        response,
        r'''$.data.token''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
