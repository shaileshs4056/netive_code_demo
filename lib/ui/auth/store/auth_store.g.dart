// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  late final _$loginResponseAtom =
      Atom(name: '_AuthStoreBase.loginResponse', context: context);

  @override
  BaseResponse<UserData?>? get loginResponse {
    _$loginResponseAtom.reportRead();
    return super.loginResponse;
  }

  @override
  set loginResponse(BaseResponse<UserData?>? value) {
    _$loginResponseAtom.reportWrite(value, super.loginResponse, () {
      super.loginResponse = value;
    });
  }

  late final _$logoutResponseAtom =
      Atom(name: '_AuthStoreBase.logoutResponse', context: context);

  @override
  BaseResponse<dynamic>? get logoutResponse {
    _$logoutResponseAtom.reportRead();
    return super.logoutResponse;
  }

  @override
  set logoutResponse(BaseResponse<dynamic>? value) {
    _$logoutResponseAtom.reportWrite(value, super.logoutResponse, () {
      super.logoutResponse = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_AuthStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$selectedUserIdAtom =
      Atom(name: '_AuthStoreBase.selectedUserId', context: context);

  @override
  int? get selectedUserId {
    _$selectedUserIdAtom.reportRead();
    return super.selectedUserId;
  }

  @override
  set selectedUserId(int? value) {
    _$selectedUserIdAtom.reportWrite(value, super.selectedUserId, () {
      super.selectedUserId = value;
    });
  }

  late final _$selectedRemoteUserIdForFocusAtom = Atom(
      name: '_AuthStoreBase.selectedRemoteUserIdForFocus', context: context);

  @override
  int? get selectedRemoteUserIdForFocus {
    _$selectedRemoteUserIdForFocusAtom.reportRead();
    return super.selectedRemoteUserIdForFocus;
  }

  @override
  set selectedRemoteUserIdForFocus(int? value) {
    _$selectedRemoteUserIdForFocusAtom
        .reportWrite(value, super.selectedRemoteUserIdForFocus, () {
      super.selectedRemoteUserIdForFocus = value;
    });
  }

  late final _$isBluetoothHeadphoneConnectedAtom = Atom(
      name: '_AuthStoreBase.isBluetoothHeadphoneConnected', context: context);

  @override
  bool get isBluetoothHeadphoneConnected {
    _$isBluetoothHeadphoneConnectedAtom.reportRead();
    return super.isBluetoothHeadphoneConnected;
  }

  @override
  set isBluetoothHeadphoneConnected(bool value) {
    _$isBluetoothHeadphoneConnectedAtom
        .reportWrite(value, super.isBluetoothHeadphoneConnected, () {
      super.isBluetoothHeadphoneConnected = value;
    });
  }

  late final _$connectedDeviceNameAtom =
      Atom(name: '_AuthStoreBase.connectedDeviceName', context: context);

  @override
  String get connectedDeviceName {
    _$connectedDeviceNameAtom.reportRead();
    return super.connectedDeviceName;
  }

  @override
  set connectedDeviceName(String value) {
    _$connectedDeviceNameAtom.reportWrite(value, super.connectedDeviceName, () {
      super.connectedDeviceName = value;
    });
  }

  late final _$networkStatusAtom =
      Atom(name: '_AuthStoreBase.networkStatus', context: context);

  @override
  String get networkStatus {
    _$networkStatusAtom.reportRead();
    return super.networkStatus;
  }

  @override
  set networkStatus(String value) {
    _$networkStatusAtom.reportWrite(value, super.networkStatus, () {
      super.networkStatus = value;
    });
  }

  late final _$isMutedAtom =
      Atom(name: '_AuthStoreBase.isMuted', context: context);

  @override
  bool get isMuted {
    _$isMutedAtom.reportRead();
    return super.isMuted;
  }

  @override
  set isMuted(bool value) {
    _$isMutedAtom.reportWrite(value, super.isMuted, () {
      super.isMuted = value;
    });
  }

  late final _$onSpeakerAtom =
      Atom(name: '_AuthStoreBase.onSpeaker', context: context);

  @override
  bool get onSpeaker {
    _$onSpeakerAtom.reportRead();
    return super.onSpeaker;
  }

  @override
  set onSpeaker(bool value) {
    _$onSpeakerAtom.reportWrite(value, super.onSpeaker, () {
      super.onSpeaker = value;
    });
  }

  late final _$_streamIdAtom =
      Atom(name: '_AuthStoreBase._streamId', context: context);

  @override
  int? get _streamId {
    _$_streamIdAtom.reportRead();
    return super._streamId;
  }

  @override
  set _streamId(int? value) {
    _$_streamIdAtom.reportWrite(value, super._streamId, () {
      super._streamId = value;
    });
  }

  late final _$currentPageIndexAtom =
      Atom(name: '_AuthStoreBase.currentPageIndex', context: context);

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(value, super.currentPageIndex, () {
      super.currentPageIndex = value;
    });
  }

  late final _$listAtom = Atom(name: '_AuthStoreBase.list', context: context);

  @override
  ObservableList<Widget> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Widget> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthStoreBase.login', context: context);

  @override
  Future<dynamic> login(LoginRequestModel request) {
    return _$loginAsyncAction.run(() => super.login(request));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthStoreBase.logout', context: context);

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase', context: context);

  @override
  void resetSelectedUser() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.resetSelectedUser');
    try {
      return super.resetSelectedUser();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startMonitoring() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.startMonitoring');
    try {
      return super.startMonitoring();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopMonitoring() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.stopMonitoring');
    try {
      return super.stopMonitoring();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNetworkStatus(String status) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.updateNetworkStatus');
    try {
      return super.updateNetworkStatus(status);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loginResponse: ${loginResponse},
logoutResponse: ${logoutResponse},
errorMessage: ${errorMessage},
selectedUserId: ${selectedUserId},
selectedRemoteUserIdForFocus: ${selectedRemoteUserIdForFocus},
isBluetoothHeadphoneConnected: ${isBluetoothHeadphoneConnected},
connectedDeviceName: ${connectedDeviceName},
networkStatus: ${networkStatus},
isMuted: ${isMuted},
onSpeaker: ${onSpeaker},
currentPageIndex: ${currentPageIndex},
list: ${list}
    ''';
  }
}
