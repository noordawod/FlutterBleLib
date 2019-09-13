part of flutter_ble_lib;

class MethodName {
  static const String CREATE_CLIENT = "createClient";
  static const String DESTROY_CLIENT = "destroyClient";
  static const String START_DEVICE_SCAN = "startDeviceScan";
  static const String STOP_DEVICE_SCAN = "stopDeviceScan";
  static const String CONNECT_TO_DEVICE = "connectToDevice";
  static const String IS_DEVICE_CONNECTED = "isDeviceConnected";
  static const String OBSERVE_CONNECTION_STATE = "observeConnectionState";
  static const String CANCEL_CONNECTION = "cancelConnection";
}

class ChannelName {
  static const String FLUTTER_BLE_LIB = "flutter_ble_lib";
  static const String STATE_RESTORE_EVENTS =
      FLUTTER_BLE_LIB + "/stateRestoreEvents";
  static const String SCANNING_EVENTS = FLUTTER_BLE_LIB + "/scanningEvents";
  static const String CONNECTION_STATE_CHANGE_EVENTS = FLUTTER_BLE_LIB +
      "/connectionStateChangeEvents";
}

class ArgumentName {
  static const String RESTORE_STATE_IDENTIFIER = "restoreStateIdentifier";
  static const String SCAN_MODE = "scanMode";
  static const String CALLBACK_TYPE = "callbackType";
  static const String UUIDS = "uuids";

  static const String DEVICE_IDENTIFIER = "deviceIdentifier";
  static const String IS_AUTO_CONNECT = "isAutoConnect";
  static const String REQUESTU_MTU = "requestMtu";
  static const String REFRESH_GATT = "refreshGatt";
  static const String TIMEOUT_MILLIS = "timeoutMillis";
  static const String EMIT_CURRENT_VALUE = "emitCurrentValue";
}

abstract class ScanMode {
  static const int OPPORTUNISTIC = -1;
  static const int LOW_POWER = 0;
  static const int BALANCED = 1;
  static const int LOW_LATENCY = 2;
}

abstract class CallbackType {
  static const int ALL_MATCHES = 1;
  static const int FIRST_MATCH = 2;
  static const int MATCH_LOST = 4;
}

abstract class NativeConnectionState {
  static const String CONNECTING = "connecting";
  static const String CONNECTED = "connected";
  static const String DISCONNECTING = "disconnecting";
  static const String DISCONNECTED = "disconnected";
}