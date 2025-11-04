ss24:
	adb connect 192.168.1.244

spxl:
	adb connect 192.168.1.176

2pxl:
	adb connect 192.168.53.25

s24_s24:
	adb connect 192.168.53.246

clean:
	flutter clean
	flutter pub get

installprod:
	flutter clean
	flutter pub get
	flutter build apk --flavor production
	flutter install --flavor production


install:
	flutter clean
	flutter pub get
	flutter build apk --flavor dev --target lib/main_dev.dart
	flutter install --flavor dev
