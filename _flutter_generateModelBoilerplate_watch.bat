echo off
ECHO watching your app to generate *.g.dart
ECHO you need to stop this manually

flutter packages pub run build_runner watch

ECHO Done
pause