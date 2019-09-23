package com.polidea.flutter_ble_lib.delegate;

import android.support.annotation.NonNull;

import com.polidea.flutter_ble_lib.CharacteristicsResponse;
import com.polidea.flutter_ble_lib.SafeMainThreadResolver;
import com.polidea.flutter_ble_lib.constant.ArgumentKey;
import com.polidea.flutter_ble_lib.constant.MethodName;
import com.polidea.flutter_ble_lib.converter.CharacteristicsResponseJsonConverter;
import com.polidea.flutter_ble_lib.event.CharacteristicsMonitorStreamHandler;
import com.polidea.multiplatformbleadapter.BleAdapter;
import com.polidea.multiplatformbleadapter.Characteristic;
import com.polidea.multiplatformbleadapter.OnErrorCallback;
import com.polidea.multiplatformbleadapter.OnEventCallback;
import com.polidea.multiplatformbleadapter.OnSuccessCallback;
import com.polidea.multiplatformbleadapter.Service;
import com.polidea.multiplatformbleadapter.errors.BleError;
import com.polidea.multiplatformbleadapter.utils.Base64Converter;
import com.polidea.multiplatformbleadapter.utils.ServiceFactory;

import org.json.JSONException;

import java.util.ArrayList;
import java.util.List;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class CharacteristicsDelegate implements CallDelegate {

    private BleAdapter bleAdapter;
    private CharacteristicsResponseJsonConverter characteristicsResponseJsonConverter = new CharacteristicsResponseJsonConverter();
    private CharacteristicsMonitorStreamHandler characteristicsMonitorStreamHandler;

    public CharacteristicsDelegate(BleAdapter bleAdapter, CharacteristicsMonitorStreamHandler characteristicsMonitorStreamHandler) {
        this.bleAdapter = bleAdapter;
        this.characteristicsMonitorStreamHandler = characteristicsMonitorStreamHandler;
    }

    @Override
    public boolean canHandle(MethodCall call) {
        switch (call.method) {
            case MethodName.READ_CHARACTERISTIC_FOR_IDENTIFIER:
            case MethodName.READ_CHARACTERISTIC_FOR_DEVICE:
            case MethodName.READ_CHARACTERISTIC_FOR_SERVICE:
            case MethodName.WRITE_CHARACTERISTIC_FOR_IDENTIFIER:
            case MethodName.WRITE_CHARACTERISTIC_FOR_DEVICE:
            case MethodName.WRITE_CHARACTERISTIC_FOR_SERVICE:
            case MethodName.MONITOR_CHARACTERISTIC_FOR_IDENTIFIER:
            case MethodName.MONITOR_CHARACTERISTIC_FOR_DEVICE:
            case MethodName.MONITOR_CHARACTERISTIC_FOR_SERVICE:
                return true;
        }
        return false;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        switch (call.method) {
            case MethodName.READ_CHARACTERISTIC_FOR_IDENTIFIER:
                readCharacteristicForIdentifier(
                        call.<Integer>argument(ArgumentKey.CHARACTERISTIC_IDENTIFIER),
                        call.<String>argument(ArgumentKey.TRANSACTION_ID),
                        result);
                return;
            case MethodName.READ_CHARACTERISTIC_FOR_DEVICE:
                readCharacteristicForDevice(
                        call.<String>argument(ArgumentKey.DEVICE_IDENTIFIER),
                        call.<String>argument(ArgumentKey.SERVICE_UUID),
                        call.<String>argument(ArgumentKey.CHARACTERISTIC_UUID),
                        call.<String>argument(ArgumentKey.TRANSACTION_ID),
                        result);
                return;
            case MethodName.READ_CHARACTERISTIC_FOR_SERVICE:
                readCharacteristicForService(
                        call.<Integer>argument(ArgumentKey.SERVICE_IDENTIFIER),
                        call.<String>argument(ArgumentKey.CHARACTERISTIC_UUID),
                        call.<String>argument(ArgumentKey.TRANSACTION_ID),
                        result);
                return;
            case MethodName.WRITE_CHARACTERISTIC_FOR_IDENTIFIER:
                writeCharacteristicForIdentifier(
                        call.<Integer>argument(ArgumentKey.CHARACTERISTIC_IDENTIFIER),
                        call.<byte[]>argument(ArgumentKey.BYTES),
                        call.<Boolean>argument(ArgumentKey.WITH_RESPONSE),
                        call.<String>argument(ArgumentKey.TRANSACTION_ID),
                        result);
                return;
            case MethodName.WRITE_CHARACTERISTIC_FOR_DEVICE:
                writeCharacteristicForDevice(
                        call.<String>argument(ArgumentKey.DEVICE_IDENTIFIER),
                        call.<String>argument(ArgumentKey.SERVICE_UUID),
                        call.<String>argument(ArgumentKey.CHARACTERISTIC_UUID),
                        call.<byte[]>argument(ArgumentKey.BYTES),
                        call.<Boolean>argument(ArgumentKey.WITH_RESPONSE),
                        call.<String>argument(ArgumentKey.TRANSACTION_ID),
                        result);
                return;
            case MethodName.WRITE_CHARACTERISTIC_FOR_SERVICE:
                writeCharacteristicForService(
                        call.<Integer>argument(ArgumentKey.SERVICE_IDENTIFIER),
                        call.<String>argument(ArgumentKey.CHARACTERISTIC_UUID),
                        call.<byte[]>argument(ArgumentKey.BYTES),
                        call.<Boolean>argument(ArgumentKey.WITH_RESPONSE),
                        call.<String>argument(ArgumentKey.TRANSACTION_ID),
                        result);
                return;
            case MethodName.MONITOR_CHARACTERISTIC_FOR_IDENTIFIER:
                monitorCharacteristicForIdentifier(
                        call.<Integer>argument(ArgumentKey.CHARACTERISTIC_IDENTIFIER),
                        call.<String>argument(ArgumentKey.TRANSACTION_ID),
                        result);
                return;
            case MethodName.MONITOR_CHARACTERISTIC_FOR_DEVICE:
                monitorCharacteristicForDevice(
                        call.<String>argument(ArgumentKey.DEVICE_IDENTIFIER),
                        call.<String>argument(ArgumentKey.SERVICE_UUID),
                        call.<String>argument(ArgumentKey.CHARACTERISTIC_UUID),
                        call.<String>argument(ArgumentKey.TRANSACTION_ID),
                        result);
                return;
            case MethodName.MONITOR_CHARACTERISTIC_FOR_SERVICE:
                monitorCharacteristicForService(
                        call.<Integer>argument(ArgumentKey.SERVICE_IDENTIFIER),
                        call.<String>argument(ArgumentKey.CHARACTERISTIC_UUID),
                        call.<String>argument(ArgumentKey.TRANSACTION_ID),
                        result);
                return;
            default:
                throw new IllegalArgumentException(call.method + " cannot be handled by this delegate");
        }
    }

    private void readCharacteristicForIdentifier(
            int characteristicIdentifier,
            String transactionId,
            final MethodChannel.Result result) {
        bleAdapter.readCharacteristic(characteristicIdentifier, transactionId,
                new OnSuccessCallback<Characteristic>() {
                    @Override
                    public void onSuccess(Characteristic data) {
                        try {
                            result.success(characteristicsResponseJsonConverter.toJson(createResponseWithSingleCharacteristic(data)));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                }, new OnErrorCallback() {
                    @Override
                    public void onError(BleError error) {
                        result.error(String.valueOf(error.errorCode.code), error.reason, null); //TODO Fix after merging errors handling
                    }
                });
    }

    private void readCharacteristicForDevice(
            String deviceIdentifier,
            String serviceUuid,
            String characteristicUuid,
            String transactionId,
            final MethodChannel.Result result) {

        final SafeMainThreadResolver<Characteristic> safeMainThreadResolver = new SafeMainThreadResolver<>(
                new OnSuccessCallback<Characteristic>() {
                    @Override
                    public void onSuccess(Characteristic data) {
                        try {
                            result.success(characteristicsResponseJsonConverter.toJson(createResponseWithSingleCharacteristic(data)));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                },
                new OnErrorCallback() {
                    @Override
                    public void onError(BleError error) {
                        result.error(String.valueOf(error.errorCode.code), error.reason, null); //TODO Fix after merging errors handling
                    }
                }
        );
        bleAdapter.readCharacteristicForDevice(deviceIdentifier, serviceUuid, characteristicUuid, transactionId,
                new OnSuccessCallback<Characteristic>() {
                    @Override
                    public void onSuccess(Characteristic data) {
                        safeMainThreadResolver.onSuccess(data);
                    }
                }, new OnErrorCallback() {
                    @Override
                    public void onError(BleError error) {
                        safeMainThreadResolver.onError(error);
                    }
                });
    }

    private void readCharacteristicForService(int serviceIdentifier, String characteristicUuid, String transactionId, final MethodChannel.Result result) {
        bleAdapter.readCharacteristicForService(
                serviceIdentifier,
                characteristicUuid,
                transactionId,
                new OnSuccessCallback<Characteristic>() {
                    @Override
                    public void onSuccess(Characteristic data) {
                        try {
                            result.success(characteristicsResponseJsonConverter.toJson(createResponseWithSingleCharacteristic(data)));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                }, new OnErrorCallback() {
                    @Override
                    public void onError(BleError error) {
                        result.error(String.valueOf(error.errorCode.code), error.reason, null); //TODO Fix after merging errors handling
                    }
                });
    }

    private void writeCharacteristicForIdentifier(int characteristicIdentifier,
                                                  byte[] bytesToWrite,
                                                  boolean withResponse,
                                                  String transactionId,
                                                  final MethodChannel.Result result) {
        bleAdapter.writeCharacteristic(
                characteristicIdentifier,
                Base64Converter.encode(bytesToWrite),
                withResponse,
                transactionId,
                new OnSuccessCallback<Characteristic>() {
                    @Override
                    public void onSuccess(Characteristic data) {
                        try {
                            result.success(characteristicsResponseJsonConverter.toJson(createResponseWithSingleCharacteristic(data)));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                }, new OnErrorCallback() {
                    @Override
                    public void onError(BleError error) {
                        result.error(String.valueOf(error.errorCode.code), error.reason, null); //TODO Fix after merging errors handling
                    }
                });
    }

    private void writeCharacteristicForDevice(String deviceIdentifier,
                                              String serviceUuid,
                                              String characteristicUuid,
                                              byte[] bytesToWrite,
                                              boolean withResponse,
                                              String transactionId,
                                              final MethodChannel.Result result) {
        final SafeMainThreadResolver<Characteristic> safeMainThreadResolver = new SafeMainThreadResolver<>(
                new OnSuccessCallback<Characteristic>() {
                    @Override
                    public void onSuccess(Characteristic data) {
                        try {
                            result.success(characteristicsResponseJsonConverter.toJson(createResponseWithSingleCharacteristic(data)));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                },
                new OnErrorCallback() {
                    @Override
                    public void onError(BleError error) {
                        result.error(String.valueOf(error.errorCode.code), error.reason, null); //TODO Fix after merging errors handling
                    }
                }
        );

        bleAdapter.writeCharacteristicForDevice(
                deviceIdentifier,
                serviceUuid, characteristicUuid,
                Base64Converter.encode(bytesToWrite),
                withResponse,
                transactionId,
                new OnSuccessCallback<Characteristic>() {
                    @Override
                    public void onSuccess(Characteristic data) {
                        safeMainThreadResolver.onSuccess(data);
                    }
                }, new OnErrorCallback() {
                    @Override
                    public void onError(BleError error) {
                        safeMainThreadResolver.onError(error);
                    }
                });
    }

    private void writeCharacteristicForService(int serviceIdentifier,
                                               String characteristicUuid,
                                               byte[] bytesToWrite,
                                               boolean withResponse,
                                               String transactionId,
                                               final MethodChannel.Result result) {
        bleAdapter.writeCharacteristicForService(
                serviceIdentifier,
                characteristicUuid,
                Base64Converter.encode(bytesToWrite),
                withResponse,
                transactionId,
                new OnSuccessCallback<Characteristic>() {
                    @Override
                    public void onSuccess(Characteristic data) {
                        try {
                            result.success(characteristicsResponseJsonConverter.toJson(createResponseWithSingleCharacteristic(data)));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                }, new OnErrorCallback() {
                    @Override
                    public void onError(BleError error) {
                        result.error(String.valueOf(error.errorCode.code), error.reason, null); //TODO Fix after merging errors handling
                    }
                });
    }

    private void monitorCharacteristicForIdentifier(int characteristicIdentifier,
                                                    String transactionId,
                                                    MethodChannel.Result result) {
        bleAdapter.monitorCharacteristic(
                characteristicIdentifier,
                transactionId, new OnEventCallback<Characteristic>() {
                    @Override
                    public void onEvent(Characteristic data) {
                        characteristicsMonitorStreamHandler.onCharacteristicsUpdate(data);
                    }
                }, new OnErrorCallback() {
                    @Override
                    public void onError(BleError error) {
                        characteristicsMonitorStreamHandler.onError(error);
                    }
                });
        result.success(null);
    }

    private void monitorCharacteristicForDevice(String deviceIdentifier,
                                                String serviceUuid,
                                                String characteristicUuid,
                                                String transactionId,
                                                MethodChannel.Result result) {
        bleAdapter.monitorCharacteristicForDevice(
                deviceIdentifier,
                serviceUuid,
                characteristicUuid,
                transactionId,
                new OnEventCallback<Characteristic>() {
                    @Override
                    public void onEvent(Characteristic data) {
                        characteristicsMonitorStreamHandler.onCharacteristicsUpdate(data);
                    }
                }, new OnErrorCallback() {
                    @Override
                    public void onError(BleError error) {
                        characteristicsMonitorStreamHandler.onError(error);
                    }
                });
        result.success(null);
    }

    private void monitorCharacteristicForService(int serviceIdentifier,
                                                 String characteristicUuid,
                                                 String transactionId,
                                                 MethodChannel.Result result) {
        bleAdapter.monitorCharacteristicForService(
                serviceIdentifier,
                characteristicUuid,
                transactionId,
                new OnEventCallback<Characteristic>() {
                    @Override
                    public void onEvent(Characteristic data) {
                        characteristicsMonitorStreamHandler.onCharacteristicsUpdate(data);
                    }
                }, new OnErrorCallback() {
                    @Override
                    public void onError(BleError error) {
                        characteristicsMonitorStreamHandler.onError(error);
                    }
                });
        result.success(null);
    }

    private byte[] convertToBytes(List<Byte> ints) {
        byte[] bytes = new byte[ints.size()];
        for (int i = 0; i < ints.size(); i++) {
            bytes[i++] = ints.get(i);
        }
        return bytes;
    }

    private CharacteristicsResponse createResponseWithSingleCharacteristic(Characteristic characteristic) {
        return new CharacteristicsResponse(
                new Characteristic[]{characteristic},
                characteristic.getServiceID(),
                characteristic.getServiceUUID());
    }
}
