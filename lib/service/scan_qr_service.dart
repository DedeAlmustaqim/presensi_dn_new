import 'package:presensi/core.dart';
import 'package:presensi/models/user_detail.dart';

class ScanQr {
  final url = AppConfig.baseUrl;

  checkLocation(String lat, String long) async {
    var response = await Dio().post(
      "$url/api/user/verifikasi_loc",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer 216|p1IAjmy7jIvYRX79XZoksNr7rnJKH0dGweXl8m9x4c665d71",
        },
      ),
      data: {"id": AppConfig.idUser, "latitude": "$lat", "longitude": "$long"},
    );
    Map<String, dynamic> obj = response.data;

    return obj['data'];
  }

  Future postQrIn(String qrIn) async {
    var response = await Dio().post(
      "$url/api/user/qr_in",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.token}",
        },
      ),
      data: {
        "qr_in": qrIn,
        "id": 1,
      },
    );
    Map obj = response.data;
    return obj['data'];
  }

  Future postQrOut(String qrIn) async {
    var response = await Dio().post(
      "$url/api/user/qr_out",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppConfig.token}",
        },
      ),
      data: {
        "qr_in": qrIn,
        "id": AppConfig.idUser,
      },
    );
    Map obj = response.data;
    return obj['data'];
  }
}
