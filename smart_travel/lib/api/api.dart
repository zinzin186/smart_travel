import 'package:dio/dio.dart';

class ApiService {
  static Dio? _dio;
  String baseUrl;
  final String langCode = "vi";
  late Options requestOptions;

  ApiService(this.baseUrl, {
    Duration timeout = const Duration(seconds: 60),
  }) {
    requestOptions = Options(
      receiveDataWhenStatusError: true,
      // receiveTimeout: timeout.inMilliseconds,
    );

    _setupDio();
  }

  void _setupDio() {
    if (_dio != null) return;

    // create dio instance with options above
    _dio = Dio();

    // inject interceptors, if there is no passed so the default is [AuthenticationInterceptor]
    // _dio?.interceptors.addAll([AuthenticationInterceptor()]);
    // // inject network logger
    // _dio?.interceptors.add(LoggerInterceptor());
    // // Inject token 401 interceptor
    // _dio?.interceptors.add(TokenInterceptor(_dio!));
  }

  Future<Response<T>> getData<T>({
    required String endPoint,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    if (query != null) {
      query["lang_code"] = langCode;
    } else {
      query = {
        "lang_code": langCode,
      };
    }
    try {
      Response<T> response = await _dio!.get<T>(baseUrl + endPoint,
          queryParameters: query,
          cancelToken: cancelToken,
          options: requestOptions);
      return response;
    } catch (e) {
      throw _parseError(e);
    }
  }

  Future<Response<T>> getContent<T>({
    required String contentLink,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    try {
      if (query != null) {
        query["lang_code"] = langCode;
      } else {
        query = {
          "lang_code": langCode,
        };
      }
      Response<T> response = await _dio!.get<T>(contentLink,
          queryParameters: query,
          cancelToken: cancelToken,
          options: requestOptions);
      return response;
    } catch (e) {
      throw _parseError(e);
    }
  }

  Future<Response<T>> postData<T>({
    required String endPoint,
    dynamic body,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response<T> response = await _dio!.post<T>(
        baseUrl + endPoint,
        queryParameters: query,
        data: body,
        cancelToken: cancelToken,
        options: requestOptions,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      throw _parseError(e);
    }
  }

  Object _parseError(Object e) {
    // if (e is DioError) {
    //   switch (e.type) {
    //   // got response error
    //     case DioErrorType.response:
    //       ResponseError? responseError;
    //       if (e.response != null) {
    //         responseError = ResponseError.fromDioResponse(e.response!);
    //       }
    //       switch (e.response?.statusCode) {
    //         case 400:
    //           throw BadRequestException(
    //               response: responseError, message: responseError?.message);
    //         case 401:
    //         case 403:
    //           throw UnauthorisedException(
    //               response: responseError, message: responseError?.message);
    //         case 405:
    //           throw MethodNotAllowedException(
    //               response: responseError, message: responseError?.message);
    //         case 500:
    //         default:
    //           throw FetchDataException(
    //               response: responseError, message: responseError?.message);
    //       }
    //   // connection error
    //     default:
    //       throw e;
    //   }
    // }
    return e;
  }
}