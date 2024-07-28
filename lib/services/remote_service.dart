import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteService {
  static final remoteConfig = FirebaseRemoteConfig.instance;
  static Future<void> onInitRemoteConfig() async {
    await remoteConfig.setDefaults({
      'isDiscountedPriceVisible': true,
    });
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 5),
        minimumFetchInterval: const Duration(seconds: 5)));
    await remoteConfig.fetchAndActivate();
    remoteConfig.onConfigUpdated.listen(
      (event) async {
        await remoteConfig.activate();
      },
    );
  }
}
