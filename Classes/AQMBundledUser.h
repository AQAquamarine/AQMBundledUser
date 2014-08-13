#import <Foundation/Foundation.h>

extern NSString *const kAQMBundledUserUserTokenKey;
extern NSString *const kAQMBundledUserSecretTokenKey;

@interface AQMBundledUser : NSObject

@property (nonatomic, retain) NSString *_userToken, *_secretToken;

+ (instancetype)currentUser;

- (NSString *)userToken;
- (NSString *)secretToken;

@end
