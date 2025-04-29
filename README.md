# Zendesk Messaging Plugin

## Overview
This Flutter plugin provides integration with Zendesk Messaging SDK for both Android and iOS platforms, enabling customer support messaging with push notification capabilities in your Flutter applications.

## Features
- Initialize Zendesk Messaging with channel key
- Display Zendesk messaging interface
- User authentication (login/logout)
- Push notification support 
- Unread message count tracking
- Conversation tags and fields management

## Installation

### 1. Add Dependency
Add the plugin to your `pubspec.yaml`:

```yaml
dependencies:
  zendesk_messaging_plugin: ^0.0.2
```
## Platform Setup
### 1. Add this to your android/build.gradle
```gradle
buildscript {
    repositories {
        google()
        mavenCentral()
        maven {
            url "https://zendesk.jfrog.io/artifactory/repo"
        }
    }
    dependencies {
        classpath 'com.google.gms:google-services:4.3.15'
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
        maven {
            url "https://zendesk.jfrog.io/artifactory/repo"
        }
    }
}
```