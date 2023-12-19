//
//  xlog-swift-bridge.h
//  Runner
//
//  Created by jiajie.xu on 2023/12/12.
//
//
#ifndef xlog_swift_bridge_h
#define xlog_swift_bridge_h

#import <Foundation/Foundation.h>

@interface XLogBridge: NSObject

- (void)open: (NSUInteger)level cacheDir:(NSString*)cacheDir logDir:(NSString*)logDir prefix:(NSString*)prefix cacheDays:(NSUInteger)cacheDays pubKey:(NSString*)pubKey consoleLogOpen:(BOOL)consoleLogOpen;

- (void)close;

- (void)flush;
@end


#endif /* xlog_swift_bridge_h */
