set terminal postscript color eps
set output "log-errors-beta-1-1.eps"
set size 3/6., 3/6.
set nogrid
# unset xtics 
# unset ytics 
set key left
# set xlabel "q"
set xlabel "{/Symbol q}"
set ylabel "P({/Symbol q}|N,n)"
f(x,u1,u2) = x**(u1-1)*(1.0-x)**(u2-1)/Z(u1,u2)
Z(u1,u2)=gamma(u1)*gamma(u2)/gamma(u1+u2)
# set log x
# set log y
#set yrange [0:1]
set xrange [0:1]
# set ytics nolog
N=1
n=1
xPos = (n+1.0)/(N+2.0)
set arrow 1 front at xPos, graph 0 to xPos, graph 1 nohead lc 2 dt 3 lw 4
set label 1 front at xPos, graph 0 "q=<{/Symbol q}>=0.667" offset -10.5,10.0 tc lt 2
set style fill transparent solid 0.5 noborder
plot \
f(x,1+n,1+N-n) title "N=1,n=1" w filledcurves x1 lt 1 lc 2 lw 2