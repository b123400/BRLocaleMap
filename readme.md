# BRLocaleMap

[![](https://api.travis-ci.org/b123400/BRLocaleMap.svg?branch=master)](https://api.travis-ci.org/b123400/BRLocaleMap)

This project maps Apple's locale codes to Google/Microsoft Translate.

# Example

```
[BRLocaleMap locale:@"pa"
         forService:BRLocaleMapServiceGoogle]; // returns "ma"

[BRLocaleMap locale:@"fil"
         forService:BRLocaleMapServiceGoogle]; // returns "tl"

[BRLocaleMap locale:@"zh_Hant_HK"                 // Automatically fallback to zh_Hant
         forService:BRLocaleMapServiceMicrosoft]; // returns "zh-CHT"

[BRLocaleMap locale:@"gsw"
         forService:BRLocaleMapServiceMicrosoft]; // returns "de"
```

# Usage

Add this to your Podfile

```
pod 'BRLocaleMap'
```
