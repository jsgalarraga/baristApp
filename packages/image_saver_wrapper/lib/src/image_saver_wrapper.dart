import 'package:gallery_saver/gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageSaverWrapper {
  ImageSaverWrapper();

  Future<bool?> saveImageFromUrl(String imageUrl) {
    return GallerySaver.saveImage(imageUrl);
  }

  Future<bool> isPhotosPermissionDenied() {
    return Permission.photos.isDenied;
  }

  Future<bool> isPhotosPermissionPermanentlyDenied() {
    return Permission.photos.isPermanentlyDenied;
  }
}
