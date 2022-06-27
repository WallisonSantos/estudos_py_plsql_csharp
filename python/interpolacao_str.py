print("Tentativa {} de {} ".format(3, 10))

rodada = 1
tentativas = 10
string_a = "A"

print("Tentativa {} de {} ".format(rodada, tentativas))

print("Tentativa {1} de {0} - {2}".format(tentativas, rodada, string_a))

print("Pagamento R$ {:.2f} de {:.2f} ".format(3000.50, 10000.60))

first_index = 1
last_index = 2

for rodada in range(first_index, last_index):
    print("Sem formatação de ponto flutuante R$ {} ".format(4.89223))
    print("Ponto flutuante R$ {:f} ".format(4.89332))
    print("Dois pontos flutuantes R$ {:.2f} ".format(4.89))
    print("Dois pontos flutuantes, Dezenove casas antes da  virgula, preenchidos por '0' R$ {:019.2f} ".format(4.892)) 
    print("Três pontos flutuantes, Doze casas antes da  virgula, preenchidos por '0' R$ {:012.3f} ".format(4.899))
    print("Doze casas antes da  virgula, preenchidos por '0' R$ {:012d} ".format(7766))
    print("Quinze casas antes da  virgula, preenchidos por '0' R$ {:015d} ".format(7766))

    print("R$ {:012.5f} ".format(45))
    print("Data {:02d}/{:02d} ".format(3,2))
    print("Data {:02d}/{:02d} ".format(2,3))
    print("Data {:02d}/{:02d} ".format(19, 11))
