def foiSpareNa10(listaDePontos):
    return listaDePontos[1:] == []

def ehSpare (listaDePontos):
    return (listaDePontos[0] + listaDePontos[1:][0]) == 10

def ehStrike(listaDePontos):
    return listaDePontos[0] == 10

def comporPlacar(listaDePontos, rodada):
    if(listaDePontos == []):
        return ""
    if(rodada == 12):
        if(ehStrike(listaDePontos)):
            return "X " + comporPlacar(listaDePontos[1:], rodada + 1)
        return str(listaDePontos[0]) + comporPlacar(listaDePontos[1:], rodada + 1)
    if(rodada == 11):
        if(ehStrike(listaDePontos)):
            return "X " + comporPlacar(listaDePontos[1:], rodada + 1)
        elif foiSpareNa10(listaDePontos):
            return str(listaDePontos[0]) + " " + comporPlacar(listaDePontos[1:], rodada + 1)
        elif ehSpare(listaDePontos):
            return  str(listaDePontos[0]) + "/ " + comporPlacar(listaDePontos[2:], rodada + 1)
        return  str(listaDePontos[0]) + " " + str(listaDePontos[1:][0]) + comporPlacar(listaDePontos[2:], rodada + 1)
    if(rodada == 10):
        if(ehStrike(listaDePontos)):
            return "X " + comporPlacar(listaDePontos[1:], rodada + 1)
        else:
            if(ehSpare(listaDePontos)):
                return str(listaDePontos[0]) + " / " + comporPlacar(listaDePontos[2:], rodada + 1)
            return str(listaDePontos[0]) + " " + str(listaDePontos[1:][0]) + comporPlacar(listaDePontos[2:], rodada + 1)
    if(rodada < 10):
        if(ehStrike(listaDePontos)):
            return "X _ | " + comporPlacar(listaDePontos[1:], rodada + 1)
        elif(ehSpare(listaDePontos)):
            return str(listaDePontos[0]) + " / | " + comporPlacar(listaDePontos[2:], rodada + 1)
        else:
            return str(listaDePontos[0]) + " " + str(listaDePontos[1:][0]) + " | " + comporPlacar(listaDePontos[2:], rodada + 1)

def somarPontuacoesDasRodadas(listaDePontos, pontos, rodada):
    if(listaDePontos == []):
        return pontos
    if(rodada == 12):
        pontos += listaDePontos[0]
        return somarPontuacoesDasRodadas(listaDePontos[1:], pontos, rodada + 1)
    if(rodada == 11):
        if(ehStrike(listaDePontos)):
            pontos += listaDePontos[0]
            return somarPontuacoesDasRodadas(listaDePontos[1:], pontos, rodada + 1)
        elif foiSpareNa10(listaDePontos):
            pontos += listaDePontos[0]
            return somarPontuacoesDasRodadas(listaDePontos[1:], pontos, rodada + 1)
        else:
            pontos += listaDePontos[0] + listaDePontos[1:][0]
            return somarPontuacoesDasRodadas(listaDePontos[2:], pontos, rodada + 1)
    if(rodada == 10):
        if(ehStrike(listaDePontos)):
            pontos += listaDePontos[0]
            return somarPontuacoesDasRodadas(listaDePontos[1:], pontos, rodada + 1)
        else:
            pontos += listaDePontos[0] + listaDePontos[1:][0]
            if(ehSpare(listaDePontos)):
                return somarPontuacoesDasRodadas(listaDePontos[2:], pontos, rodada + 1)
            return somarPontuacoesDasRodadas(listaDePontos[2:], pontos, rodada + 1)
    if(rodada < 10):
        if(ehStrike(listaDePontos)):
            pontos += listaDePontos[0] + listaDePontos[1:][0] + listaDePontos[2:][0]
            return somarPontuacoesDasRodadas(listaDePontos[1:], pontos, rodada + 1)
        elif(ehSpare(listaDePontos)):
            pontos += listaDePontos[0] + listaDePontos[1:][0] + listaDePontos[2:][0]
            return somarPontuacoesDasRodadas(listaDePontos[2:], pontos, rodada + 1)
        else:
            pontos += listaDePontos[0] + listaDePontos[1:][0]
            return somarPontuacoesDasRodadas(listaDePontos[2:], pontos, rodada + 1)


def verificarTodasRodadas(listaDePontos):
    print(comporPlacar(listaDePontos, 1))
    return somarPontuacoesDasRodadas(listaDePontos, 0, 1)

listaDePontos = [int(i) for i in input().split()]
print('pontuação final ->', verificarTodasRodadas(listaDePontos))


# 10 10 10 10 10 10 10 10 10 10 10 10 -> expected 300 
# X _ | X _ | X _ | X _ | X _ | X _ | X _ | X _ | X _ | X X X
# 7 3 5 5 5 5 7 3 7 3 6 4 5 5 5 5 5 5 5 5 5 -> expected 7 / | 5 / | 5 / | 7 / | 7 / | 6 / | 5 / | 5 / | 5 / | 5 / 5 | 155
# 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 6 4 1 -> expected 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 6 / 1 | 29
# 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 1 1 -> expected 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | X 1 1 | 12 
# 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 2 -> expected 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | X X 2 | 22 
# 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 10 -> expected 30
# 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 10 10 -> expected 60
# 10 10 10 1 1 1 1 1 1 1 1 1 1 1 1 1 1 -> expected 77
# 10 10 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 -> expected 49
