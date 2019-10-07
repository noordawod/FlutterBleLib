package com.polidea.flutterblelib.wrapper;


import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattService;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.polidea.flutterblelib.utils.IdGenerator;
import com.polidea.flutterblelib.utils.IdGeneratorKey;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class Service {


    private Device device;
    private BluetoothGattService service;
    private int id;

    public Service(@NonNull Device device, @NonNull BluetoothGattService service) {
        this.device = device;
        this.service = service;
        this.id = IdGenerator.getIdForKey(new IdGeneratorKey(device.getRxBleDevice(), service.getUuid(), service.getInstanceId()));
    }

    public int getId() {
        return id;
    }

    public Device getDevice() {
        return device;
    }

    public BluetoothGattService getNativeService() {
        return service;
    }

    public UUID getUuid() {
        return service.getUuid();
    }

    @Nullable
    public Characteristic getCharacteristicByUUID(@NonNull UUID uuid) {
        BluetoothGattCharacteristic characteristic = service.getCharacteristic(uuid);
        if (characteristic == null) return null;
        return new Characteristic(this, characteristic);
    }

    public List<Characteristic> getCharacteristics() {
        ArrayList<Characteristic> characteristics = new ArrayList<>(service.getCharacteristics().size());
        for (BluetoothGattCharacteristic gattCharacteristic : service.getCharacteristics()) {
            characteristics.add(new Characteristic(this, gattCharacteristic));
        }
        return characteristics;
    }

    public boolean isPrimary() {
        return service.getType() == BluetoothGattService.SERVICE_TYPE_PRIMARY;
    }
}
