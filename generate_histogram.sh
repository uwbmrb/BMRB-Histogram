#!/bin/bash

cd /condor/bmrbgrid/histogram_generation

# Generate the pages using R
R CMD BATCH ./render_site.R

# Remove unnecessary jquery include (jquery is already included in page header)
sed -i -e 's/<script src="site_libs\/jquery-1.11.3\/jquery.min.js"><\/script>//g' ./_site/*.html

# Clean up some additional things in the files that the R libraries put there
sed -i -e 's/navbar-fixed-top//g' ./_site/*.html
sed -i -e 's/id="header"//g' ./_site/*.html

# Update the links to point to shtml pages
sed -i -e 's/\.html"/\.shtml"/g' ./_site/*.html

# Rename the pages to .shtml
rename .html .shtml ./_site/*html

# Remove files that are not needed
rm ./_site/README.shtml ./_site/pandoc_template.shtml

cp _site/*shtml /website/htdocs/histogram/

# Don't do this if you need access to the referenced libraries
rm -rf _site

