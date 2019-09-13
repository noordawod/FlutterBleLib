part of flutter_ble_lib;

typedef RestoreStateAction = Function(List<Peripheral> restoreStateIdentifier);

abstract class BleManager {
  static BleManager _instance;

  static BleManager getInstance() {
    if (_instance == null) {
      _instance = InternalBleManager();
    }

    return _instance;
  }

  Future<void> createClient({
    String restoreStateIdentifier,
    RestoreStateAction restoreStateAction,
  });

  Future<void> destroyClient();

  Stream<ScanResult> startDeviceScan({
    int scanMode = ScanMode.LOW_POWER,
    int callbackType = CallbackType.ALL_MATCHES,
    List<String> uuids,
  });

  Future<void> stopDeviceScan();
}
