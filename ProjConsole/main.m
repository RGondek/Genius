//
//  main.m
//  ProjConsole
//
//  Created by Rubens Gondek on 2/13/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Fila.h"

int game(User* u)
{
    Fila *fila1 = [[Fila alloc] init];
    Fila *fila2 = [[Fila alloc] init];
    NSString *color;
    int dado;
    int k = 1;
    
//    opcoes 1, 2, 3, 4
  
    while (1) {
        int ran = arc4random() % 4;
        for (int i = 0; i < k; i++) {
            
            
            
            switch (ran) {
                case 0:
                    color = @"Amarelo(0)";
                    break;
                case 1:
                    color = @"Azul(1)";
                    break;
                case 2:
                    color = @"Verde(2)";
                    break;
                case 3:
                    color = @"Vermelho(3)";
                    break;
                default:
                    break;
            }

            [fila1 Enfileirar:color];
            NSLog(@"%@",[fila1 Ler]);
            [NSThread sleepForTimeInterval:2];
            printf("\n\n\n\n\n\n\n\n\n");
            [fila2 Enfileirar:[fila1 Ler]];
            [fila1 Desenfileirar];
        }
        
        for (int i = 0; i < k; i++) {
            scanf("%d", &dado);
            
            switch (dado) {
                case 0:
                    color = @"Amarelo(0)";
                    break;
                case 1:
                    color = @"Azul(1)";
                    break;
                case 2:
                    color = @"Verde(2)";
                    break;
                case 3:
                    color = @"Vermelho(3)";
                    break;
                default:
                    break;
            }
            if ([color isEqualTo:[fila2 Ler]]) {
                [fila1 Enfileirar:[fila2 Ler]];
                [fila2 Desenfileirar];
            }
            else{
                return k;
            }
        }
        printf("\n\n\n\n\n\n\n\n\n");
        k++;
        
       
    }
    
    
    
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        User *teste = [[User alloc] initWithName:@"Teste"];
        game(teste);
    }
    return 0;
}
