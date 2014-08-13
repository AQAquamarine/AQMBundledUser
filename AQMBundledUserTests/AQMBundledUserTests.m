#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>

#import "AQMBundledUser.h"

SpecBegin(AQMBundledUser)

describe(@"AQMBundledUser", ^{
    describe(@"-userToken;", ^{
        NSString *userToken = [[AQMBundledUser currentUser] userToken];
        
        it(@"returns uuid", ^{
            expect([[AQMBundledUser currentUser] userToken].length).to.equal(36);
        });
        
        it(@"returns always same string", ^{
            expect([[AQMBundledUser currentUser] userToken]).to.equal(userToken);
        });
    });
    
    describe(@"-secretToken;", ^{
        NSString *secretToken = [[AQMBundledUser currentUser] secretToken];
        
        it(@"returns 128 length string", ^{
            expect([[AQMBundledUser currentUser] secretToken].length).to.equal(256);
        });
        
        it(@"returns always same string", ^{
            expect([[AQMBundledUser currentUser] secretToken]).to.equal(secretToken);
        });
    });
});

SpecEnd