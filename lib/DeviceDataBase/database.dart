import 'package:answer_it/DeviceDataBase/models/pvtalk.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataBase {
  static Box<PvTalk> getData() => Hive.box<PvTalk>('Box');
}