#!/bin/bash    

flutter pub add provider
flutter pub add bloc
flutter pub add flutter_bloc
flutter pub add hydrated_bloc


flutter clean
flutter pub get
flutter pub upgrade
flutter pub outdated
