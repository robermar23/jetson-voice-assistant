import sounddevice as sd

for i, dev in enumerate(sd.query_devices()):
    if dev['max_output_channels'] > 0:
        print(f"\nDevice {i}: {dev['name']}")
        for rate in [8000, 16000, 22050, 44100, 48000]:
            try:
                sd.check_output_settings(device=i, samplerate=rate)
                print(f"  supports {rate} Hz")
            except Exception as e:
                print(f"  does not support {rate} Hz")
