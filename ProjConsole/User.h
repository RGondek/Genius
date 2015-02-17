//
//  User.h
//  ProjConsole
//
//  Created by Rubens Gondek on 2/13/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject{
    NSString* name;
    int score;
    int qtd;
}
@property int score, qtd;
@property NSString* name;

-(instancetype)initWithName:(NSString*)n;
-(void)gameScore:(int)sc;

@end
