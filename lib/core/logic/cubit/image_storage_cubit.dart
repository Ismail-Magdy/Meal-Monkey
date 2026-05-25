import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meal_monkey/core/logic/cubit/image_storage_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageStorageCubit extends Cubit<ImageStorageState> {
  ImageStorageCubit() : super(ImageStorageInitial()) {
    loadImage();
  }

  Future<void> pickImage(File image) async {
    try {
      emit(ImageLoaded(image));
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("profile_image", image.path);
    } catch (e) {}
  }

  Future<void> loadImage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final path = prefs.getString("profile_image");
      if (path != null) {
        emit(ImageLoaded(File(path)));
      }
    } catch (e) {
      print("Error loading image: $e");
    }
  }
}
