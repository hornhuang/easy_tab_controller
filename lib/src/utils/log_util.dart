import 'package:logger/logger.dart';

const String _tag = "easy_tab_controller";

var _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
  ),
);

LogV(String msg) {
  _logger.v("$_tag :: $msg");
}

LogD(String msg) {
  _logger.d("$_tag :: $msg");
}

LogI(String msg) {
  _logger.i("$_tag :: $msg");
}

LogW(String msg) {
  _logger.w("$_tag :: $msg");
}

LogE(String msg) {
  _logger.e("$_tag :: $msg");
}

LogWTF(String msg) {
  _logger.wtf("$_tag :: $msg");
}