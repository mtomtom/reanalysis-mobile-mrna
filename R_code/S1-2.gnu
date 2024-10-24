set terminal postscript color eps
set output "expectedRepsMobile.eps"
set size 3/6., 3/6.
set nogrid
set title "{/Symbol \263} 2 reads over 1 SNP in {/Symbol \263} 2 out of 3 reps"
load "stat.inc"
set key right bottom
set xlabel "N"
set ylabel "P(n_{1SNP}{/Symbol \263}2 in 2 out of 3|N,q)"
set log x
set log y
set yrange [1e-10:1]
set ytics nolog
plot "replMobileProbs.gnu" using 2:3 title "q=0.16%" w lines lt 1 lc 1 lw 3,\
 "replmobileprobs.data" using 2:4 title "q=0.08%" w lines lt 1 lc 2 lw 3,\
 "replmobileprobs.data" using 2:5 title "q=0.04%" w lines lt 1 lc 3 lw 3,\
 "replmobileprobs.data" using 2:6 title "q=0.02%" w lines lt 1 lc 4 lw 3,\
 "replmobileprobs.data" using 2:7 title "q=0.01%" w lines lt 1 lc 5 lw 3
