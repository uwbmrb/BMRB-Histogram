# Set the current directory as the working directory
setwd('./')
# Specify the location of the pandoc libraries
Sys.setenv(RSTUDIO_PANDOC="/usr/lib/rstudio/bin/pandoc")
# Generate the pages
rmarkdown::render_site()

