//
//  User.m
//  ProjConsole
//
//  Created by Rubens Gondek on 2/13/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize score, name, qtd;

//construtor do usuário
-(instancetype)initWithName:(NSString *)n{
    self = [super init];
    if (self) {
        name = n;
        score = 0;
        qtd = 0;
    }
    return self;
}

//atualiza o Score do usuário
-(void)gameScore:(int)sc{
    if (sc > score) {
        score = sc;
    }
    qtd++;
}

@end
