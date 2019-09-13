part of flutter_ble_lib;

typedef RestoreStateAction = Function(List<Device> restoreStateIdentifier);

class BleManager {
  FlutterBleLib _bleLib;

  BleManager() {
    _bleLib = FlutterBleLib();
  }

  Future<void> createClient({
    String restoreStateIdentifier,
    RestoreStateAction restoreStateAction,
  }) {
    if (restoreStateAction != null) {
      _bleLib.restoredState().then((devices) {
        restoreStateAction(devices);
      });
    }
    return _bleLib.createClient(restoreStateIdentifier);
  }

  Future<void> destroyClient() => _bleLib.destroyClient();

  Stream<ScanResult> startDeviceScan({
    int scanMode = ScanMode.LOW_POWER,
    int callbackType = CallbackType.ALL_MATCHES,
    List<String> uuids,
  }) => _bleLib.startDeviceScan(scanMode, callbackType, uuids);

  Future<void> stopDeviceScan() => _bleLib.stopDeviceScan();
}
