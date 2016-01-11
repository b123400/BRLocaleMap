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
} BRLocaleMapService;

@interface BRLocaleMap : NSObject

+ (NSString *)locale:(NSString *)localeCode forService:(BRLocaleMapService)service;

@end
