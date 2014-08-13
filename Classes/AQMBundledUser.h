#import <Foundation/Foundation.h>

extern NSString *const kAQMBundledUserUserTokenKey;
extern NSString *const kAQMBundledUserSecretKeyKey;

@interface AQMBundledUser : NSObject

@property (nonatomic, retain) NSString *_userToken, *_secretKey;

+ (instancetype)currentUser;

- (NSString *)userToken;
- (NSString *)secretKey;

@end
