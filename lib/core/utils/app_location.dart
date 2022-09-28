// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LocationModel {
//   String? latitude;
//   String? longitude;
//   String? country;
//   String? isoCountryCode;
//   String? city;
//   String? area;
//   String? address;
//   String? street;
//   String? pincode;
// }
//
// abstract class AppLocation {
//   static Future<LocationModel?> getCurrentLocation() async {
//     try {
//       LocationPermission permission = await Geolocator.requestPermission();
//
//       if (permission != LocationPermission.denied ||
//           permission != LocationPermission.deniedForever) {
//         LocationModel locationModel = LocationModel();
//         Position position = await Geolocator.getCurrentPosition(
//             desiredAccuracy: LocationAccuracy.high);
//         locationModel.latitude = position.latitude.toString();
//         locationModel.longitude = position.longitude.toString();
//
//         List<Placemark> placeMark = await placemarkFromCoordinates(
//             double.parse(locationModel.latitude!),
//             double.parse(locationModel.longitude!),
//             localeIdentifier: 'ar');
//         locationModel.country = placeMark.first.country;
//         locationModel.isoCountryCode = placeMark.first.isoCountryCode;
//         locationModel.pincode = placeMark.first.postalCode;
//         locationModel.address = placeMark.first.name;
//         locationModel.street = placeMark.first.street;
//         locationModel.city = placeMark.first.locality;
//         locationModel.area = placeMark.first.administrativeArea;
//
//         return locationModel;
//       } else {
//         return null;
//       }
//     } catch (error) {
//       return null;
//     }
//   }
// }
