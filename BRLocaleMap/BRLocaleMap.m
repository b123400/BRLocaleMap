//
//  BRLocaleMap.m
//  BRLocaleMap
//
//  Created by b123400 on 11/1/2016.
//  Copyright © 2016 b123400. All rights reserved.
//

#import "BRLocaleMap.h"

@implementation BRLocaleMap

- (NSDictionary*)localeMap {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"google-translate"
                                                     ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:0
                                                           error:&error];
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    return dict;
}

@end
