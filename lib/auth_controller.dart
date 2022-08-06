import 'package:demo_project/home_page.dart';
import 'package:demo_project/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  login(usernam, pwd) async {
    if (usernam == 'admin' && pwd == 'minakshi') {
      await GetStorage().write('loginpayload', [usernam, pwd]);
      validateLogin();
    } else {
      EasyLoading.showError('Invalid Credentials');
    }
  }

  validateLogin() {
    final loginpayload = GetStorage().read('loginpayload');
    if (loginpayload != null) {
      Get.to(() => const Homepage());
    } else {
      Get.to(() => const LoginScreen());
    }
  }

  logout() async {
    await GetStorage().remove('loginpayload');
    Get.to(() => const LoginScreen());
  }

  fetchApi() async {
    await Dio()
        .get('https://jsonplaceholder.typicode.com/todos/1')
        .then((response) {});
  }
}
