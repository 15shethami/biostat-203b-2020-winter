library(wesanderson)

china_map <- function(plotdate, case, name){
  ncov_tbl %>%
    filter(`Country/Region` %in% c("Mainland China", "Macau", "Hong Kong", "Taiwan")) %>%
    filter(Date == plotdate, Case == case) %>%
    group_by(`Province/State`) %>%  
    top_n(1, Date) %>% # take the latest count on that date
    right_join(chn_prov, by = c("Province/State" = "NAME_ENG")) %>%
    
    ggplot() +
    geom_sf(mapping = aes(fill = Count, geometry = geometry)) +
  scale_fill_gradientn(colors = wes_palette("Zissou1", 100, type = "continuous"),
                       trans = "log10") +
  theme_bw() +
  labs(title = str_c("Map of ", name, " Cases in China"), subtitle = plotdate)
}

province_bar <- function(plotdate, case, color, name){
  ncov_tbl %>%
    filter(`Country/Region` %in% c("Mainland China", "Macau", "Hong Kong", "Taiwan")) %>%
    filter(Date == plotdate, Case == case) %>%
    group_by(`Province/State`) %>% 
    ggplot(mapping = aes(x = `Province/State`, y = `Count`)) +
    geom_col(fill = color) + 
    scale_y_log10() + 
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90)) + 
    labs(title = str_c("Barplot of " , name, " Cases per Province"), subtitle = plotdate)
}

stock_plot <- function(symb){
  y_name <- str_remove(symb, "[^[:punct:]]")
  y_col <- str_c(y_name, ".Adjusted")
  getSymbols(symb, 
             src = "yahoo", 
             auto.assign = FALSE,
             from = "2019-12-01",
             to = max(ncov_tbl$Date)) %>% 
    as_tibble(rownames = "Date") %>%
    mutate(Date = date(Date)) %>%
    ggplot(mapping = aes(x = Date, y = eval(parse(text = y_col)))) +
    geom_line(colour = "red") +
    geom_point() +
    theme_bw() +
    labs(title = "Effects of Coronovirus on Stock Market", y = y_col)
}

