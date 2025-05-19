ss24:
	adb connect 192.168.1.210

spxl:
	adb connect 192.168.1.176


install:
	flutter clean
	flutter pub get
	flutter build apk
	flutter install apk
