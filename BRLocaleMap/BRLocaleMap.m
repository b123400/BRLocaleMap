//
//  BRLocaleMap.m
//  BRLocaleMap
//
//  Created by b123400 on 11/1/2016.
//  Copyright © 2016 b123400. All rights reserved.
//

#import "BRLocaleMap.h"

@implementation BRLocaleMap

+ (NSString *)locale:(NSString *)localeCode forService:(BRLocaleMapService)service {
    return [BRLocaleMap sourceLocale:localeCode forService:service];
}

+ (NSString *)sourceOrTargetLocale:(NSString *)localeCode forService:(BRLocaleMapService)service {
    if (service == BRLocaleMapServiceDeepl) {
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:@"Not available for DeepL, use sourceLocale: or targetLocale: instead."
                                     userInfo:nil];
    }
    NSString *path = [self pathWithService:service];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:0
                                                           error:nil];
    for (NSString *thisLocaleCode in [self fallbacksWithLocale:localeCode]) {
        NSDictionary *thisLocale = dict[thisLocaleCode];
        if (thisLocale) {
            return [thisLocale objectForKey:@"code"];
        }
    }
    return nil;
}

+ (NSString *)sourceLocale:(NSString *)localeCode forService:(BRLocaleMapService)service {
    if (service == BRLocaleMapServiceDeepl) {
        NSArray<NSString *> *supportedLocale = @[@"AR",@"BG",@"CS",@"DA",@"DE",@"EL",@"EN",@"ES",@"ET",@"FI",@"FR",@"HU",@"ID",@"IT",@"JA",@"KO",@"LT",@"LV",@"NB",@"NL",@"PL",@"PT",@"RO",@"RU",@"SK",@"SL",@"SV",@"TR",@"UK",@"ZH"];
        NSString *first2Char = [[localeCode substringToIndex:2] uppercaseString];
        if ([supportedLocale containsObject:first2Char]) {
            return first2Char;
        }
        return nil;
    }
    return [BRLocaleMap sourceOrTargetLocale:localeCode forService:service];
}

+ (NSString *)targetLocale:(NSString *)localeCode forService:(BRLocaleMapService)service {
    if (service == BRLocaleMapServiceDeepl) {
        if (localeCode.length < 2) return nil;
        NSString *underscored = [localeCode stringByReplacingOccurrencesOfString:@"-" withString:@"_"].lowercaseString;
        if ([underscored isEqual:@"en_gb"]) {
            return @"EN-GB";
        }
        if ([underscored isEqual:@"en_us"]) {
            return @"EN-US";
        }
        if ([underscored isEqual:@"pt_br"]) {
            return @"PT-BR";
        }
        if ([underscored isEqual:@"pt_pt"]) {
            return @"PT-PT";
        }
        if ([underscored hasPrefix:@"zh_hans"]) {
            return @"ZH-HANS";
        }
        if ([underscored hasPrefix:@"zh_hant"]) {
            return @"ZH-HANT";
        }
        NSArray<NSString *> *supportedLocale = @[@"AR",@"BG",@"CS",@"DA",@"DE",@"EL",@"EN",@"ES",@"ET",@"FI",@"FR",@"HU",@"ID",@"IT",@"JA",@"KO",@"LT",@"LV",@"NB",@"NL",@"PL",@"PT",@"RO",@"RU",@"SK",@"SL",@"SV",@"TR",@"UK",@"ZH"];
        NSString *first2Char = [[localeCode substringToIndex:2] uppercaseString];
        if ([supportedLocale containsObject:first2Char]) {
            return first2Char;
        }
        return nil;
    }
    return [BRLocaleMap sourceOrTargetLocale:localeCode forService:service];
}

+ (NSString*)pathWithService:(BRLocaleMapService)service {
    switch (service) {
        case BRLocaleMapServiceGoogle:
            return [[NSBundle mainBundle] pathForResource:@"google-translate"
                                                   ofType:@"json"];
        case BRLocaleMapServiceMicrosoft:
            return [[NSBundle mainBundle] pathForResource:@"microsoft-translate"
                                                   ofType:@"json"];
        default:
            break;
    }
    return nil;
}

/**
 * Generates a list of fallback locale code, e.g.
 * Input: zh_Hant_HK
 * Outout: [zh_Hant_HK, zh_Hant, zh]
 */
+ (NSArray<NSString*> *)fallbacksWithLocale:(NSString*)localeCode {
    NSMutableArray *results = [NSMutableArray array];
    [results addObject: localeCode];
    for (NSInteger i = localeCode.length - 1; i >= 0; i--) {
        NSString *lastChar = [localeCode substringWithRange: NSMakeRange(i, 1)];
        if ([lastChar isEqualToString: @"-"] || [lastChar isEqualToString: @"_"]) {
            [results addObject: [localeCode substringToIndex: i]];
        }
    }
    return results;
}

@end
