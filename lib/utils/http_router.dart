import 'dart:io';

const apiPath = 'http://ec2-18-222-239-190.us-east-2.compute.amazonaws.com:8080';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
