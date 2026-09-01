

import 'package:trading/core/service/api_url.dart';
import 'package:trading/utils/app_const/app_const.dart';

class ImageHandler {
  static String imagesHandle(String? url,{bool isProfile = false}) {
    if (url == null || url.isEmpty) {
      if(isProfile){
        return AppConstants.unknown;
      }
      return AppConstants.restaurantImage;
    }

    if (url.startsWith('http')) {
      return url; // If the URL starts with 'http', return as is
    } else {
      return '${ApiUrl.imageUrl}$url';
      //  return ApiUrl.imageUrl + url;
    }
  }
}
