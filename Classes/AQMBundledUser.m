#import "AQMBundledUser.h"
#import <LUKeychainAccess.h>
#import <AQMSecureRandom.h>

NSString *const kAQMBundledUserUserTokenKey = @"AQMBundledUserToken";
NSString *const kAQMBundledUserSecretTokenKey = @"AQMBundledSecretToken";

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

- (NSString *)secretToken {
    if (!self.userToken) {
        self._userToken = [self getSecretTokenFromKeyChain];
    }
    return self._userToken;
}

# pragma mark - Private methods

- (NSString *)getUserTokenFromKeyChain {
    NSString *userToken = [[[LUKeychainAccess standardKeychainAccess] valueForKey:kAQMBundledUserUserTokenKey] stringValue];
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

- (NSString *)getSecretTokenFromKeyChain {
    NSString *secretToken = [[[LUKeychainAccess standardKeychainAccess] valueForKey:kAQMBundledUserSecretTokenKey] stringValue];
    if (secretToken) {
        return secretToken;
    }
    return [self storeSecretToken];
}

- (NSString *)storeSecretToken {
    NSString *secret = [AQMSecureRandom randomString:256];
    [[LUKeychainAccess standardKeychainAccess] setString:secret forKey:kAQMBundledUserSecretTokenKey];
    return secret;
}

@end
