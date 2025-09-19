pluginManagement {
    val flutterSdkPath by lazy {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        properties.getProperty("flutter.sdk")
            ?: throw GradleException("flutter.sdk not set in local.properties")
    }

    // Equivalent of `settings.ext.flutterSdkPath = flutterSdkPath()`
    extra["flutterSdkPath"] = flutterSdkPath

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.7.0" apply false
    id("org.jetbrains.kotlin.android") version "2.1.0" apply false
}

include(":app")
