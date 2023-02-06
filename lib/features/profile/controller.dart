import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_city_getx/core/apis/auth_api.dart';
import 'package:smart_city_getx/core/apis/user_api.dart';
import 'package:smart_city_getx/core/models/user.dart';
import 'package:smart_city_getx/core/utils/handle_file_path.dart';

class ProfileController extends GetxController {
  final isLoading = false.obs;
  Rx<UserMo> user = UserMo().obs;

  void logout() async {
    isLoading.value = true;
    await AuthAPI.logout();
    Get.offNamedUntil('/login', (route) => false);
    isLoading.value = false;
  }

  void pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    await UserAPI.updateAvatar(handleFilePath(image.path));
  }

  void getUserProfile() async {
    user.value = await UserAPI.profile();
    // if (StorageService.to.getString('USER_PROFILE').isNotEmpty) {
    //   var json = StorageService.to.getString('USER_PROFILE');
    //   profile = UserMo.fromJson(jsonDecode(json));
    //   print(json);
    // } else {}
  }

  @override
  void onReady() {
    super.onReady();
    getUserProfile();
  }
}
