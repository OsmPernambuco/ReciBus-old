import 'package:flutter/material.dart';
import 'package:trufi_core/base/blocs/map_configuration/map_configuration_cubit.dart';
import 'package:trufi_core/base/utils/graphql_client/hive_init.dart';
import 'package:trufi_core/base/widgets/drawer/menu/social_media_item.dart';
import 'package:trufi_core/default_values.dart';
import 'package:trufi_core/trufi_core.dart';
import 'package:trufi_core/trufi_router.dart';
import 'package:latlong2/latlong.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(
    TrufiApp(
      appNameTitle: 'ReciBus',
      blocProviders: [
        ...DefaultValues.blocProviders(
          otpEndpoint: "https://br-recife.api.trufi.app:8300/otp",
          otpGraphqlEndpoint:
              "https://br-recife.api.trufi.app:8300/otp/graphql",
          mapConfiguration: MapConfiguration(
            center: LatLng(-8.0606, -34.8878),
          ),
          searchAssetPath: "",
          photonUrl: "https://br-recife.api.trufi.app:8300/photon",
        ),
      ],
      trufiRouter: TrufiRouter(
        routerDelegate: DefaultValues.routerDelegate(
          appName: 'ReciBus',
          cityName: 'Recife',
          countryName: 'Brasil',
          backgroundImageBuilder: (_) {
            return Image.asset(
              'assets/images/drawer-bg.jpeg',
              fit: BoxFit.cover,
            );
          },
          urlFeedback: 'https://example/feedback',
          emailContact: 'example@example.com',
          urlShareApp: 'https://example/share',
          urlSocialMedia: const UrlSocialMedia(
            urlFacebook: 'https://www.facebook.com/Example',
          ),
        ),
      ),
    ),
  );
}
