print("*************************************************************************************************\n")

tentativas = 10
rodada_atual  = 1
numero_sistema = input("Digite um valor para o sistema:  \n")
convert_numero_sistema = int(numero_sistema)

while(rodada_atual <= tentativas):
    
    print("Rodada {} de {} \n".format(rodada_atual, tentativas))

    numero_user = input("Digite um valor \n")

    print("Valor do usuario é {} \n".format(numero_user))

    convert_numero_user = int(numero_user)
    valor_certo = (convert_numero_user == convert_numero_sistema)
    valor_menor = (convert_numero_user  < convert_numero_sistema)
    valor_maior = (convert_numero_user  > convert_numero_sistema)

    if (valor_certo):
        print("Valor Informado é Correto: {} ! \n".format(convert_numero_user))
        break
    else:
        if (valor_maior):
            print("Valor Informado é maior que o valor do Sistema: {} \n".format(convert_numero_user))
        elif(valor_menor):
            print("Valor Informado é menor que o do sistema: {} \n".format(convert_numero_user))
        else:
            print("Error ! \n")

    rodada_atual = rodada_atual + 1