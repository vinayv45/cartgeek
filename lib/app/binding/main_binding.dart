import 'package:cartgeek/app/modules/home/binding/home_binding.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    HomeBinding().dependencies();
  }
}
