#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>

#import "AQMBundledUser.h"

SpecBegin(AQMBundledUser)

describe(@"AQMBundledUser", ^{
    describe(@"-userToken;", ^{
        it(@"returns uuid", ^{
            expect([[AQMBundledUser currentUser] userToken].length).to.equal(36);
        });
    });
});

SpecEnd