rebuild:
    adb -s 340YC10GCL071D push --sync src/* /sdcard/Android/data/org.lovr.app/files && adb -s 340YC10GCL071D shell am start -S org.lovr.app/org.lovr.app.Activity .
