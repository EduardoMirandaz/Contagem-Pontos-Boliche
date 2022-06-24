# Pontos de Boliche

Projeto desenvolvido na linguagem Haskell durante a disciplina de Programação Funcional.

## 🚀 Protótipo

O projeto foi prototipado em python, por meio de recursão e list comprehension.

### 📋 Pré-requisitos

Para rodar o programa, você precisará do Glasgow Haskell Compiler (GHC) que pode ser baixado em https://www.haskell.org/downloads/

Feito isso, basta abrir o terminal na pasta em que o projeto foi descompactado (pós o download), e rodar:

```
ghc boliche.hs && ./boliche 
```

## ⚙️ Executando os testes

Você pode utilizar arquivos .txt e rodar
```
ghc boliche.hs && ./boliche < nomeDoSeuArquivo.txt
```
### 🔩 Formato de entrada / saída

Entradas válidas seriam do tipo (Os casos de teste estão no final do arquivo):

# 1.in
```
7 3 5 5 5 5 7 3 7 3 6 4 5 5 5 5 5 5 5 5 5
```
# 1.out
```
"7 / | 5 / | 5 / | 7 / | 7 / | 6 / | 5 / | 5 / | 5 / | 5 / 5 "
```

# 2.in
```
10 10 10 10 10 10 10 10 10 10 10 10
```
# 2.out
```
"X _ | X _ | X _ | X _ | X _ | X _ | X _ | X _ | X _ | X X X "
```


## 🛠️ Construído com

Mencione as ferramentas que você usou para criar seu projeto

* [Python](https://www.python.org/) - Lingugagem de Programação
* [Haskell](https://www.haskell.org/) - Lingugagem de Programação
* [GHC](https://www.haskell.org/ghc/) - Compilador

## ✒️ Autores

* **Eduardo Miranda** - *Desenvolveu o protótipo em python e o software final em Haskell, além de produzir a documentação* - [Eduardo](https://github.com/EduardoMirandaz/)
* **Gustavo Martins** - *Desenvolveu o protótipo em python e o software final em Haskell* - [Gustavo](https://github.com/GustavoOM)


## Esclarecimentos sobre a modularização recorrente do código:

-- # CABEÇA DA CALDA DA CALDA 
-> (pontos +  head tail(tail(listaDePontos)))

-- # CABEÇA DA CALDA 
-> (pontos +  head tail(listaDePontos) )

-- # CABEÇA 
-> (pontos +  head listaDePontos )

## ALGUNS CASOS DE TESTE

```
10 10 10 10 10 10 10 10 10 10 10 10 
```
#-> expected X _ | X _ | X _ | X _ | X _ | X _ | X _ | X _ | X _ | X X X | 300

```
7 3 5 5 5 5 7 3 7 3 6 4 5 5 5 5 5 5 5 5 5 
```
#-> expected 7 / | 5 / | 5 / | 7 / | 7 / | 6 / | 5 / | 5 / | 5 / | 5 / 5 | 155

```
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 6 4 1 
```
#-> expected 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 6 / 1 | 29

```
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 1 1 
```
#-> expected 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | X 1 1 | 12 

```
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 2 
```
#-> expected 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | X X 2 | 22 

```
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 10 
```
#-> expected 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | X X X | 30 

```
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 10 10 
```
#-> expected 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | X _ | X X X | 60

```
10 10 10 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
```
-> expected X _ | X _ | X _ | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 77

``` 
 10 10 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
```
-> expected X _ | X _ | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 49

## 🎁 Expressões de gratidão

* Foi ótimo desenvolver esse projeto para aflorar meu conhecimento no que tange o paradigma funcional de programação. 🤓📢

---
