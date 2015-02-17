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

NSMutableArray *users;

User* getUser(NSString *nome){
    for (User *us in users) {
        if (us.name == nome){
            MDLog(@"O usuario <%@> foi selecionado!", nome);
            return us;
        }
    }
    User *usua = [[User alloc] initWithName:nome];
    [users addObject:usua];
    MDLog(@"O usuario <%@> foi criado!", nome);
    return usua;
}

void printRank(User *us){
    NSArray *sortArray = [[NSArray alloc] initWithArray:users];
    NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO];
    sortArray = [sortArray sortedArrayUsingDescriptors:@[sd]];
    printf("\n|--------------------------------|\n");
    printf("|---------  RANKING  ------------|\n");
    printf("|--------------------------------|\n");
    for (User *usua in sortArray) {
        if (usua == us){
            MDLog(@"|  You -> %@ : %d            \n", usua.name, usua.score);
        }else{
            MDLog(@"|         %@ : %d            \n", usua.name, usua.score);
        }
    }
    printf("|--------------------------------|\n");

}

void printUsers(User *us){
    printf("\n|--------------------------------|\n");
    printf("|----------  USUARIOS  ----------|\n");
    printf("|--------------------------------|\n");
    for (User *usua in users) {
        if (usua == us){
            MDLog(@"|  You -> %@           \n", usua.name);
        }else{
            MDLog(@"|         %@           \n", usua.name);
        }
    }
    printf("|--------------------------------|\n");
}

void printQTD(User *us){
    printf("\n|--------------------------------|\n");
    printf("|----------  JOGOS  -------------|\n");
    printf("|--------------------------------|\n");
    for (User *usua in users) {
        if (usua == us){
            MDLog(@"|  You -> %@ : %d            \n", usua.name, usua.qtd);
        }else{
            MDLog(@"|         %@ : %d            \n", usua.name, usua.qtd);
        }
    }
    printf("|--------------------------------|\n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        User *usuario;
        users = [[NSMutableArray alloc] init];
        char aux[20];
        int option, score;
        
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
                    printf("\nNome: ");
                    scanf("%s", aux);
                    NSString *nome = [[NSString alloc] initWithCString:aux encoding:NSASCIIStringEncoding];
                    usuario = getUser(nome);
                    break;
                }
                    
                case 2:{ // Jogar
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
                    [usuario gameScore:score];
                    break;
                }
                    
                case 3:{ // Recorde
                    printRank(usuario);
                    break;
                }
                    
                case 4:{ // Trocar de Usuário
                    // Chamar a troca de usuário
                    printUsers(usuario);
                    printf("\nNome: ");
                    scanf("%s", aux);
                    NSString *nome = [[NSString alloc] initWithCString:aux encoding:NSASCIIStringEncoding];
                    usuario = getUser(nome);
                    break;
                }
            
                case 5: { //Mostrar quantas vezes o usuário jogou
                    printQTD(usuario);
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

