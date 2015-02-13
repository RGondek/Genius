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
        int option;
        printf("Bem-Vindo, ao MELHOR GENIUS CONSOLE ;D\n\n");
        printf("(1)Criar Usuário  (0)SAIR\n");
        
        scanf("%i", &option);
        
        
        
        while (option != 0) {
            
            switch(option)
            
            {
                    
                case 0:
                    
                    printf("Obrigado por Jogar, volte sempre!\n");
                    
                    return 0;
                    
                    break;
                    
                case 1: // Criar Usuário
                    
                    printf("Nome: ");
                    
                    //                    scanf("%s",str);
                    
                    break;
                    
                case 2: // Jogar
                    
                    printf("Vamos Jogar :\n)");
                    game(teste);
                    
                    //Chamar o jogo
                    
                    break;
                    
                case 3: // Ranking
                    
                    printf("Ranking\n");
                    
                    // Chamar o ranking
                    
                    break;
                    
                case 4: // Trocar de Usuário
                    
                    // Chamar a troca de usuário
                    
                    break;
                    
                default: // Numero errado...
                    
                    printf("Número Inválido! Digite novamente!\n");
                    
                    break;
                    
            }
            
            
            
            printf("\nSelecione sua opção:\n");
            
            printf("(1)Criar Usuário (2)Jogar (3)Ranking (4)Trocar Usuario (0)Sair\n");
            
            scanf("%i", &option);
        
        }
        printf("Obrigado por Jogar, volte sempre!\n");
    }
    return 0;
}
