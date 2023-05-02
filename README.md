# Guia para usar o Terminal como uma IDE com Neovim e AstroNvim

> Você já se perguntou se poderia usar o terminal como uma IDE? Isso pode parecer estranho para alguns, mas é totalmente possível com o uso do Neovim e do AstroNvim. Este guia vai te ajudar a transformar o seu terminal em uma ferramenta de desenvolvimento poderosa.

## O que é Neovim e AstroNvim?

Neovim é um fork do Vim que foi desenvolvido para melhorar a performance, estabilidade e extensibilidade do editor de texto. Ele é compatível com a maioria dos plugins do Vim e oferece suporte a várias linguagens de programação.

AstroNvim é uma pré-configuração para o Neovim que inclui uma série de recursos essenciais para desenvolvedores, como destaque de sintaxe, diagnósticos de linguagem, formatação, linting, integração com o Git e um explorador de arquivos. Além disso, é altamente personalizável, permitindo que você configure o editor da maneira que mais lhe convier.

## Configuração

Antes de começar a usar o Neovim e o AstroNvim, você precisa instalá-los. Para isso, é necessário ter o pacote `neovim` instalado em seu sistema operacional. Em seguida, você pode instalar o AstroNvim.

AstroNvim é uma configuração que adiciona recursos essenciais ao Neovim, permitindo que você use o Terminal como uma IDE. Ele inclui destaque de sintaxe, diagnósticos de idioma, formatação, linting, integração Git e um explorador de arquivos, tornando-o uma opção moderna e altamente personalizável para a edição de código.

## Instalação e Configuração

### Instalação

Para começar, você precisará ter o Neovim instalado no seu sistema. Depois de instalá-lo, você pode clonar o repositório AstroNvim do GitHub com o seguinte comando:

```bash
git clone https://github.com/LunarVim/LunarVim.git ~/.config/nvim
```

Isso criará uma pasta chamada `nvim` em seu diretório de configuração e configurará o Neovim para usar o AstroNvim.

### Configuração

Primeiro, inicie o seu neovim com o comando `nvim` e deixe que o Lazy faça o download de todas as dependências do Astro. Assim que finalizado, você pode sair usando o tecla `q` .

