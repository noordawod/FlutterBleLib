part of blemulator;

class SimulatedCharacteristic {
  final String uuid;
  final int id;
  SimulatedService service;
  Uint8List value;
  final String convenienceName;

  StreamController<Uint8List> _streamController;

  SimulatedCharacteristic(
      {@required this.uuid, @required this.value, this.convenienceName})
      : id = IdGenerator().nextId();

  void attachToService(SimulatedService service) => this.service = service;

  Uint8List read() => value;

  void write(Uint8List value) {
    this.value = value;
    if (_streamController?.hasListener == true)
      _streamController.sink.add(value);
  }

  Stream<Uint8List> monitor() {
    if (_streamController == null) {
      _streamController = StreamController(onCancel: () {
        _streamController.close();
        _streamController = null;
      });
    }
    return _streamController.stream.asBroadcastStream();
  }
}
