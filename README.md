# Aplicativo de consulta a API do [GitHub](https://github.com)#

Um aplicativo para consultar a [API do GitHub](https://developer.github.com/v3/) e trazer os repositórios mais populares de Java. 

![bitbucket.png](https://bitbucket.org/repo/bApLBb/images/1070562783-bitbucket.png)
### **Funcionalidades** ###

- __Lista de repositórios__. Exemplo de chamada na API: `https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1`
  * Paginação na tela de lista, com endless scroll / scroll infinito (incrementando o parâmetro `page`).
  * Cada repositório exibe Nome do repositório, Descrição do Repositório, Nome / Foto do autor, Número de Stars, Número de Forks
  * Ao tocar em um item, leva a lista de Pull Requests do repositório
- __Pull Requests de um repositório__. Exemplo de chamada na API: `https://api.github.com/repos/<criador>/<repositório>/pulls`
  * Cada item da lista exibe Nome / Foto do autor do PR, Título do PR, Data do PR e Body do PR
  * Ao tocar em um item, abre no browser a página do Pull Request em questão

### **A solução contem** ##

* Versão mínima do iOS : 8.*
* Gestão de dependências no projeto com Cocoapods
* Framework para Comunicação com API AFNetwork
* Mapeamento json -> Objeto [Mantle](https://github.com/Mantle/Mantle#mtlmodel)
* Testes unitários no projeto / Specta + Expecta
* Cache de Imagens. SDWebImage