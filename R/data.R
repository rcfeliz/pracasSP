#' Dados das praças e canteiros da cidade de São Paulo
#'
#' Um dataset contendo atributos de 6500 praças e canteiros da cidade
#' de São paulo. As variáveis são as seguintes:
#'
#' \itemize{
#'   \item ativo. número de identificação das praças ou canteiros
#'   \item descricao. tipo de objeto (Praça, Canteiro Central)
#'   \item logradouro. nome da rua em que fica localizada a praça ou o canteiro
#'   \item numero. complemento numérico do logradouro
#'   \item bairro. bairro em que fica situada a praça ou canteiro
#'   \item cep. código do endereço
#'   \item zona. zona dentro da cidade de São Paulo em que fica localizada a praça ou canteiro (Norte, Sul, Centro, Leste, Oeste, Sem identificação)
#'   \item status. se o cadastro da praça está ativo ou não (Ativo, Inativo)
#'   \item subprefeitura. subprefeitura em que fica localizada a praça ou canteiro
#'   \item latitude. latitude da praça ou canteiro
#'   \item longitude. longitude da praça ou canteiro
#'   \item area. área aproximada da praça ou canteiro em metros quadrados (m2).
#' }
#'
#' @docType data
#' @keywords datasets
#' @name pracas
#' @usage data(pracas)
#' @format Um data frame com 6500 linhas e 12 variáveis
NULL

#' Dados dos termos de compromisso relacionado às praças e canteiros da cidade de São Paulo
#'
#' Um dataset contendo informações dos 807 termos de compromisso relacionados
#' às praças e canteiros da cidade de São paulo. As variáveis são as seguintes:
#'
#' \itemize{
#'   \item processo_sei. número SEI do processo administrativo que gerou o termo de compromisso da praça ou canteiro
#'   \item praca_canteiro. nome da praça ou canteiro
#'   \item dt_expiracao. data de expiração do termo de compromisso.
#'   \item subprefeitura. subprefeitura em que fica localizada a praça ou canteiro.
#' }
#'
#' @docType data
#' @keywords datasets
#' @name termos
#' @usage data(termos)
#' @format Um data frame com 807 linhas e 4 variáveis
NULL
