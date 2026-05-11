#set text(lang : "pt", overhang : false)
#set par(justify : true)

#let sacc = [_Saccharomyces cerevisiae_]
#let peni = [_Penicillium chrysogenum_]

= revisão
  A industria de biotecnologia é responsável por produções alternativas de compostos usuais na nossa sociedade, utilizando organismos vivos para produzir alimentos, biocombustiveis @nielsen_0, farmacos @zhang_0 e compostos químicos @meadows_0. No balanço de sustentabilidade, estas rotas alternativas, utilizando organismos modificados ou não, permitem uma aproximação orgânica e amigavel com o meio ambiente para os processos produtivos envolvidos, promovendo uma transição para uma economia verde, ou seja, reduzindo o saldo de carbono emitido @naseri_0. Estas alternativas não são à principio uma degressão em produtividade nas cadeias produtivas mencionadas em prol da sustentabilidade, mas sim, puramente uma evolução em eficiência na alocação de espaço físico, consumo de insumos e geração de subprodutos @metcalfe_0. A sustentabilidade é mais um ponto positivo que pesa a favor de implementações em grande escala de processos que utilizem técnicas em biotecnologia em suas rotas produtivas.

  == biorreatores
    Biorreatores fornecem ambientes favoráveis para o crescimento de culturas de microrganismos e podem ser otimizados para a produção de determinado produto bioquímico, desde que haja acesso a mecanismos de controle das variáveis físicas envolvidas, o que geralmente é oferecido por reatores projetados especificamente para essa finalidade. A necessidade de um projeto de biorreator decorre da responsabilidade de garantir a reprodutibilidade dos processos bioquímicos desenvolvidos ao longo de uma cadeia produtiva. A possibilidade de controlar algumas variáveis --- ou até mesmo todas aquelas avaliadas como impactantes para a conversão final --- é uma característica indispensável para aplicações industriais de rotas produtivas desenvolvidas em laboratório. A princípio, uma vez determinadas as condições de operação na etapa experimental, basta ajustar as variáveis extensivas do processo para uma escala industrial.

    Segundo #cite(<erickson_0>, form: "prose"), existem diversas formas de classificar biorreatores, seja pelo tipo de alimentação ou pelos produtos finais obtidos. Existem três tipos principais de alimentação: batelada, alimentação alternada e alimentação contínua. A alimentação em batelada ocorre quando o substrato é introduzido no sistema apenas no início do processo, sem manipulações externas posteriores na quantidade de fonte de carbono. A alimentação alternada consiste em uma estratégia de distribuição da fonte de carbono seguindo um cronograma, diferenciando-se da primeira pela possibilidade de introdução de substrato durante o experimento. Por fim, a alimentação contínua caracteriza-se pela introdução constante de alimento ao longo de todo o processo, representando uma tentativa de reproduzir um sistema estacionário a partir da manutenção da concentração de substrato no biorreator.


    #figure(image("../image/bioreactor_illustration.jpeg", width : 100pt),
      caption : [Ilustração de biorreator genérico]
    ) <bioreactor_illustration>

    Quando tratamos de processos aeróbicos, é necessário fornecer oxigênio para o desenvolvimento da cultura. Nessa perspectiva, boa parte dos reatores destinados ao cultivo de organismos aeróbicos necessita de agitação para uniformizar a concentração de oxigênio em todo o meio, o que é naturalmente dificultado pela baixa solubilidade do oxigênio em água. Isso pode ser realizado por meio de reatores de mistura, colunas de ar dissolvido, membranas ou pelo aumento da área de interface líquido-gás, o que não ocorre necessariamente em processos anaeróbicos ou em sistemas envolvendo culturas mistas @erickson_0. Essa última opção tem como proposta estimular a competição entre diferentes variantes presentes com base na seleção natural. Portanto, os tipos de cultura influenciam diretamente no projeto físico do biorreator.

    Outra condição de operação que influencia drasticamente tanto o projeto físico quanto o modelo matemático de um reator é a fase dos reagentes e produtos. Em fase líquida, a cinética bioquímica depende da concentração dos reagentes e, em alguns casos, também da concentração dos produtos. Para muitas reações bioquímicas, essa abordagem cinética pode ser tratada, com boa aproximação, considerando dependência de primeira ordem em baixas concentrações e de ordem zero em concentrações elevadas *michaelis*. Em fase sólida, a cinética bioquímica torna-se mais dependente da disposição espacial do substrato sólido e do contato superficial deste substrato com o microrganismo. Dessa forma, uma solubilidade substancial dos reagentes é essencial para garantir adequada difusão no meio e, consequentemente, a formação do produto de interesse @bhargav_0. Em alguns sistemas, utilizam-se bioenzimas para hidrolisar o substrato em reagentes mais solúveis, aumentando a conversão por unidade de tempo.

    O controle das variáveis físicas envolvidas é importante para a predição da resposta do sistema em relação a qualquer perturbação de entrada, bem como para a manipulação do sistema, de forma que os resultados de réplicas experimentais sejam os mais semelhantes possíveis dentro das limitações de sistemas não determinísticos. Entre as variáveis que podem ser medidas em um biorreator estão temperatura, pressão, pH, potência de agitação, fluxo de gases e líquidos, concentração de gases, concentração de biomassa e tensão interfacial @erickson_0.

  == fermentação
    A fermentação ocupa posição de destaque na indústria biotecnológica, assumindo protagonismo, ainda hoje, em rotas produtivas de compostos essenciais para a sociedade @metcalfe_0. Grande parte das vacinas, medicamentos e biocombustíveis é obtida preferencialmente por processos fermentativos, e sua viabilidade econômica decorre justamente da rota empregada. Caso contrário, métodos alternativos de produção seriam mais trabalhosos, dispendiosos e provavelmente economicamente inviáveis na escala atual.

    Os microrganismos responsáveis pela fermentação podem ser bactérias, leveduras, arqueias, fungos ou células de mamíferos @muller_0. Portanto, existe uma ampla variedade de caminhos metabólicos possíveis considerando o conjunto desses organismos. As leveduras, por exemplo, são responsáveis pela produção de etanol, pão, bebidas alcoólicas, penicilina, entre outros produtos. Isso reforça a relevância econômica e social desses microrganismos e de suas aplicações industriais.

    A produção de etanol por fermentação é um dos processos biotecnológicos mais importantes da indústria moderna, sendo amplamente utilizada para a obtenção de biocombustíveis e produtos químicos renováveis @dashko_0. Nesse processo, leveduras como #sacc convertem açúcares provenientes de matérias-primas vegetais, como cana-de-açúcar, milho e biomassa lignocelulósica, em etanol e dióxido de carbono sob condições anaeróbicas @bhargav_0. A fermentação alcoólica apresenta grande relevância econômica, especialmente em países como o Brasil, onde o etanol é utilizado em larga escala como combustível automotivo. Além de sua aplicação energética, o etanol também é empregado nas indústrias farmacêutica, alimentícia e química, muitas vezes na forma de gel ou liquida em diversas concentracoes para ser utilizado na esterilizacao.

    #figure(image("../image/yeast_cell_illustration.jpeg", width : 100pt),
      caption : [Ilustração de levedura]
    ) <yeast_illustration>

    A @yeast_illustration mostra uma célula de levedura. Nela, é possível observar o núcleo, onde se encontra o material genético principal dos estudos de modificação genética. A mitocôndria também possui material genético, embora a extensão dos estudos relacionados à sua manipulação seja menor quando comparada à do núcleo. Um ponto importante na compreensão das reações químicas de oxirredução @muller_0 é que elas ocorrem no citoplasma ou são coordenadas na mitocôndria quando associadas a processos aeróbicos.

  == fermentação alcoólica
    No que se refere à produção de álcool a partir de fontes de carbono, as leveduras desempenham papel fundamental. Em especial, #sacc representa um grupo extremamente relevante nesse processo. Do ponto de vista evolutivo, essas leveduras desenvolveram essa capacidade inicialmente em resposta ao surgimento de frutas, fontes naturais de açúcares simples, possibilitando a conversão desses açúcares em álcool tanto em condições aeróbicas quanto anaeróbicas @dashko_0.

    Em geral, o metabolismo de um microrganismo pode ser modificado por meio da inserção de genes reacionais em estequiometria adequada para maximizar determinado produto ou inibir mecanismos metabólicos específicos. #cite(<meadows_0>, form: "prose") trabalhou na modificação do genoma de variantes de #sacc e demonstrou a possibilidade de aumentar significativamente a seletividade de caminhos metabólicos de interesse, especificamente na produção de precursores de ácidos isoprenoides utilizados no tratamento da malária. Em situações como essa, estudadas por #cite(<meadows_0>, form: "author"), o metabolismo torna-se diferente daquele naturalmente encontrado em variantes de #sacc. Entretanto, ao restringir a análise ao metabolismo nativo genérico, caracterizado principalmente pelo consumo de glicose e pela formação de etanol, é possível visualizar o mecanismo representado na @alcoholic_fermentation.

    #figure(image("../image/alcoholic_fermentation.jpg", width : 100pt),
      caption : [Mecanismo genérico parcial de fermentação alcoólica]
    ) <alcoholic_fermentation>

    A @alcoholic_fermentation mostra a esquematização da rota de produção de etanol na fermentação alcoólica, onde os açúcares, especialmente glicose e sacarose, são metabolizados pelas leveduras em condições predominantemente anaeróbicas. Nesse processo, a glicose é convertida em piruvato pela glicólise e, posteriormente, em etanol e dióxido de carbono. Sendo que durante a glicólise há formação de ATP e de NADH, enquanto que na formação de etanol a partir de Acetaldeido o NADH é consumido, ou seja, um ciclo de consumo e regeneração de NADH.

  == fermentação escura
    Combustivel fossil permitiu com que nos desenvolvessemos durante seculos, nos dando a oportunidade de estabilizar nossa sociedade, e acelerar a globalizacao atraves das comodidades fornecidas pela sua utilizacao (industrializacao e transporte). Apesar da necessidade primitiva de conquistar o primeiro metodo de producao de engergia em larga escala ter sido importante para a nossa sociedade, este tem impactos profundos na manutencao da saude do nosso planeta a longo prazo. Pensando nisso, e levando em consideracao que atualmente temos capacidade tecnologica de implementacao de substitutos para a modalidade ainda vigente de geracao energetica <[7]>, e valido reinterar as conquistas cientificas de metodos alternativos de geracao de energia. Inclusive, ate entao as alternativas mais promissoras, par a par com combustiveis fossils, para geracao de energia, sao rotas partidas de restos organicos, mediante tratamento termoquimico e bioquimico <[8]>.

    O hidrogenio tem muito potencial para ser utilizado em larga escala como combustivel. Nesta linha, ele pode ser applicado como um biocombustivel gasoso, ou tambem convertido em hidrocarboneto ou em eletricidade atraves de celulas de combustivel @das_0. Para o proposito de queima, hidrogenio tem um valor calorifico de $120 "MJ" "kg"^-1$, isto para seu valor mais baixo @sarangi_0, equivalente a $2.75 "kg"$ of gasoline <[18]>. Isto o torna relativamente vantajoso, e procurado, alem da sua reacao de combustao ser amigavel com o meio ambiente, porque a especie quimica produzida pela combustao do hidrogenio e simplesmente agua.

    As rotas para producao de hidrogenio sao diversas. Podemos partir de hydrocarbonetos ou gas natural, agua e biomassa, em uma lista exaustiva de processos; reforma de gas natual, quebra de gas natural, gaseificacao de carvao, oxidacao parcial de hidrocarbonetos, pirolise, eletrolise, fotolise, termolise ou produçao biologica @das_0. 

    Essas rotas, termoquimicas e eletroquimicas apresentadas em sua maioria demandam bastante energia durante sua operacao, e boa parte nao e considerada sustentavel. Se opondo a essas caracteristicas desgradaveis, a producao de hidrogenio na rota biologica, opera em condicoes normais de temperatura e pressao, consequentemente, requer menor intensidade energetica para funcionamento @das_0.

    - Biophotolysis
    - Foto decomposicao
    - Hidrogenio fermentitivo
    - Sistema hibrido

#bibliography("reference.bib", full : true, style : "apa")
