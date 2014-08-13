#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>

#import <LUKeyChainAccess.h>

#import "AQMBundledUser.h"

SpecBegin(AQMBundledUser)

describe(@"AQMBundledUser", ^{
    beforeEach(^{
        [[LUKeychainAccess standardKeychainAccess] setObject:nil forKey:kAQMBundledUserUserTokenKey];
        [[LUKeychainAccess standardKeychainAccess] setObject:nil forKey:kAQMBundledUserSecretKeyKey];
    });
    
    describe(@"-userToken;", ^{
        it(@"returns uuid", ^{
            expect([[AQMBundledUser currentUser] userToken].length).to.equal(36);
        });
        
        it(@"returns always same string", ^{
            NSString *userToken = [[AQMBundledUser currentUser] userToken];
            expect([[AQMBundledUser currentUser] userToken]).to.equal(userToken);
        });
    });
    
    describe(@"-secretToken;", ^{
        it(@"returns 128 length string", ^{
            expect([[AQMBundledUser currentUser] secretKey].length).to.equal(256);
        });
        
        it(@"returns always same string", ^{
            NSString *secretKey = [[AQMBundledUser currentUser] secretKey];
            expect([[AQMBundledUser currentUser] secretKey]).to.equal(secretKey);
        });
    });
});

SpecEnd