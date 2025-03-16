//
//  BRLocaleMap.h
//  BRLocaleMap
//
//  Created by b123400 on 11/1/2016.
//  Copyright © 2016 b123400. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    BRLocaleMapServiceGoogle,
    BRLocaleMapServiceMicrosoft,
    BRLocaleMapServiceDeepl,
} BRLocaleMapService;

@interface BRLocaleMap : NSObject

+ (NSString *)locale:(NSString *)localeCode forService:(BRLocaleMapService)service __attribute__ ((deprecated("Use sourceLocale: or targetLocale: instead")));

+ (NSString *)sourceLocale:(NSString *)localeCode forService:(BRLocaleMapService)service;
+ (NSString *)targetLocale:(NSString *)localeCode forService:(BRLocaleMapService)service;

@end
