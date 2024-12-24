import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import '../../../../data/repository_impl/auth_repo_impl.dart';
import '../../../core/api/base_response/base_response.dart';
import '../../../core/exceptions/app_exceptions.dart';
import '../../../core/exceptions/dio_exception_util.dart';
import '../../../core/locator/locator.dart';
import '../../../data/model/request/login_request_model.dart';
import '../../../data/model/response/user_profile_response.dart';
part 'auth_store.g.dart';


class AuthStore = _AuthStoreBase with _$AuthStore;
abstract class _AuthStoreBase with Store {
  late StreamSubscription<ConnectivityResult> _subscription;
  @observable
  BaseResponse<UserData?>? loginResponse;

  @observable
  BaseResponse? logoutResponse;

  @observable
  String? errorMessage;

  // Currently selected user (for example, to focus the view)
  @observable
  int? selectedUserId = 0;

  @observable
  int? selectedRemoteUserIdForFocus = null;



  @observable
  bool isBluetoothHeadphoneConnected = false;

  @observable
  String connectedDeviceName = "None";

  // Observable for connection status
  @observable
  String networkStatus = "Connected";

  @observable
  bool isMuted = false; // Tracks microphone mute/unmute state

  @observable
  bool onSpeaker = true; // Tracks speakerphone toggle state

  @observable
  int? _streamId;
  // Observable to track the current page index
  @observable
  int currentPageIndex = 0;

  @observable
  ObservableList<Widget> list = ObservableList<Widget>();

  final GoogleSignIn googleSignIn = GoogleSignIn();




  _AuthStoreBase();




  @action
  Future login(LoginRequestModel request) async {
    try {
      errorMessage = null;
      await Future.delayed(const Duration(seconds: 5), () {});
      loginResponse = BaseResponse(message: "Login successfully", code: "1");
    } on DioException catch (dioError) {
      errorMessage = DioExceptionUtil.handleError(dioError);
    } on AppException catch (e) {
      errorMessage = e.toString();
    } catch (e, st) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: st);
      errorMessage = e.toString();
    }
  }

  @action
  void resetSelectedUser() {
    selectedUserId = null;
  }


  // Initialize connectivity monitoring
  @action
  void startMonitoring() {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      switch (result) {
        case ConnectivityResult.none:
          updateNetworkStatus("Disconnected");
          break;
        case ConnectivityResult.mobile:
          updateNetworkStatus("Mobile Data");
          break;
        case ConnectivityResult.wifi:
          updateNetworkStatus("Wi-Fi");
          break;
        default:
          updateNetworkStatus("Unknown");
      }
    });
  }

  // Stop connectivity monitoring
  @action
  void stopMonitoring() {
    _subscription.cancel();
  }

  // Update network status
  @action
  void updateNetworkStatus(String status) {
    networkStatus = status;
  }

  @action
  Future logout() async {
    try {
      errorMessage = null;
      var commonStoreFuture = ObservableFuture<BaseResponse>(authRepo.logout());
      logoutResponse = await commonStoreFuture;
    } on DioException catch (dioError) {
      errorMessage = DioExceptionUtil.handleError(dioError);
    } on AppException catch (e) {
      errorMessage = e.toString();
    } catch (e, st) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: st);
      errorMessage = e.toString();
    }
  }

}

final authStore = locator<AuthStore>();
final storage = new FlutterSecureStorage();
