#import "FlutterProxyCheckerPlugin.h"
#if __has_include(<flutter_proxy_checker/flutter_proxy_checker-Swift.h>)
#import <flutter_proxy_checker/flutter_proxy_checker-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_proxy_checker-Swift.h"
#endif

@implementation FlutterProxyCheckerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterProxyCheckerPlugin registerWithRegistrar:registrar];
}
@end
