part of flutter_ble_lib;

abstract class FlutterBLE {
  InternalBleManager _manager;

  final MethodChannel _methodChannel =
  const MethodChannel(ChannelName.FLUTTER_BLE_LIB);
}

class FlutterBleLib extends FlutterBLE with DeviceConnectionMixin {
  final EventChannel _restoreStateEventChannel =
      const EventChannel(ChannelName.STATE_RESTORE_EVENTS);

  final EventChannel _scanEventChannel =
      const EventChannel(ChannelName.SCANNING_EVENTS);

  void registerManager(InternalBleManager manager) {
    _manager = manager;
  }

  Future<List<Peripheral>> restoredState() => _restoreStateEventChannel
      .receiveBroadcastStream()
      .map(
        (jsonString) {
          if (jsonString == null)
            return null;
          else
            return [
              Peripheral.fromJson(jsonDecode(jsonString), _manager)
            ]; //TODO Add proper mapping from json here (11.09.2019)
        },
      )
      .take(1)
      .single;

  Future<void> createClient(String restoreStateIdentifier) async {
    await _methodChannel.invokeMethod(
        MethodName.CREATE_CLIENT, <String, String>{
      ArgumentName.RESTORE_STATE_IDENTIFIER: restoreStateIdentifier
    });
    return;
  }

  Future<void> destroyClient() async {
    await _methodChannel.invokeMethod(MethodName.DESTROY_CLIENT);
    return;
  }

  Stream<ScanResult> startDeviceScan(
      int scanMode, int callbackType, List<String> uuids) async* {
    await _methodChannel.invokeMethod(
      MethodName.START_DEVICE_SCAN,
      <String, dynamic>{
        ArgumentName.SCAN_MODE: scanMode,
        ArgumentName.CALLBACK_TYPE: callbackType,
        ArgumentName.UUIDS: uuids
      },
    );
    yield* _scanEventChannel.receiveBroadcastStream().map((scanResultJson) {
      return ScanResult.fromJson(
        jsonDecode(scanResultJson), _manager
      );
    });
  }

  Future<void> stopDeviceScan() async {
    await _methodChannel.invokeMethod(MethodName.STOP_DEVICE_SCAN);
    return;
  }
}