Excel-Based-Utilities
=====================

Random Excel Based Templates, VBA Utilities, etc...

Contents:
*******************************************************
Color Palette Generator.xlsm
-------------------------------------------------------
Excel GUI to create custom color palettes for R or 
Excel. Useful for heat maps with arbitrary granularity 
or arbitrary number of pivot points (i.e. a Red-White-
Blue scale would have three pivot points). Create the 
scale visually; the file will fill in the gaps and 
generate R code to create a vector of the colors.

See example in "Wireframe Graph with Custom Color Palette.R"


*******************************************************
Full Year Calendar Generator.xlsx
-------------------------------------------------------
For an aribtrary year (post 1900), file generates a 
one-page, printable calendar for the full year. Months 
are arranged in a 4x3 grid. User types in the year at 
the top and the full calendar is automatically 
calculated. 


*******************************************************
ClearBelowDiag.bas
-------------------------------------------------------
Useful for actuaries doing loss-reserving. When 
building a reserve triangle, simply make the formula 
and drag it down and across. Then call this macro to 
clear everything below the diagonal of the square, 
leaving you with a nice loss triangle. Includes a 
prompt to the user to decide whether to clear the 
diagonal itself or not.