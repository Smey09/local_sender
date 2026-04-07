import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;

  set isLoading(bool value) => _isLoading.value = value;
  set errorMessage(String value) => _errorMessage.value = value;

  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  void setError(String error) {
    _errorMessage.value = error;
  }

  void clearError() {
    _errorMessage.value = '';
  }
}