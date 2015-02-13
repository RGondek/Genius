//
//  User.m
//  ProjConsole
//
//  Created by Rubens Gondek on 2/13/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize score, name;
-(instancetype)initWithName:(NSString *)n{
//score = 0
    return self;
}
-(void)gameScore:(int)sc{
    if (sc > score) {
        score = sc;
    }
    qtd++;
}

@end
