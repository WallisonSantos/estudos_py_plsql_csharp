import random

num_sis = random.randrange(1, 101)
tentativas = 0

print("Defina um nível de dificuldade:\n {} - {} - {} ".format("(1) Fácil", "(2) Médio", "(3) Difícil"))
level_user = int(input("\n Numero Sistema {}  \n ".format(num_sis)))

for nivel in range(1, 2):
    if(level_user == 1):
        tentativas = tentativas + 10
    elif(level_user == 2):
        tentativas = tentativas + 5 
    elif(level_user == 3):
        tentativas = tentativas + 3
    else:
        tentativas = 0

    if(level_user <= 0 or level_user > 3):
        print("Digiteum valor válido para o nível {} ".format("1, 2 ou 3"))
        continue

    for rodada in range(1, tentativas + 1):
            
        num_user = int(input("Digite um numero entre {} e {} para o Sistema \n...".format(1, 100)))
        
        print("Valor digitado pelo usuário foi {} ".format(num_user))

        if((num_user <= 0 or num_sis > 100) or (level_user <= 0 or level_user > 3)):
            print("Digite um valor válido entre {} e {} ".format(1, 101))
            print("E valor válido para o nivel {} ".format("1, 2 ou 3"))
            continue
        
        print("Tentativa {} de {} ".format(rodada, tentativas))

        acertou = num_user == num_sis
        maior = num_user > num_sis
        menor = num_user < num_sis

        if(acertou):
            print("Acertou ... \n ... Fim do Jogo !")
            break
        else:
            if(maior):
                print("Digite um numero MENOR ")
            elif(menor):
                print("Digite um numero MAIOR ")
            elif(rodada == tentativas):
                break