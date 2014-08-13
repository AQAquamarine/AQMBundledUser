AQMBundledUser
==============

![](http://img.shields.io/cocoapods/v/AQMBundledUser.svg?style=flat)

Device-tied user model which provides a user token and a secret key generated securely.

```objc
+ (instancetype)currentUser;

- (NSString *)userToken;
- (NSString *)secretKey;
```

```objc
[[AQMBundledUser currentUser] userToken]
// => b168-4a13-acd0-36c17ba35b4a
```

```objc
[[AQMBundledUser currentUser] secretKey]
// => zh6px5cbu6lm32svat28s66uyymrt1pwa6840sqgni9qgfz9n8mvzcbi3yl28fh3ul8q9wxuwxx092do2ot2u92tuoz5wp4ikkg17jzd745qow4vypav32njdwppoxieqxfkc3f1sgp9ms4x27o376abp9rm7sua8239nugg7ezmzgcucb7ke95qj6iq23htri9b5mynn66uerqywq8y2iysosbnzpqkly90tyvy9bbrp5369tg24alfmqfav6ti
```

Notice the user token and the secret key will not be lost when the app get uninstalled as AQMBundledUser stores the keys in KeyChain.

Installation
---

`pod 'AQMBundledUser'`

Spec
---

```objc
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
```

LICENSE
---

The MIT License (MIT)

Copyright (c) 2014 kaiinui

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
