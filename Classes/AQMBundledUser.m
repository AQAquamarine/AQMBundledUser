#import "AQMBundledUser.h"
#import <LUKeychainAccess.h>
#import <AQMSecureRandom.h>

NSString *const kAQMBundledUserUserTokenKey = @"AQMBundledUserToken";
NSString *const kAQMBundledUserSecretKeyKey = @"AQMBundledSecretKey";

@implementation AQMBundledUser

+ (instancetype)currentUser {
    static AQMBundledUser *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[AQMBundledUser alloc] init];
    });
    return _instance;
}

- (NSString *)userToken {
    if (!self._userToken) {
        self._userToken = [self getUserTokenFromKeyChain];
    }
    return self._userToken;
}

- (NSString *)secretKey {
    if (!self._secretKey) {
        self._secretKey = [self getSecretKeyFromKeyChain];
    }
    return self._secretKey;
}

# pragma mark - Private methods

- (NSString *)getUserTokenFromKeyChain {
    NSString *userToken = [[LUKeychainAccess standardKeychainAccess] stringForKey:kAQMBundledUserUserTokenKey];
    if (userToken) {
        return userToken;
    }
    return [self storeUserToken];
}

- (NSString *)storeUserToken {
    NSString *uuid = [AQMSecureRandom uuid];
    [[LUKeychainAccess standardKeychainAccess] setString:uuid forKey:kAQMBundledUserUserTokenKey];
    return uuid;
}

- (NSString *)getSecretKeyFromKeyChain {
    NSString *secretKey = [[LUKeychainAccess standardKeychainAccess] stringForKey:kAQMBundledUserSecretKeyKey];
    if (secretKey) {
        return secretKey;
    }
    return [self storeSecretKey];
}

- (NSString *)storeSecretKey {
    NSString *secret = [AQMSecureRandom randomString:256];
    [[LUKeychainAccess standardKeychainAccess] setString:secret forKey:kAQMBundledUserSecretKeyKey];
    return secret;
}

@end
