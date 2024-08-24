# base principal ---------------------------------------------------------

pracas_sub <- pracasSP::pracas |>
  dplyr::count(subprefeitura, name = "n_pracas")

termos_sub <- pracasSP::termos |>
  dplyr::count(subprefeitura, name = "n_termos")

idh_sub <- tibble::tibble(
  subprefeitura = pracas_sub$subprefeitura
) |>
  dplyr::mutate(
    idh = dplyr::case_match(
      subprefeitura,
      "AD" ~ .758,
      "AF" ~ .822,
      "BT" ~ .859,
      "CL" ~ .783,
      "CS" ~ .750,
      "CT" ~ .708,
      "CV" ~ .799,
      "EM" ~ .777,
      "FO" ~ .762,
      "G" ~ .713,
      "IP" ~ .824,
      "IQ" ~ .758,
      "IT" ~ .725,
      "JA" ~ .821,
      "JT" ~ .768,
      "LA" ~ .906,
      "MB" ~ .716,
      "MG" ~ .793,
      "MO" ~ .869,
      "MP" ~ .736,
      "PA" ~ .680,
      "PE" ~ .804,
      "PI" ~ .942,
      "PJ" ~ .787,
      "PR" ~ .731,
      "SA" ~ .909,
      "SB" ~ NA_real_,
      "SE" ~ .831,
      "SM" ~ .732,
      "ST" ~ .869,
      "VM" ~ .938,
      "VP" ~ .785
    )
  )

pracas_termos <- pracas_sub |>
  dplyr::left_join(termos_sub, by = "subprefeitura") |>
  dplyr::left_join(idh_sub, by = "subprefeitura") |>
  dplyr::rename(sp_sigla = subprefeitura) |>
  dplyr::mutate(
    sp_sigla = dplyr::if_else(sp_sigla == "G", "GU", sp_sigla)
  ) |>
  dplyr::mutate(n_termos = tidyr::replace_na(n_termos, 0L))

# base geo ---------------------------------------------------------------------
sub <- sf::read_sf("data-raw/polygons/SIRGAS_SHP_subprefeitura/SIRGAS_SHP_subprefeitura_polygon.shp") |>
  dplyr::left_join(pracas_termos, by = "sp_sigla") |>
  dplyr::group_by(sp_sigla) |>
  dplyr::mutate(
    prop_termos = n_termos / n_pracas
  ) |>
  dplyr::ungroup()

# plot sf -----------------------------------------------------------------

sub |>
  ggplot2::ggplot() +
  ggplot2::geom_sf(ggplot2::aes(fill = prop_termos)) +
  ggplot2::geom_sf_label(ggplot2::aes(label = sp_nome), size = 2) +
  ggplot2::theme_minimal() +
  terra::scalebar(location = "bottomleft", dist = 500, dist_unit = "km",
           transform = TRUE, model = "WGS84")

p_idh <- sub |>
  ggplot2::ggplot() +
  ggplot2::aes(fill = idh) +
  ggplot2::geom_sf() +
  ggplot2::theme_minimal()

