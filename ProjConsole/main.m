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
        
        // Random
        
        for (int i = 0; i < k; i++) {
            if (i == k-1) {
                int ran = arc4random() % 4;
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
            }
            
            // random só deve ser executado quando i == k-1
            
            
            NSLog(@"%@",[fila1 Ler]);
            //printf("%@", [fila1 Ler]);
            [NSThread sleepForTimeInterval:1.5];
            printf("\n\n\n\n\n\n\n\n\n\n\n");
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
        printf("\n\n\n\n\n\n\n\n\n\n\n\n");
        k++;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        User *usuario;
        char aux[20];
        int option, score;
        int qtdJogadas = 0;
        
        printf("Bem-Vindo, ao MELHOR GENIUS CONSOLE ;D\n\n");
        printf("(1)Criar Usuário\n(0)SAIR\n");
        
        scanf("%i", &option);
        
        while (option != 0) {
            switch(option){
                    
                case 0:{
                    printf("\n\nObrigado por Jogar, volte sempre!\n\n");
                    return 0;
                    break;
                }
                    
                case 1:{ // Criar Usuário
                    qtdJogadas = 0;
                    printf("Nome: ");
                    scanf("%s", aux);
                    NSString *nome = [[NSString alloc] initWithCString:aux encoding:NSASCIIStringEncoding];
                    usuario = [[User alloc] initWithName:nome];
                    //scanf("%s",str);
                    break;
                }
                    
                case 2:{ // Jogar
                    qtdJogadas++;
                    printf("\n\n\n\n\n\nVamos Jogar :\n");
                    score = game(usuario);
                    score--;
                    printf("Score: %d", score);
                    printf("\nVocê PERDEEEU!!!\n\n\n LOSER! \n LOSER! \n LOSER! \n\n\n");
                    if (score > usuario.score){
                        usuario.score = score;
                    }
                    break;
                }
                    
                case 3:{ // Ranking
                    printf("Ranking: %d", usuario.score);
                    break;
                }
                    
                case 4:{ // Trocar de Usuário
                    // Chamar a troca de usuário
                    qtdJogadas = 0;
                    printf("Nome: ");
                    scanf("%s", aux);
                    NSString *nome = [[NSString alloc] initWithCString:aux encoding:NSASCIIStringEncoding];
                    usuario = [[User alloc] initWithName:nome];
                    //scanf("%s",str);

                    break;
                }
            
                case 5: { //Mostrar quantas vezes o usuário jogou
                    printf("Quantidade de vezes que jogou: %d", qtdJogadas);
                    break;
                }
                default:{ // Numero errado...
                    printf("Número Inválido! Digite novamente!\n");
                    break;
                }
            }
            
            printf("\nSelecione sua opção:\n");
            printf("(1)Criar Usuário\n(2)Jogar\n(3)Ranking\n(4)Trocar Usuario\n(5)Quantidade de vezes que jogou\n(0)Sair\n");
            scanf("%i", &option);
        }
        printf("\n\nObrigado por Jogar, volte sempre!\n\n");
    }
    return 0;
}

