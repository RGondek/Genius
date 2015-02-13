//
//  Fila.m
//  AtividadeFila
//
//  Created by Rubens Gondek on 2/8/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import "Fila.h"

@implementation Fila

-(id)init{
    self = [super init];
    
    elementos = [[NSMutableArray alloc] init];
    return self;
}

-(void)Enfileirar:(NSObject *)elem{
    if (elem != nil) {
        [elementos addObject:elem];
    }
}
-(void)Desenfileirar{
    if (!self.Vazio) {
        [elementos removeObjectAtIndex:0];
    }
}
-(NSObject *)Ler { return [elementos firstObject]; }
-(BOOL)Vazio{
    if ([elementos count] == 0) {
        return YES;
    }
    else{
        return NO;
    }
}

// Exercicios
-(void)Imprimir{
    for (NSString *elem in elementos) {
        NSLog(@"Elemento: %@", elem);
    }
}

-(BOOL)Busca:(NSObject *)obj{
    for (NSString *elem in elementos) {
        if (elem == obj) {
            return YES;
            break;
        }
    }
    return NO;
}

@end
