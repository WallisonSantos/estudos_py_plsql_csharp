num_sis = input("Digite um numero para o sistema ")
num_sis_int = int(num_sis)

tentativas = input("Quantas tentativas ? ")
tentativas_int = int(tentativas)

inicia_com = 1


for rodada in range(inicia_com, tentativas_int + 1):
    
    print("Rodada {} de {} \n".format(rodada, tentativas_int))


    num_user = input("Digite um numero ")
    num_user_int = int(num_user)


    if (num_user_int < inicia_com or num_user_int > tentativas_int):
        print("Digite um valor valido entre {} e {} ".format(inicia_com, tentativas_int))
        continue
    

    print("Numero digitado pelo usuario {} ".format(num_user_int))


    acertou = num_user_int == num_sis_int
    maior =  num_user_int  > num_sis_int
    menor =  num_user_int  < num_sis_int


    if(acertou):
        print("Valor Correto ! {} \n".format(num_user_int))
        break
    else:
        if(maior):
            print("Valor Incorreto. informa um valor MENOR ! {} ".format(num_user_int))
        elif(menor):
            print("Valor Incorreto. informe um valor MAIOR ! {} ".format(num_user_int))