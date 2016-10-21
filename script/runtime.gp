reset
set ylabel 'exec time(ms)'
set xlabel 'inputs'
set title 'clz algorithm performance results'
set term png enhanced font 'Verdana,10'
set output 'runtime.png'
set datafile separator ","

plot [:][:0.25] 'output/clz_iteration.csv' using 1:2 with point title 'iteration' lt rgb '#f71b1b', \
'output/clz_binarySearch.csv' using 1:2 with point title 'binary' lt rgb '#f77e1b', \
'output/clz_byteShift.csv' using 1:2 with point title 'byte-shift' lt rgb '#f7d61b', \
'output/clz_Harley.csv' using 1:2 with point title 'Harley' lt rgb '#1bf76f', \
'output/clz_recursive.csv' using 1:2 with point title 'recursive' lt rgb '#1badf7', \
