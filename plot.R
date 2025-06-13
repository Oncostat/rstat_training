library(ggplot2)
ggplot(data = mtcars,
       aes(x = disp, y = hp))+
  geom_point()
