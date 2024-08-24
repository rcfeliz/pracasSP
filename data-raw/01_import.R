
# base de praças e canteiros ----------------------------------------------

pracas <- readr::read_csv("/Users/feliz/Downloads/81141_PRAÇAS E CANTEIROS MAPEADOS.XLSX - Sheet2.csv") |>
  janitor::clean_names() |>
  dplyr::mutate(dplyr::across(
    c(descricao, zona),
    ~stringr::str_to_sentence(.x)
  )) |>
  dplyr::rename(area = area_total_aproximada_m2)

usethis::use_data(pracas, overwrite = TRUE)

# base de termos ----------------------------------------------------------

termos <- readr::read_csv("/Users/feliz/Downloads/81141_TERMOS DE COOPERAÇÃO VIGENTES.XLSX - Lista de Termos de Cooperação.csv") |>
  janitor::clean_names() |>
  dplyr::rename(subprefeitura = sub_resp) |>
  dplyr::mutate(
    dt_expiracao = lubridate::mdy(dt_expiracao)
  )

usethis::use_data(termos, overwrite = TRUE)
