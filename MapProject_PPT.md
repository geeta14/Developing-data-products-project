CountryExMap database Explorer
========================================================
author: Geeta Nain
date  : December 28 15


Introduction
========================================================

This presentation is intended to provide information on application developed as course project of Developing Data Products course.
- original version is tagged as a []


## Objective
-Objective of this app is to provide more friendly user interface to highlight and analyze all the country of desired environmental region based on some unique attributes i.e. Populations, GDP etc


Data and R functions used
========================================================
This application is based on the countryExData database under package rworldmap [https://cran.r-project.org/web/packages/rworldmap/rworldmap.pdf].

-CountryExData is an example dataset for country level data (2008 Environmental Performance
Index)

-A dataframe containing example country level data for 149 countries. This is the 2008 Environmental
Performance Index (EPI) downloaded from http://epi.yale.edu/. Used here with permission,
further details on the data can be found there. The data are referenced by ISO 3 letter country codes
and country names


Input and Output variables
========================================================
## Input variables
- Popluation2005, GDP_capita.MRYA of CountryExMap database


## Output variables
- highlighted desired regions by country wise distribution of given input attributes


Conclusion and scope
========================================================
-You can adjust regions using control panel located on the left side. Filtered countries with sorted factors of different attributes can be viewed via highlighted colored countries

-This App can be further utilized to explore more interactive grapices to manipulate more attributes like Climate, Biodiversity, AIR, Water etc
