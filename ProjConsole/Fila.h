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
-(void)Desenfileirar;
-(NSObject*)Ler;
-(BOOL)Vazio;

// Ex 01 - Imprimir a fila
-(void)Imprimir;

// Ex 02 - Verificação de pertinência
-(BOOL)Busca:(NSObject*)obj;

@end
