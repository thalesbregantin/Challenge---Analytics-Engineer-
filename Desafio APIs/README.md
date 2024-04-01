# Desafio API's

## Objetivo 

Realizar uma análise sobre a oferta/exibição das opções de produtos que respondem a diferentes buscas no site MercadoLivre.com.ar.

## Analisar uma lista de mais de 150 identificadores de itens no serviço público:
https://api.mercadolibre.com/sites/MLA/search?q=chromecast&limit=50#json Neste caso específico e apenas como exemplo, são resultados para a busca "chromecast", mas você deve escolher outros termos para o experimento que permitam
enriquecer a análise em um hipotético painel (por exemplo, Google Home, Apple TV, Amazon Fire TV, ou similares para comparar dispositivos portáteis, ou escolher outros 3 que você esteja interessado em comparar).

## Para cada resultado, realizar o correspondente GET pelo Item_Id no recurso público:
https://api.mercadolibre.com/items/{Item_Id}

## Escrever os resultados:
Escrever os resultados em um arquivo de texto simples delimitado por vírgulas, desnormalizando o JSON obtido na etapa anterior, em tantos campos quanto forem necessários para armazenar as variáveis que você deseja modelar.

