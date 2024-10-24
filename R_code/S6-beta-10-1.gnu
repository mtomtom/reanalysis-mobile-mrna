set terminal postscript color eps
set output "log-errors-beta-10-1.eps"
set size 3/6., 3/6.
set nogrid
# unset xtics 
# unset ytics 
set key right
# set xlabel "q"
set xlabel "{/Symbol q}"
set ylabel "P({/Symbol q}|N,n)"
f(x,u1,u2) = x**(u1-1)*(1.0-x)**(u2-1)/Z(u1,u2)
Z(u1,u2)=gamma(u1)*gamma(u2)/gamma(u1+u2)
# set log x
# set log y
#set yrange [0:1]
set xrange [0:0.5]
# set ytics nolog
N=10
n=1
xPos = (n+1.0)/(N+2.0)
set arrow 1 front at xPos, graph 0 to xPos, graph 1 nohead lc 3 dt 3 lw 4
set label 1 front at xPos, graph 0 "q=<{/Symbol q}>=0.166" offset 0.5,11.0 tc lt 3
set style fill transparent solid 0.5 noborder
plot \
f(x,1+n,1+N-n) title "N=10,n=1" w filledcurves x1 lt 1 lc 3 lw 2
