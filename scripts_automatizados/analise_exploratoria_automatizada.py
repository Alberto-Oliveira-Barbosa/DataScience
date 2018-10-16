import numpy as np
import pandas as pd

'''
Script que automatiza a análise inicial de um dataframe, apresentando resumo
estatístico e eliminando colunas para melhor visualização dos dados
'''

################################################################################
# Funções utilizadas pelo programa
################################################################################

def carregar_dados(df=''):

    nome_arq = input('Digite o nome do arquivo csv para carregar as informações  básicas sobre ele\n')
    dados = pd.read_csv(nome_arq)
    return dados, nome_arq


def menu(nome):
    print('\n\n--------------------------------------')
    print('DATAFRAME ATUAL:',nome,'\n')
    print('Selecione uma opção para continuar')
    print('1 - Apresentar resumo básico')
    print('2 - Resumo estatístico')
    print('3 - Deletar uma coluna')
    print('4 - Carregar um novo dataframe')
    print('5 - Gerar relatório completo')
    print('6 - Sair')
    print('--------------------------------------')
    op = input()
    return valida_opcao(op)

def valida_opcao(opcao):
    if(opcao not in '123456' or len(opcao) != 1):
        print('\n\nOpção Inválida!')
        menu()
    else:
        return int(opcao)

def dados_principais(df,nome):
    print('DATAFRAME ATUAL:',nome,'\n')
    print('\n\nColunas encontradas no dataframe:\n\n', df.columns)
    print('\nTipo de dados por coluna\n\n', dados.dtypes)
    print('\nQuantidade de observações\n\n', dados.count())
    print('\nPrimeiras observações\n\n', df.head())

def analise(df,nome):
    print('DATAFRAME ATUAL:',nome,'\n')
    print('\n\nResumo estatístico\n\n',df.describe())

def deletar_coluna(df,nome):
    print('DATAFRAME ATUAL:',nome,'\n')
    print('Colunas atuais:', df.columns)
    coluna = input('\nDigite o nome da coluna para ser deletada\n')
    if coluna in dados.columns:
        del dados[coluna]
        print('Coluna', coluna, 'removida com sucesso')
    else:
        print('Coluna', coluna, 'não encontrada')

def gerar_relatorio(df,nome):

    relatorio = """
    \rRESUMO DO DATAFRAME:  {}

    \n\nESTRUTURA:

    \rNome do arquivo: {}
    \rQuantidade de observações: {}
    \rQuantidade de colunas: {}
    \rNome das colunas:
    \r{}


    RESUMO DOS DADOS

    \rSoma dos valores das colunas:
    \r{}

    \rMenor valor:
    \r{}

    \rMaior valor:
    \r{}

    \rMédia:
    \r{}

    \rMediana:
    \r{}


    SUMÀRIO ESTATÍSTICO

    \r{}


    PRIMEIRAS OBSERVAÇÕES:

    \r{}""".format(str.upper(nome.split('.')[0]),nome,df.shape[0],df.shape[1],[i for i in df.columns],df.sum(),df.min(),df.max(), df.mean(), df.median(),df.describe(),df.head())

    op = input('Deseja visualizar na tela? S/N\n')
    if(op.upper()[0] == 'S'):
        print(relatorio)

    # Gera um arquivo txt com os dados do relatório
    with open(nome.split('.')[0] +'_relatorio.txt','w') as f:
        f.write(relatorio)
        print('Relatório Gerado com sucesso!')



###############################################################################




# primeira carga dos dados
try:
    dados, nome_arq = carregar_dados()

    # Lista com todas as funções do programa
    funcoes = [menu, dados_principais, analise, deletar_coluna, carregar_dados, gerar_relatorio]

    opcao = 0

    # Loop principal
    while (opcao <6):

        # carrega o menu
        opcao = funcoes[0](nome_arq)

        # carrega um novo dataframe
        if opcao == 4:
            dados, nome_arq = carregar_dados();continue

        # Encerra o loop
        if opcao == 6: break

        # carrega as demais funções
        funcoes[opcao](dados,nome_arq)
except Exception as e:
    print('Ocorreu um erro:\n',e)
