![hashids](http://hashids.org/public/img/hashids-logo-normal.png "Hashids")
======

Full Documentation
-------

A small Objective-C class to generate YouTube-like ids from one or many numbers. Use hashids when you do not want to expose your database ids to the user. Read full documentation at: [http://hashids.org/](http://hashids.org/)

Installation
-------

#### CocoaPods

All you need to do is add to your Podfile the following:
```
pod 'NNLHashids'
```
It's namespaced so it doesn't conflict with the previous hashids project.

#### Git Submodules

Just run the following in your project wherever you wish this project to end up:
```
git submodule add git@github.com:DrGodCarl/hashids-objc.git
git submodule update --init --recursive
```

#### The Lazy Way

This is the one where you just get the files for this project and add them to your repo to use. Either download the project, copy and paste what you need, or, if you want to get really fancy, go ahead and just run the following to get the files:

```
git clone --recursive git@github.com:DrGodCarl/hashids-objc.git
```

Test that this worked by running the tests in the project. Or just by using Hashids in your project.

Usage
-------
All of these examples can also be found in use in the tests.

#### Encoding one number

You can pass a unique salt value so your hashids differ from everyone else's. I use "this is my salt" as an example.

```objectivec
NNLHashids *hashids = [[NNLHashids alloc] initWithSalt:@"this is my salt"];
NSString *hash = [hashids encode:@12345]; // @"NkK9"
```

#### Decoding

Notice during decoding, same salt value is used:

```objectivec
NNLHashids *hashids = [[NNLHashids alloc] initWithSalt:@"this is my salt"];
NSArray<NSNumber*> *decoded = [hashids decode:@"NkK9"]; // @[@12345]
```

#### Decoding with different salt

Unfortunately, unlike other implementations, decoding will still work with a different salt due to details in the C implementation. Be careful out there:

```objectivec
NNLHashids *hashids = [[NNLHashids alloc] initWithSalt:@"this is my pepper"];
NSArray<NSNumber*> *decoded = [hashids decode:@"NkK9"]; // @[@25264] <-- oops...
```

#### Encoding several numbers

```objectivec
NNLHashids *hashids = [[NNLHashids alloc] initWithSalt:@"this is my salt"];
NSString *hash = [hashids encodeMany:@[@683, @94108, @123, @5]]; // @"aBMswoO2UB3Sj"
```

#### Decoding is done the same way

```objectivec
NNLHashids *hashids = [[NNLHashids alloc] initWithSalt:@"this is my salt"];
NSArray<NSNumber*> *decoded = [hashids decode:@"aBMswoO2UB3Sj"]; // @[@683, @94108, @123, @5]
```

#### Encoding and specifying minimum id length

```objectivec
NNLHashids *hashids = [[NNLHashids alloc] initWithSalt:@"this is my salt"
                                         minHashLength:8];
NSString *hash = [hashids encode:@1]; // @"gB0NV05e"
```

#### Decoding
I bet you could guess how this one is going to work:

```objectivec
NNLHashids *hashids = [[NNLHashids alloc] initWithSalt:@"this is my salt"
                                         minHashLength:8];
NSArray<NSNumber*> *decoded = [hashids decode:@"gB0NV05e"]; // @[@1]
```

#### Specifying custom id alphabet

```objectivec
NNLHashids *hashids = [[NNLHashids alloc] initWithSalt:SALT
                                         minHashLength:0
                                              alphabet:@"0123456789abcdef"];
NSString *hash = [hashids encode:@1234567]; // @"b332db5"
```

Randomness
-------

The primary purpose of hashids is to obfuscate ids. It's not meant or tested to be used for security purposes or compression.
Having said that, this algorithm does try to make these hashes unguessable and unpredictable:

#### Repeating numbers

#### Incrementing numbers

#### Incrementing number ids

Curses! #$%@
-------

This code was written with the intent of placing created hashes in visible places - like the URL. Which makes it unfortunate if generated hashes accidentally formed a bad word.

Therefore, the algorithm tries to avoid generating most common English curse words. This is done by never placing the following letters next to each other:

	c, C, s, S, f, F, h, H, u, U, i, I, t, T

Changelog
-------
**1.0.0**
  - This is brand new! No changes.
  
**1.0.1**
  - Updated the underlying version of the C library.
  
**1.0.2**
  - Added Podspec file and deployed to Cocoapods.

License
-------

MIT License. See the `LICENSE` file. You can use Hashids in open source projects and commercial products. Don't break the Internet. Kthxbye.
