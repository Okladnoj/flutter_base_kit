import 'dart:async';

import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

@lazySingleton
class UrlLauncherService extends BaseService {
  const UrlLauncherService();

  Future<void> openUrl(String url) async {
    return errorAbsorbParser(() async {
      Uri uri = Uri.parse(url);
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        uri = Uri.parse('http://$url');
      }
      launchUrl(uri);
    });
  }

  Future<void> openEmail(String email) async {
    return errorAbsorbParser(() async {
      final Uri emailUri = Uri(scheme: 'mailto', path: email);
      await launchUrl(emailUri);
    });
  }

  Future<void> sendEmail({
    required String email,
    String emailTitle = 'App Template',
    String preMessage = '',
  }) async {
    return errorAbsorbParser(() async {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
        query: _encodeQueryParameters(<String, String>{
          'subject': emailTitle,
          'body': preMessage,
        }),
      );

      launchUrl(emailLaunchUri);
    });
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }
}
