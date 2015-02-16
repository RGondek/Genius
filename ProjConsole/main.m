//
//  main.m
//  ProjConsole
//
//  Created by Rubens Gondek on 2/13/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//


// Explicação para o uso da estrutura de dados Fila:
// Como o intuito do jogo é fazer os dados(cores e seus numeros) apresentados ao usuario em um determinado jogo tivesse sempre a mesma ordem independente da jogada, vimos que a estrutura fila é melhor pois o primeiro dado enfileirado é o primeiro dado que será desenfileirado. E com isso garantimos que os dados sigam durante todas as jogadas do jogo a mesma sequencia.

#import <Foundation/Foundation.h>
#import "User.h"
#import "Fila.h"

#if __has_feature(objc_arc)
#define MDLog(format, ...) CFShow((__bridge CFStringRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
#define MDLog(format, ...) CFShow([NSString stringWithFormat:format, ## __VA_ARGS__]);
#endif

int game(User* usuario)
{
    Fila *fila1 = [[Fila alloc] init];
    Fila *fila2 = [[Fila alloc] init];
    NSString *color;
    int dado;
    int k = 1, numCor = 1;
    
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
            
            
            MDLog(@"\n%i. %@", numCor, [fila1 Ler]);
            [NSThread sleepForTimeInterval:1.0];
            for (int i = 0; i < 100; i++) printf("\n");
            [fila2 Enfileirar:[fila1 Ler]];
            [fila1 Desenfileirar];
            numCor++;
        }
        
        for (int i = 0; i < k; i++) {
            scanf("%d", &dado);
            numCor=1;
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
                numCor = 0;
                return k;
            }
        }
        printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
        k++;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        User *usuario;
        char aux[20];
        int option, score;
        int qtdJogadas = 0;
        
        printf("\n");
        printf("|--------------------------------|\n");
        printf("|            Bem-Vindo!          |\n");
        printf("|   Ao MELHOR GENiOS CONSOLE ;D  |\n");
        printf("|--------------------------------|\n");
        printf("|       Selecione uma Opção:     |\n");
        printf("|  (1) Criar Usuário             |\n");
        printf("|  (0) Sair                      |\n");
        printf("|--------------------------------|\n\n");
        
        scanf("%i", &option);
        
        while (option != 0) {
            switch(option){
                    
                case 0:{
                    printf("\n\n");
                    printf("|--------------------------------|\n");
                    printf("|        Obrigado por Jogar      |\n");
                    printf("|          Volte sempre!         |\n");
                    printf("|--------------------------------|\n\n");
                    return 0;
                    break;
                }
                    
                case 1:{ // Criar Usuário
                    qtdJogadas = 0;
                    printf("\nNome: ");
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
                    printf("\n");
                    printf("|--------------------------------|\n");
                    printf("|          Você Perdeu :/        |\n");
                    printf("| LOSER!  LOSER!  LOSER!  LOSER! |\n");
                    printf("|--------------------------------|\n\n");

                    printf("|--------------------------------|\n");
                    printf("|            Score: %d            |\n", score);
                    printf("|--------------------------------|\n");
                    if (score > usuario.score){
                        usuario.score = score;
                    }
                    break;
                }
                    
                case 3:{ // Recorde
                    printf("|--------------------------------|\n");
                    printf("|         Recorde: %d            |\n", usuario.score);
                    printf("|--------------------------------|\n");
                    break;
                }
                    
                case 4:{ // Trocar de Usuário
                    // Chamar a troca de usuário
                    qtdJogadas = 0;
                    printf("\nNome: ");
                    scanf("%s", aux);
                    NSString *nome = [[NSString alloc] initWithCString:aux encoding:NSASCIIStringEncoding];
                    usuario = [[User alloc] initWithName:nome];
                    //scanf("%s",str);

                    break;
                }
            
                case 5: { //Mostrar quantas vezes o usuário jogou
                    printf("|--------------------------------|\n");
                    printf("| Quant. de vezes que jogou: %d  |\n", qtdJogadas);
                    printf("|--------------------------------|\n");
                    break;
                }
                default:{ // Numero errado...
                    printf("|--------------------------------|\n");
                    printf("|          Número Inválido       |\n");
                    printf("|         Digite novamente!      |\n");
                    printf("|--------------------------------|\n");
                    break;
                }
            }
            
            printf("\n");
            printf("|--------------------------------|\n");
            printf("|       Selecione uma Opção:     |\n");
            printf("|  (1) Criar Usuário             |\n");
            printf("|  (2) Jogar                     |\n");
            printf("|  (3) Recorde                   |\n");
            printf("|  (4) Trocar Usuário            |\n");
            printf("|  (5) Quant. de vezes que jogou |\n");
            printf("|  (0) Sair                      |\n");
            printf("|--------------------------------|\n\n");
            
            scanf("%i", &option);
        }
        printf("\n\n");
        printf("|--------------------------------|\n");
        printf("|        Obrigado por Jogar      |\n");
        printf("|          Volte sempre!         |\n");
        printf("|--------------------------------|\n\n");
    }
    return 0;
}