Para configurar seu vim, utilize o [repositório user_example](https://github.com/AstroNvim/user_example) como template para criar seu repositório de configuração.

![[Pasted image 20230501135549.png]]

Após criar o seu repositório, clone ele para suas configurações utilizando o comando como no exemplo abaixo:

> Lembre-se de substituir o User e username pelo seu repositório específico.

```bash
git clone git@github.com:User/username_config.git ~/.config/nvim/lua/user
```

Agora navegue até o diretório clonado para iniciarmos as configurações e primeiras navegações do seu AstroNvim.

```bash
cd ~/.config/nvim/lua/user
nvim
```

> O lazy irá carregar novamente, aguarde finalizar e feche com a tecla `q` por enquanto.

## Uso do AstroNvim

O AstroNvim vem com uma série de plugins pré-instalados que adicionam recursos adicionais ao Neovim. Alguns dos plugins incluídos são:

- nvim-lspconfig
- nvim-treesitter

Alguns recursos úteis incluem:

- `:LspInstall`: instala servidores de linguagem para oferecer recursos mais avançados, como auto-completar, refatoração e documentação.
- `:LspInfo`: mostra informações sobre o servidor de linguagem atual.
- `:Git`: abre a interface do Git para realizar ações como adicionar, commitar e pushar alterações.

Astro segue uma convenção de tecla de atalho, em que a maioria das ações são acionadas pressionando a tecla `espaço`, seguida de outra tecla. Por exemplo, é possível pressionar `espaço` seguido de `e` para abrir o explorador de arquivos. Dentro do neo-tree, é possível navegar usando as teclas `hjkl`. Para abrir diretórios, é possível usar a tecla `l`, e para fechá-los, a tecla `h`.

Para maiores configurações, você pode acessar a [documentação LSP](https://astronvim.com/Recipes/advanced_lsp) Contendo um tutorial mais completo a respeito do astroNvim e das configurações acessando cada arquivo. Além da [documentação Debugger](https://astronvim.com/Recipes/dap). Por hora, iremos configurar apenas o padrão.

## Comandos Para o AstroNvim

### Comando simples

| Comando     | Descrição                                                                               |
| ----------- | --------------------------------------------------------------------------------------- |
| `Space`     | Esta é a tecla líder no AstroVim. É usada para acionar a maioria das ações no AstroVim. |
| `Space + e` | Isto abre o explorador de arquivos no AstroVim.                                         |
| `hjkl`      | Estas teclas são usadas para navegar dentro do explorador de arquivos NeoTree.          |
| `l`         | Esta tecla é usada para abrir um diretório no NeoTree.                                  |
| `h`         | Esta tecla é usada para fechar um diretório no NeoTree.                                 |
| `Space + o` | Isto retorna o foco para o NeoTree.                                                     |
| `Ctrl + s`  | Isto é usado para salvar as alterações em um arquivo.                                   |
| `Ctrl + q`  | Isto é usado para sair do AstroVim.                                                     |
| `Space + n` | Cria um novo arquivo                                                                    |
| `Space + h` | Abre a tela inicial do AstroNvim                                                        |

## Estrutura de Arquivos de Configuração

```
├── highlights
│   ├── duskfox.lua
│   └── init.lua
├── init.lua
├── mappings.lua
├── options.lua
└── plugins
    ├── community.lua
    ├── core.lua
    ├── mason.lua
    ├── null-ls.lua
    ├── treesitter.lua
    └── user.lua
```

### Init.lua

O Astro utiliza a linguagem Lua, uma linguagem simples de script para configuração. O seu arquivo `init.lua` contém algumas configurações importantes como `updater` , `colorscheme` , `formatting` dentro da configuração `LSP` , e uma função `polish` que pode rodar qualquer código no final da inicialização.

### Mappings.lua

Dentro do arquivo `mappings.lua` podemos mapear nossas teclas, usando configurações separadas por modo. No arquivo `mappings.lua`, temos a letra "N" como "Normal Mode", "T" para terminal, "I" para o "Insert Mode" e "V" para o "Visual Mode". Caso queira criar algum atalho utilizando a Tecla `Espaço`, você poderia adicionar um novo comando dentro do modo "N" como no exemplo abaixo:

![[Pasted image 20230501231614.png]]

O comando é um exemplo de como printar "Hello World" usando apenas os atalhos `Espaço + Tecla a` .

> Para executar um comando, lembre-se de finalizar utilizando o comando `cr` que funciona como "Carriage Return" para a tecla Enter.

### Pasta Plugins

Para configurar plugins no AstroNvim, você pode editar os arquivos dentro da pasta `plugins`. Para melhor compreensão segue as especificações de alguns arquivos importantes e suas respectivas configurações.

#### Treesitter.lua

Um arquivo que retorna uma configuração para o treesitter, que é um "Code Highlighter" que auxilia na visualização do código. Para utilizá-lo, você precisa adicionar os Languages Parsers, ou dentro da chave "OPTS" (utilizando o ensure_installed) ou utilizando o comando :TSInstall

#### Mason.lua

Um arquivo que contém configurações sobre múltiplos plugins que podem ser baixados e configurados para utilizar, como Language Servers, Linters, Formatters e Debuggers. Por hora, mantenha o arquivo na seguinte configuração:

> Você pode encontrar um `Package List` do Mason [nesse link](https://mason-registry.dev/registry/list).

![[Pasted image 20230501231503.png]]

#### User.lua

Neste arquivos adicionaremos configurações de plugins que adicionamos fora do AstroNvim. Para isso utilizaremos um exemplo do [repositório TODO comments](https://github.com/folke/todo-comments.nvim) , certifique de possuir todos os requerimentos para instalação do pacote, como uma [patched font](https://www.nerdfonts.com/) e o [ripgrep](https://github.com/BurntSushi/ripgrep) por exemplo. Utilizando a configuração padrão de acordo com o repositório temos o arquivo da seguinte maneira:

![[Pasted image 20230502004708.png]]

Para configurar mais a fundo nossos plugins instalados, precisamos entender melhor como funciona o gerenciador LAZY.

#### Lazy Events

O gerenciador de plugins Lazy do AstroVim é configurado para carregar plugins de forma preguiçosa (lazy) por padrão, com o objetivo de melhorar a performance. O termo "Lazy" faz referência à preguiça em carregar todos os plugins de uma vez só. É possível especificar eventos, comandos ou atalhos que carregam o plugin. Caso deseje desativar o carregamento preguiçoso, basta definir a chave "lazy" como false. Neste caso, para carregar o plugin quando um arquivo é aberto, utilize o evento "User AstroFile". Existem outros eventos comuns que podem ser utilizados para carregar plugins, sendo o evento "VeryLazy" útil para carregar plugins na inicialização. Depois de reiniciar, é possível observar o Lazy instalando o novo plugin.

| Evento           | Quando é acionado                      |
| ---------------- | -------------------------------------- |
| User AstroFile   | Acionado quando um arquivo é aberto    |
| VeryLazy         | Acionado assim que o Neovim é iniciado |
| BufEnter \* .lua | Acionado ao abrir um arquivo Lua       |
| InsertEnter      | Acionado ao iniciar o Insert Mode      |
| LspAttach        | Acionado depois de iniciar os LSPs     |

Sendo que os eventos podem ser um ou mútiplos:

```lua
event = "User AstroFile"
ou
event = {"InsertEnter", "User AstroFile"}
```

Agora que já entendemos como funciona o gerenciador Lazy, podemos continuar configurando nosso plugin TODO. Para isso, temos o arquivo `user.lua` editado.

![[Pasted image 20230502005849.png]]

A chave `event` está relacionado ao formato de carregamento do Lazy. Como definimos para o evento somente carregar o Plugin quando o arquivo estiver aberto, podemos usar a chave `cmd`, para configurar algum comando que desejamos realizar fora do AstroNvim. As keys funcionam da mesma maneira que no arquivo `mappings.lua`, podendo ser adaptadas para um atalho novo, como no exemplo que usei as teclas `Espaço + T (maiúsculo)` para que funcione como o comando que abre o Telescope para visualizar meus TODOs.

## AstroNvim Community

Uma das features que o AstroNvim entrega é a sua comunidade de plugins, contendo configurações simplificadas para instalar plugins dentro do AstroNvim.

Caso você deseje dar uma olhada nos plugins criados ou feitos pela comunidade. Você pode acessar [o repositório da comunidade AstroNvim](https://github.com/AstroNvim/astrocommunity). A comunidade facilita a instalação dos plugins, permitindo ao usuário que adicione plugins para gestão de projetos, colorscheme para personalização da IDE, e languages packs com apenas uma linha de comando, como no exemplo.

![[Pasted image 20230502094740.png]]

## Features do AstroNvim

### Which-Key

Ao pressionar uma tecla de comando como o `espaço`, um popup de opções irá aparecer no painel da IDE para autocompletar o seu comando, ou seja, o AstroNvim sempre lhe dará sugestões de comando ao pressionar uma tecla gatilho. Os sub-menus com mais opções estará destacado de azul

### Telescope

Para abrir o telescope, temos com o exemplo o comando `space + ff` e o `space+fo`, ao entrar em algum desses modos, por padrão você estará no modo de Inserção. para buscar, comece a digitar, e use os atalhos `ctrl+j` e `ctrl+k` para navegar nos arquivos. Do lado direito, onde aprece uma pré do arquivo, você pode utilizar os comandos `ctrl+d` e `ctrl+u` para navegar para cima e para baixo nos arquivos visualizados. Ao clicar em `esc` você sai do modo de Inserção e volta ao modo normal, permitindo que navegue no campo de busca utilizando os comandos `hl` para navegar na caixa de pesquisa e os comando `jk` para navegar nos arquivos buscados. Use o comando `?` para abrir um popup de opções de comandos. Use os comandos `ctrl+p` e `ctrl+n` para retornar e avançar nas últimas buscas feitas. use os comandos `espaço+fw` e `espaço+fc`, para procurar palavras específicas e para procurar por palavras semelhantes a que está no seu cursor.

> Um outro atalho importante não mencionado aqui, é o `space+/` que comenta as linhas selecionadas ou a linha atual que está digitando.

### Buffers

Para criar um novo buffer, utilize o `space+n` e para fechar, utilize o `space+c`, para navegar entre as abas, utilize o comando `[+b` e `]+b`

### NeoTree

Para abrir o gerenciador de arquivos, utilize o comando `space+e` e para visualizar os demais comandos, utilize o `?`. Alguns comandos úteis incluem o `space+H` para mostrar e esconder arquivos escondidos como `.git` por exemplo. A tecla `a` permite que você crie arquivos ou diretórios, enquanto que as teclas `r` e `d` permitem que você delete os arquivos.

### Splits

O comando `space+o` muda o foco entre o neotree e os buffers, utilize o comandos `ctrl+l` e `ctrl+h` para navegar entre buffer e neotree também. Utilize o comando `space+\` para dividir o buffer horizontalmente. Utilize o comando `ctrl+|` para dividir verticalmente, e o `ctrl` seguido das teclas de navegação `hjkl` permitem que você navegue entre as "split buffers". Para redimensionar utilize o `ctrl` seguido da teclas com seta de navegação (Arrow Keys) e para fechar use o comando `ctrl+q`, utilizando as teclas `< ou >` seguido da tecla `b` você move o seu buffer para esquerda ou direita, respectivamente.

### Git Integration

Utilize o comando `espaço + g` para ver as opções possíveis de integração entre o AstroNvim e o Git.

### Language Support

O AstroNvim pode auxiliar no suporte a linguagem, alguns dos atalhos mais úteis estão nessa tabela de exemplo:

| Key                       | Descrição                                                                                                                                             |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| Ctrl+espaço               | Completar código automaticamente durante a digitação                                                                                                  |
| Ctrl+e                    | Fechar a janela de completar código                                                                                                                   |
| K                         | Mostrar uma prévia do tipo do símbolo sob o cursor                                                                                                    |
| gT                        | Ir para a definição de tipo de um símbolo                                                                                                             |
| Ctrl+o                    | Voltar da definição de tipo de um símbolo                                                                                                             |
| gI                        | Ir para a implementação de um símbolo                                                                                                                 |
| gd                        | Ir para a definição de um símbolo                                                                                                                     |
| gr                        | Mostrar referências de um símbolo em todo o projeto                                                                                                   |
| gl                        | Ver a mensagem completa de erro                                                                                                                       |
| gl(gl novamente)          | Ir para dentro da janela pop-up da mensagem de erro                                                                                                   |
| q                         | Fechar a janela pop-up da mensagem de erro                                                                                                            |
| `[`                       | Ir para o erro anterior                                                                                                                               |
| ]                         | Ir para o próximo erro                                                                                                                                |
| leader l D                | Ver todas as mensagens de diagnóstico no buffer                                                                                                       |
| leader l r                | Renomear símbolos                                                                                                                                     |
| leader l f                | Formatar o buffer                                                                                                                                     |
| leader l a                | Exibir ações de código e aplicá-las                                                                                                                   |
| Enter                     | Aplicar ação de código selecionada                                                                                                                    |
| F7                        | Alternar terminal flutuante                                                                                                                           |
| jj or jk                  | Substituir o pressionamento da tecla Esc na inserção de texto                                                                                         |
| Ctrl+clique em um símbolo | Ir para a definição de um símbolo                                                                                                                     |
| Clicar nas migalhas       | Ir para uma parte específica do código                                                                                                                |
| Mouse                     | Usar o mouse para selecionar, focar, mudar e fechar buffers, abrir arquivos, selecionar guias, mudar branches git e ver informações detalhadas de LSP |
| Alt                       | Selecionar um bloco de texto                                                                                                                          |
| leader Shift+s, s         | Salvar sessão                                                                                                                                         |
| leader Shift+s, .         | Carregar sessão                                                                                                                                       |

## Conclusão

O AstroNvim é uma ótima opção para quem deseja usar o Terminal como uma IDE. Com suas configurações pré-configuradas e plugins, você pode melhorar significativamente sua eficiência e produtividade na edição de código. Com o suporte a servidores de idiomas e o gerenciador de plugins Lazy, você pode personalizar sua experiência de edição de acordo com suas necessidades específicas. Espero que este guia o ajude a começar a usar o AstroNvim em seu projeto! Usando o AstroNvim, podemos transformar nosso terminal em uma poderosa IDE para programação. Com recursos avançados de edição de texto, integração com Git e servidores de linguagem, o AstroNvim pode ajudar a melhorar a eficiência e produtividade do nosso fluxo de desenvolvimento. Ao seguir as etapas descritas neste guia, podemos instalar e configurar facilmente o AstroNvim em nosso terminal e começar a escrever código com mais facilidade.
