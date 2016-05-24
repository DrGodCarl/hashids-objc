![hashids](http://hashids.org/public/img/hashids-logo-normal.png "Hashids")
======

Full Documentation
-------

A small Objective-C class to generate YouTube-like ids from one or many numbers. Use hashids when you do not want to expose your database ids to the user. Read full documentation at: [http://hashids.org/](http://hashids.org/)

Installation
-------

Usage
-------

#### Encoding one number

You can pass a unique salt value so your hashids differ from everyone else's. I use "this is my salt" as an example.

#### Decoding

Notice during decoding, same salt value is used:

#### Decoding with different salt

Decoding will not work if salt is changed:

#### Encoding several numbers

#### Decoding is done the same way

#### Encoding and specifying minimum id length

#### Decoding

#### Specifying custom id alphabet

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
  
License
-------

MIT License. See the `LICENSE` file. You can use Hashids in open source projects and commercial products. Don't break the Internet. Kthxbye.
