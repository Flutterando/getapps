import 'package:getapps/config/constants.dart';
import 'package:getapps/data/services/client_http.dart';
import 'package:getapps/domain/domain.dart';
import 'package:result_dart/result_dart.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../exceptions/exceptions.dart';

class RemoteCodeHostingRepository implements CodeHostingRepository {
  final ClientHttp _clientHttp;

  RemoteCodeHostingRepository(this._clientHttp);

  @override
  AsyncResult<AppEntity> downloadAPK(
    AppEntity app,
    String asset,
    void Function(double percent) onProgress,
  ) async {
    return _clientHttp //
        .downloadFile(asset, '${app.appName}.apk', onProgress)
        .map((file) {
      return app.copyWith(file: file);
    });
  }

  @override
  AsyncResult<AppEntity> getLastRelease(AppEntity app) async {
    final url = _getUrlApiByProvide(app.repository);

    return _clientHttp.get(url, headers: {
      'Accept': 'application/vnd.github.v3+json',
      'Authorization': 'token $githubToken',
    }).flatMap((response) {
      final data = response.data as Map<String, dynamic>;
      final tagName = data['tag_name'] as String;
      final assets = (data['assets'] as List<dynamic>) //
          .map((a) => a['browser_download_url'] as String)
          .where((url) => url.endsWith('.apk'))
          .toList();

      if (assets.isEmpty) {
        return const Failure(RemoteRepositoryException('No assets found'));
      }

      final newApp = app.copyWith.lastRelease(
        tagName: tagName,
        assets: assets,
      );

      return Success(newApp);
    });
  }

  String _getUrlApiByProvide(RepositoryEntity repository) {
    switch (repository.provider) {
      case GitRepositoryProvider.github:
        return 'https://api.github.com/repos/${repository.organizationName}/${repository.projectName}/releases/latest';
      default:
        throw UnimplementedError();
    }
  }

  String _getBrowserUrlByProvide(RepositoryEntity repository) {
    switch (repository.provider) {
      case GitRepositoryProvider.github:
        return 'https://github.com/${repository.organizationName}/${repository.projectName}';
      default:
        throw UnimplementedError();
    }
  }

  @override
  Future<void> openRepository(AppEntity app) async {
    final url = _getBrowserUrlByProvide(app.repository);
    await launchUrl(Uri.parse(url));
  }
}
