//
//  Fila.h
//  AtividadeFila
//
//  Created by Rubens Gondek on 2/8/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fila : NSObject{
    NSMutableArray *elementos;
}

-(void)Enfileirar:(NSObject*)elem;
-(id)init;
//-(instancetype) initWithRandon:(int)elem;
-(void)Desenfileirar;
-(NSObject*)Ler;
-(BOOL)Vazio;


-(void)Imprimir;


-(BOOL)Busca:(NSObject*)obj;

@end
