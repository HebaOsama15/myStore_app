import 'package:e_commesce_app/core/feature/model/device_info.dart';
import 'package:e_commesce_app/core/functions/get_device_type.dart';
import 'package:flutter/cupertino.dart';

class InfoWidget extends StatelessWidget {
  
  final Widget Function(BuildContext context, DeviceInfo deviceInfo)? biulder;
  const InfoWidget({Key? key, this.biulder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var mediaQueryData = MediaQuery.of(context);

        var deviceInfo = DeviceInfo(
          orientation: mediaQueryData.orientation,
          deviceType: getDeviceType(mediaQueryData),
          screenWidth: mediaQueryData.size.width,
          screenHeight: mediaQueryData.size.height,
          localWidth: constraints.maxWidth,
          localHeight: constraints.maxHeight,
        );
        
        return biulder!( context, deviceInfo);
      },
    );
  }
}