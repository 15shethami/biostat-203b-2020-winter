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
  # scale_fill_gradient(low = "white",
  #                     high = "red",
  #                     trans = "log10",
  #                     limits = c(1, 50000),
  #                     breaks = c(1, 10, 100, 1000, 10000),
  #                     name = "") +
  scale_fill_gradientn(colors = wes_palette("Zissou1", 100, type = "continuous"),
                       trans = "log10") + # can we find a better palette?
  # #scale_fill_brewer(palette = "Dark2") + 
  theme_bw() +
  labs(title = str_c("Map of ", name, " Cases in China"), subtitle = plotdate)
}

province_bar <- function(plotdate, case, name){
  ncov_tbl %>%
    filter(`Country/Region` %in% c("Mainland China", "Macau", "Hong Kong", "Taiwan")) %>%
    filter(Date == plotdate, Case == case) %>%
    group_by(`Province/State`) %>% 
    ggplot(mapping = aes(x = `Province/State`, y = `Count`)) +
    geom_col(fill = "darkblue") + 
    scale_y_log10() + 
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90)) + 
    labs(title = str_c("Barplot of " , name, " Cases per Province"), subtitle = plotdate)
}

