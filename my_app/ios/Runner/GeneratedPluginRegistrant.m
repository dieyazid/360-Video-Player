//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<motion_sensors/MotionSensorsPlugin.h>)
#import <motion_sensors/MotionSensorsPlugin.h>
#else
@import motion_sensors;
#endif

#if __has_include(<video_player_extra/FLTVideoPlayerPlugin.h>)
#import <video_player_extra/FLTVideoPlayerPlugin.h>
#else
@import video_player_extra;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [MotionSensorsPlugin registerWithRegistrar:[registry registrarForPlugin:@"MotionSensorsPlugin"]];
  [FLTVideoPlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTVideoPlayerPlugin"]];
}

@end
