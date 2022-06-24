main :: IO ()
main = do
    -- Pega uma entrada por input
    s1 <- getLine
    -- Transforma a string de entrada em uma lista de strings 
    let listaDePontos = words $ read $ show s1
    -- Transforma a lista de strings em uma lista de ints
    let intListaDePontos = listStrToInt listaDePontos
    putStrLn $ comporPlacar intListaDePontos

-- #### Funções auxiliares #### --
-- Função que transforma uma lista de strings em uma lista de inteiros, utilizando list comprehension 
listStrToInt :: [String] -> [Int]
listStrToInt = map read

-- Função que verifica se o jogador conseguiu um strike na rodada em questão
ehStrike :: (Eq a, Num a) => [a] -> Bool
ehStrike listaDePontos = head listaDePontos == 10

-- Função que verifica se o jogador conseguiu um spare na rodada em questão
ehSpare :: (Eq a, Num a) => [a] -> Bool
ehSpare listaDePontos = head listaDePontos + head (tail listaDePontos) == 10

-- Função que verifica se o jogador realizou um spare na décima rodada, ao passo que precisamos dessa
-- informação para sabermos como lidar com a rodada 11.
foiSpareNaRodada10 :: [a] -> Bool
foiSpareNaRodada10 listaDePontos = null (tail listaDePontos)


-- Função que compõe a string que contém a divisão dos pontos e o somatório final dos mesmos.
-- Essa função possui casos bases específicos para as rodadas que tem suas pontuações calculadas de forma diferente.
-- As rodadas 12,11 e 10 tem casos bases diferentes. Da 1 até a 9 o cálculo é igual e a recursão compõe a string de 
-- pontos de forma semelhante, além de acumular uma variável chamada "pontos", somando a pontuação do jogador em questao.
comporPlacar_ :: (Show a1, Eq a2, Eq a1, Num a2, Num a1) => [a1] -> a2 -> a1 -> [Char]
comporPlacar_ [] rodada pontos = "| " ++ show pontos ++ " "
comporPlacar_ listaDePontos rodada pontos = case rodada of 12 -> if ehStrike listaDePontos
                                                                  then "X " ++ comporPlacar_ [] (rodada + 1) (pontos + 10)
                                                                  else show (head listaDePontos) ++ " " ++ comporPlacar_ [] (rodada + 1) (pontos +  head listaDePontos )
                                                           11 -> if ehStrike listaDePontos
                                                                  then "X " ++ comporPlacar_ (tail listaDePontos) (rodada + 1) (pontos +  head listaDePontos )
                                                                  else
                                                                    if foiSpareNaRodada10 listaDePontos
                                                                    then show (head listaDePontos) ++ " " ++ comporPlacar_ [] (rodada + 1) (pontos +  head listaDePontos )
                                                                    else
                                                                      if ehSpare listaDePontos
                                                                      then show (head listaDePontos) ++ " / " ++ comporPlacar_ [] (rodada + 1) (pontos +  head listaDePontos + head (tail listaDePontos)) 
                                                                      else show (head listaDePontos) ++ " " ++ show (head (tail listaDePontos)) ++ " " ++ comporPlacar_ [] (rodada + 1) (pontos +  head listaDePontos + head (tail listaDePontos)) 
                                                           10 -> if ehStrike listaDePontos
                                                                  then "X " ++ comporPlacar_ (tail listaDePontos) (rodada + 1) (pontos +  head listaDePontos )
                                                                  else 
                                                                    if ehSpare listaDePontos
                                                                    then show (head listaDePontos) ++ " / " ++ comporPlacar_ (tail (tail listaDePontos)) (rodada + 1) (pontos +  head listaDePontos +  head (tail listaDePontos) )
                                                                    else show (head listaDePontos) ++ " " ++ show (head (tail listaDePontos))  ++ " " ++ comporPlacar_ (tail (tail listaDePontos )) (rodada + 1) (pontos +  head listaDePontos +  head (tail listaDePontos) ) ++ " "  
                                                           _ -> if ehStrike listaDePontos
                                                                then "X _ | " ++ comporPlacar_ (tail listaDePontos) (rodada + 1) (pontos +  head listaDePontos +  head (tail listaDePontos) +  head (tail(tail listaDePontos)) ) 
                                                                else
                                                                  if ehSpare listaDePontos
                                                                  then show (head listaDePontos) ++ " / | " ++ comporPlacar_ ( tail (tail listaDePontos)) (rodada+1) (pontos +  head listaDePontos +  head (tail listaDePontos ) +  head ( tail (tail listaDePontos)) ) 
                                                                  else show (head listaDePontos) ++ " " ++ show (head (tail listaDePontos))  ++ " | " ++ comporPlacar_ ( tail (tail listaDePontos)) (rodada + 1) (pontos +  head listaDePontos +  head (tail listaDePontos) )
-- Chamada nao recursiva que compõe o placar do boliche.
comporPlacar :: (Eq a2, Num a2, Show a2) => [a2] -> [Char]
--                                                 rodadas|pontos
comporPlacar listaDePontos = comporPlacar_ listaDePontos 1 0

-- # 10 10 10 10 10 10 10 10 10 10 10 10 -> expected X _ | X _ | X _ | X _ | X _ | X _ | X _ | X _ | X _ | X X X | 300
-- # 7 3 5 5 5 5 7 3 7 3 6 4 5 5 5 5 5 5 5 5 5 -> expected 7 / | 5 / | 5 / | 7 / | 7 / | 6 / | 5 / | 5 / | 5 / | 5 / 5 | 155
-- # 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 6 4 1 -> expected 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 6 / 1 | 29
-- # 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 1 1 -> expected 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | X 1 1 | 12 
-- # 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 2 -> expected 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | X X 2 | 22 
-- # 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 10 -> expected 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | X X X | 30 
-- # 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 10 10 -> expected 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | 0 0 | X _ | X X X | 60
-- # 10 10 10 1 1 1 1 1 1 1 1 1 1 1 1 1 1 -> expected X _ | X _ | X _ | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 77 
-- # 10 10 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 -> expected X _ | X _ | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 1 1 | 49