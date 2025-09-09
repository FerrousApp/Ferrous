plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "app.ferrous.ferrous"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "app.ferrous.ferrous"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
        /// when i want to push to play store, i may have to uncomment this. see https://developer.android.com/build/build-variants#kts
        // debug {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
        //     signingConfig = signingConfigs.getByName("debug")
        // }
    }

    flavorDimensions += "default"
    productFlavors{
        create("production"){
            dimension = "default"
            resValue(type="string", name="app_name", value="Ferrous")
        }
        create("dev"){
            dimension = "default"
            resValue(type="string", name="app_name", value="Ferrous.dev")
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
        }
    }
}

flutter {
    source = "../.."
}
