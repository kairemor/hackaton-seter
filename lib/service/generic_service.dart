import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../model/ExceptionMessage.dart';

class GenericService {
  var client = http.Client();
  //late final UserDetails userDetails;
  Future<dynamic> createItem<T>(T item, final String path) async {
    var url = Uri.parse(path);
    String body = jsonEncode(item);
    Map<String, String> headers = {"Content-Type": "application/json"};
    try {
      http.Response response = await client.post(
          url,
          headers: headers,
          body: body
      ).timeout(const Duration(seconds: 45));
      var status = response.statusCode;
      if (status == 201) {
        Map responseMap = jsonDecode(response.body);
        return responseMap;
      } else {
        ExceptionMessage exceptionMessage = ExceptionMessage(statusCode: status, message: "Error occur item not added");
        return exceptionMessage;
      }
    }
    on SocketException {
      ExceptionMessage exceptionMessage = ExceptionMessage(statusCode: 503, message: "Connection Error");
      return exceptionMessage;
    }
    on TimeoutException catch(e) {
      return ExceptionMessage(statusCode: 599, message: e.message);
    } catch (_, exception) {
      return ExceptionMessage(statusCode: 500, message: exception.toString());
    }
  }

  Future<dynamic> updateItem<T>(T item, final String rootPath, String endingPath) async {
    var url = Uri.parse('$rootPath/$endingPath');
    String body = jsonEncode(item);
    Map<String, String> headers = {"Content-Type": "application/json"};;
    try {
      http.Response response = await client.put(
          url,
          headers: headers,
          body: body
      ).timeout(const Duration(seconds: 45));
      var status = response.statusCode;
      if ((status == 201) || (status == 200) ) {
        Map responseMap = jsonDecode(response.body);
        return responseMap;
      } else {
        ExceptionMessage exceptionMessage = ExceptionMessage(statusCode: status, message: "Error occur item not added");
        return exceptionMessage;
      }
    }
    on SocketException {
      ExceptionMessage exceptionMessage = ExceptionMessage(statusCode: 503, message: "Connection Error");
      return exceptionMessage;
    }
    on TimeoutException catch(e) {
      return ExceptionMessage(statusCode: 599, message: e.message);
    } catch (_, exception) {
      return ExceptionMessage(statusCode: 500, message: exception.toString());
    }
  }

  Future<dynamic> delete<T>(final String itemUUID, final String path) async {
    var url = Uri.parse('$path/$itemUUID');
    Map<String, String> headers = {"Content-Type": "application/json"};;
    try {
      http.Response response = await client.delete(
          url,
          headers: headers
      ).timeout(const Duration(seconds: 60));
      var status = response.statusCode;
      if(status == 200) {
        Map responseMap = jsonDecode(response.body);
        responseMap["statusCode"] = status;
        return CustomMessage.fromJson(responseMap);
      } else {
        Map responseMap = jsonDecode(response.body);
        responseMap["statusCode"] = status;
        return ExceptionMessage.fromJson(responseMap);
      }
    }
    on SocketException {
      ExceptionMessage exceptionMessage = ExceptionMessage(statusCode: 503, message: "Connection Error");
      return exceptionMessage;
    }
    on TimeoutException catch(e) {
      return ExceptionMessage(statusCode: 599, message: e.message);
    } catch (_, exception) {
      return ExceptionMessage(statusCode: 500, message: exception.toString());
    }
  }

  Future fetchAllData<T>(final String path) async {
    var url = Uri.parse(path);
    //userDetails = await ApiAuth().retrieveUserDetails();
    //final String? token = userDetails.accessToken;
    Map<String, String> headers = {"Content-Type": "application/json"};
    //headers.addEntries({"Authorization": 'Bearer $token'}.entries);
    try {
      http.Response response = await client.get(
          url,
          headers: headers
      ).timeout(const Duration(seconds: 60));
      var status = response.statusCode;
      if (status == 200) {
        final responseMap = jsonDecode(response.body).cast<Map<String, dynamic>>();
        return responseMap;
      } else {
        Map responseMap = jsonDecode(response.body);
        return ExceptionMessage.fromJson(responseMap);
      }
    }
    on TimeoutException catch(e) {
      return ExceptionMessage(statusCode: 599, message: e.message);
    }
    on SocketException {
      return ExceptionMessage(statusCode: 503, message: "Connection Error");
    }
    catch(_, exception) {
      return ExceptionMessage(statusCode: 500, message: exception.toString());
    }
  }
}