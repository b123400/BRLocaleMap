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
    NSMutableArray *components = [[localeCode componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"-_"]] mutableCopy];
    NSMutableArray *results = [NSMutableArray array];
    while (components.count) {
        [results addObject:[components componentsJoinedByString:@"-_"]];
        [components removeLastObject];
    }
    return results;
}

@end
