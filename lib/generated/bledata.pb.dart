///
//  Generated code. Do not modify.
//  source: bledata.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'bledata.pbenum.dart';

class ScanDataMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ScanDataMessage', createEmptyInstance: create)
    ..a<$core.int>(1, 'scanMode', $pb.PbFieldType.O3, protoName: 'scanMode')
    ..a<$core.int>(2, 'callbackType', $pb.PbFieldType.O3, protoName: 'callbackType')
    ..pPS(3, 'uuids')
    ..hasRequiredFields = false
  ;

  ScanDataMessage._() : super();
  factory ScanDataMessage() => create();
  factory ScanDataMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScanDataMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ScanDataMessage clone() => ScanDataMessage()..mergeFromMessage(this);
  ScanDataMessage copyWith(void Function(ScanDataMessage) updates) => super.copyWith((message) => updates(message as ScanDataMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScanDataMessage create() => ScanDataMessage._();
  ScanDataMessage createEmptyInstance() => create();
  static $pb.PbList<ScanDataMessage> createRepeated() => $pb.PbList<ScanDataMessage>();
  @$core.pragma('dart2js:noInline')
  static ScanDataMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScanDataMessage>(create);
  static ScanDataMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get scanMode => $_getIZ(0);
  @$pb.TagNumber(1)
  set scanMode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasScanMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearScanMode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get callbackType => $_getIZ(1);
  @$pb.TagNumber(2)
  set callbackType($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCallbackType() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallbackType() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get uuids => $_getList(2);
}

class BleDeviceMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BleDeviceMessage', createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'name')
    ..a<$core.int>(3, 'rssi', $pb.PbFieldType.O3)
    ..a<$core.int>(4, 'mtu', $pb.PbFieldType.O3)
    ..aOB(5, 'isConnected', protoName: 'isConnected')
    ..hasRequiredFields = false
  ;

  BleDeviceMessage._() : super();
  factory BleDeviceMessage() => create();
  factory BleDeviceMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BleDeviceMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BleDeviceMessage clone() => BleDeviceMessage()..mergeFromMessage(this);
  BleDeviceMessage copyWith(void Function(BleDeviceMessage) updates) => super.copyWith((message) => updates(message as BleDeviceMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BleDeviceMessage create() => BleDeviceMessage._();
  BleDeviceMessage createEmptyInstance() => create();
  static $pb.PbList<BleDeviceMessage> createRepeated() => $pb.PbList<BleDeviceMessage>();
  @$core.pragma('dart2js:noInline')
  static BleDeviceMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BleDeviceMessage>(create);
  static BleDeviceMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rssi => $_getIZ(2);
  @$pb.TagNumber(3)
  set rssi($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRssi() => $_has(2);
  @$pb.TagNumber(3)
  void clearRssi() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get mtu => $_getIZ(3);
  @$pb.TagNumber(4)
  set mtu($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMtu() => $_has(3);
  @$pb.TagNumber(4)
  void clearMtu() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isConnected => $_getBF(4);
  @$pb.TagNumber(5)
  set isConnected($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsConnected() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsConnected() => clearField(5);
}

class ScanResultMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ScanResultMessage', createEmptyInstance: create)
    ..aOM<BleDeviceMessage>(1, 'bleDeviceMessage', protoName: 'bleDeviceMessage', subBuilder: BleDeviceMessage.create)
    ..a<$core.int>(2, 'rssi', $pb.PbFieldType.O3)
    ..a<$fixnum.Int64>(3, 'timestampNanos', $pb.PbFieldType.OU6, protoName: 'timestampNanos', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(4, 'scanCallbackTypeMessage', $pb.PbFieldType.O3, protoName: 'scanCallbackTypeMessage')
    ..hasRequiredFields = false
  ;

  ScanResultMessage._() : super();
  factory ScanResultMessage() => create();
  factory ScanResultMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScanResultMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ScanResultMessage clone() => ScanResultMessage()..mergeFromMessage(this);
  ScanResultMessage copyWith(void Function(ScanResultMessage) updates) => super.copyWith((message) => updates(message as ScanResultMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScanResultMessage create() => ScanResultMessage._();
  ScanResultMessage createEmptyInstance() => create();
  static $pb.PbList<ScanResultMessage> createRepeated() => $pb.PbList<ScanResultMessage>();
  @$core.pragma('dart2js:noInline')
  static ScanResultMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScanResultMessage>(create);
  static ScanResultMessage _defaultInstance;

  @$pb.TagNumber(1)
  BleDeviceMessage get bleDeviceMessage => $_getN(0);
  @$pb.TagNumber(1)
  set bleDeviceMessage(BleDeviceMessage v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBleDeviceMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearBleDeviceMessage() => clearField(1);
  @$pb.TagNumber(1)
  BleDeviceMessage ensureBleDeviceMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get rssi => $_getIZ(1);
  @$pb.TagNumber(2)
  set rssi($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRssi() => $_has(1);
  @$pb.TagNumber(2)
  void clearRssi() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestampNanos => $_getI64(2);
  @$pb.TagNumber(3)
  set timestampNanos($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimestampNanos() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestampNanos() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get scanCallbackTypeMessage => $_getIZ(3);
  @$pb.TagNumber(4)
  set scanCallbackTypeMessage($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasScanCallbackTypeMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearScanCallbackTypeMessage() => clearField(4);
}

class ConnectToDeviceDataMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ConnectToDeviceDataMessage', createEmptyInstance: create)
    ..aOS(1, 'macAddress', protoName: 'macAddress')
    ..aOB(2, 'isAutoConnect', protoName: 'isAutoConnect')
    ..a<$core.int>(3, 'requestMtu', $pb.PbFieldType.O3, protoName: 'requestMtu')
    ..hasRequiredFields = false
  ;

  ConnectToDeviceDataMessage._() : super();
  factory ConnectToDeviceDataMessage() => create();
  factory ConnectToDeviceDataMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectToDeviceDataMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ConnectToDeviceDataMessage clone() => ConnectToDeviceDataMessage()..mergeFromMessage(this);
  ConnectToDeviceDataMessage copyWith(void Function(ConnectToDeviceDataMessage) updates) => super.copyWith((message) => updates(message as ConnectToDeviceDataMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConnectToDeviceDataMessage create() => ConnectToDeviceDataMessage._();
  ConnectToDeviceDataMessage createEmptyInstance() => create();
  static $pb.PbList<ConnectToDeviceDataMessage> createRepeated() => $pb.PbList<ConnectToDeviceDataMessage>();
  @$core.pragma('dart2js:noInline')
  static ConnectToDeviceDataMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectToDeviceDataMessage>(create);
  static ConnectToDeviceDataMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get macAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set macAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMacAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearMacAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAutoConnect => $_getBF(1);
  @$pb.TagNumber(2)
  set isAutoConnect($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsAutoConnect() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAutoConnect() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get requestMtu => $_getIZ(2);
  @$pb.TagNumber(3)
  set requestMtu($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRequestMtu() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequestMtu() => clearField(3);
}

class ServiceMessages extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ServiceMessages', createEmptyInstance: create)
    ..pc<ServiceMessage>(1, 'serviceMessages', $pb.PbFieldType.PM, protoName: 'serviceMessages', subBuilder: ServiceMessage.create)
    ..hasRequiredFields = false
  ;

  ServiceMessages._() : super();
  factory ServiceMessages() => create();
  factory ServiceMessages.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceMessages.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ServiceMessages clone() => ServiceMessages()..mergeFromMessage(this);
  ServiceMessages copyWith(void Function(ServiceMessages) updates) => super.copyWith((message) => updates(message as ServiceMessages));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServiceMessages create() => ServiceMessages._();
  ServiceMessages createEmptyInstance() => create();
  static $pb.PbList<ServiceMessages> createRepeated() => $pb.PbList<ServiceMessages>();
  @$core.pragma('dart2js:noInline')
  static ServiceMessages getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceMessages>(create);
  static ServiceMessages _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ServiceMessage> get serviceMessages => $_getList(0);
}

class ServiceMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ServiceMessage', createEmptyInstance: create)
    ..a<$core.double>(1, 'id', $pb.PbFieldType.OD)
    ..aOS(2, 'uuid')
    ..aOM<BleDeviceMessage>(3, 'device', subBuilder: BleDeviceMessage.create)
    ..aOB(4, 'isPrimary', protoName: 'isPrimary')
    ..hasRequiredFields = false
  ;

  ServiceMessage._() : super();
  factory ServiceMessage() => create();
  factory ServiceMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ServiceMessage clone() => ServiceMessage()..mergeFromMessage(this);
  ServiceMessage copyWith(void Function(ServiceMessage) updates) => super.copyWith((message) => updates(message as ServiceMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServiceMessage create() => ServiceMessage._();
  ServiceMessage createEmptyInstance() => create();
  static $pb.PbList<ServiceMessage> createRepeated() => $pb.PbList<ServiceMessage>();
  @$core.pragma('dart2js:noInline')
  static ServiceMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceMessage>(create);
  static ServiceMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => clearField(2);

  @$pb.TagNumber(3)
  BleDeviceMessage get device => $_getN(2);
  @$pb.TagNumber(3)
  set device(BleDeviceMessage v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDevice() => $_has(2);
  @$pb.TagNumber(3)
  void clearDevice() => clearField(3);
  @$pb.TagNumber(3)
  BleDeviceMessage ensureDevice() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get isPrimary => $_getBF(3);
  @$pb.TagNumber(4)
  set isPrimary($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsPrimary() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsPrimary() => clearField(4);
}

class CharacteristicMessages extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CharacteristicMessages', createEmptyInstance: create)
    ..pc<CharacteristicMessage>(1, 'characteristicMessage', $pb.PbFieldType.PM, protoName: 'characteristicMessage', subBuilder: CharacteristicMessage.create)
    ..hasRequiredFields = false
  ;

  CharacteristicMessages._() : super();
  factory CharacteristicMessages() => create();
  factory CharacteristicMessages.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CharacteristicMessages.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CharacteristicMessages clone() => CharacteristicMessages()..mergeFromMessage(this);
  CharacteristicMessages copyWith(void Function(CharacteristicMessages) updates) => super.copyWith((message) => updates(message as CharacteristicMessages));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CharacteristicMessages create() => CharacteristicMessages._();
  CharacteristicMessages createEmptyInstance() => create();
  static $pb.PbList<CharacteristicMessages> createRepeated() => $pb.PbList<CharacteristicMessages>();
  @$core.pragma('dart2js:noInline')
  static CharacteristicMessages getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CharacteristicMessages>(create);
  static CharacteristicMessages _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<CharacteristicMessage> get characteristicMessage => $_getList(0);
}

class CharacteristicMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CharacteristicMessage', createEmptyInstance: create)
    ..a<$core.double>(1, 'id', $pb.PbFieldType.OD)
    ..aOS(2, 'uuid')
    ..a<$core.int>(3, 'serviceId', $pb.PbFieldType.O3, protoName: 'serviceId')
    ..aOS(4, 'serviceUuid', protoName: 'serviceUuid')
    ..aOS(5, 'deviceId', protoName: 'deviceId')
    ..aOB(6, 'isReadable', protoName: 'isReadable')
    ..aOB(7, 'isWritableWithResponse', protoName: 'isWritableWithResponse')
    ..aOB(8, 'isWritableWithoutResponse', protoName: 'isWritableWithoutResponse')
    ..aOB(9, 'isNotificable', protoName: 'isNotificable')
    ..aOB(10, 'isIndicatable', protoName: 'isIndicatable')
    ..aOB(11, 'isNotifing', protoName: 'isNotifing')
    ..aOS(12, 'value')
    ..hasRequiredFields = false
  ;

  CharacteristicMessage._() : super();
  factory CharacteristicMessage() => create();
  factory CharacteristicMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CharacteristicMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CharacteristicMessage clone() => CharacteristicMessage()..mergeFromMessage(this);
  CharacteristicMessage copyWith(void Function(CharacteristicMessage) updates) => super.copyWith((message) => updates(message as CharacteristicMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CharacteristicMessage create() => CharacteristicMessage._();
  CharacteristicMessage createEmptyInstance() => create();
  static $pb.PbList<CharacteristicMessage> createRepeated() => $pb.PbList<CharacteristicMessage>();
  @$core.pragma('dart2js:noInline')
  static CharacteristicMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CharacteristicMessage>(create);
  static CharacteristicMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUuid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get serviceId => $_getIZ(2);
  @$pb.TagNumber(3)
  set serviceId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasServiceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearServiceId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get serviceUuid => $_getSZ(3);
  @$pb.TagNumber(4)
  set serviceUuid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasServiceUuid() => $_has(3);
  @$pb.TagNumber(4)
  void clearServiceUuid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get deviceId => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeviceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceId() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isReadable => $_getBF(5);
  @$pb.TagNumber(6)
  set isReadable($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsReadable() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsReadable() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isWritableWithResponse => $_getBF(6);
  @$pb.TagNumber(7)
  set isWritableWithResponse($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsWritableWithResponse() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsWritableWithResponse() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isWritableWithoutResponse => $_getBF(7);
  @$pb.TagNumber(8)
  set isWritableWithoutResponse($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsWritableWithoutResponse() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsWritableWithoutResponse() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isNotificable => $_getBF(8);
  @$pb.TagNumber(9)
  set isNotificable($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsNotificable() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsNotificable() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isIndicatable => $_getBF(9);
  @$pb.TagNumber(10)
  set isIndicatable($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsIndicatable() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsIndicatable() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isNotifing => $_getBF(10);
  @$pb.TagNumber(11)
  set isNotifing($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasIsNotifing() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsNotifing() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get value => $_getSZ(11);
  @$pb.TagNumber(12)
  set value($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasValue() => $_has(11);
  @$pb.TagNumber(12)
  void clearValue() => clearField(12);
}

class MonitorCharacteristicMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MonitorCharacteristicMessage', createEmptyInstance: create)
    ..aOS(1, 'transactionId', protoName: 'transactionId')
    ..aOM<CharacteristicMessage>(2, 'characteristicMessage', protoName: 'characteristicMessage', subBuilder: CharacteristicMessage.create)
    ..hasRequiredFields = false
  ;

  MonitorCharacteristicMessage._() : super();
  factory MonitorCharacteristicMessage() => create();
  factory MonitorCharacteristicMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MonitorCharacteristicMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MonitorCharacteristicMessage clone() => MonitorCharacteristicMessage()..mergeFromMessage(this);
  MonitorCharacteristicMessage copyWith(void Function(MonitorCharacteristicMessage) updates) => super.copyWith((message) => updates(message as MonitorCharacteristicMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MonitorCharacteristicMessage create() => MonitorCharacteristicMessage._();
  MonitorCharacteristicMessage createEmptyInstance() => create();
  static $pb.PbList<MonitorCharacteristicMessage> createRepeated() => $pb.PbList<MonitorCharacteristicMessage>();
  @$core.pragma('dart2js:noInline')
  static MonitorCharacteristicMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MonitorCharacteristicMessage>(create);
  static MonitorCharacteristicMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transactionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => clearField(1);

  @$pb.TagNumber(2)
  CharacteristicMessage get characteristicMessage => $_getN(1);
  @$pb.TagNumber(2)
  set characteristicMessage(CharacteristicMessage v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCharacteristicMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearCharacteristicMessage() => clearField(2);
  @$pb.TagNumber(2)
  CharacteristicMessage ensureCharacteristicMessage() => $_ensure(1);
}

