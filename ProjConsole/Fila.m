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

//-(instancetype) initWithRandon:(int)elem
//{
//    self = [super init];
//    if (self) {
//        elementos = [[NSMutableArray alloc] init];
//        int qtd = 0;
//        NSString *color;
//        while (qtd != elem) {
//            int ran = rand() * 4;
//            switch (ran) {
//                case 1:
//                    color = @"A";
//                    break;
//                case 2:
//                    color = @"B";
//                    break;
//                case 3:
//                    color = @"C";
//                    break;
//                case 4:
//                    color = @"D";
//                    break;
//                default:
//                    break;
//            }
//            
//            [elementos addObject:color];
//            qtd ++;
//        }
//
//    }
//   
//    return self;
//}

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
