set terminal postscript color eps
set output "genomecompletness.eps"
set size 3/6., 3/6.
#set grid xtics
#set grid ytics
#set grid ztics
set view 60,60,1,1.7
set isosample 20
set xyplane at 0
set lmargin 5
set rmargin 0
set tmargin 5
set bmargin 5
# set for [x = 0:10:2] arrow from x, 10, 0 to x, 10, 10 nohead lt 0
 # set for [z = 0:10:2] arrow from -1, 10, z to 1, 10,   z nohead lt 0
# set for [y = 0:10:2] arrow from -1,   y, 0 to -1,   y, 10 nohead lt 0
# set for [z = 0:10:2] arrow from -1,   0, z to -1, 10,   z nohead lt 0
set xtics offset -0.3,-0.3
set ytics offset 0,-0.3
set ztics offset 0.3,0.3
set offsets 10, 10, 10, 10
# set key right
# mesh(x,y,z)
# set pm3d
set xlabel "p1" offset -1,-1
set ylabel "p2" offset 1,-0.5
set zlabel "p3" offset 2,0
max(x)=6*exp(-0.3*x)
pmax=0.5
# set arrow from max(0),0,0 to 0,max(0),0 nohead lt 1 lc 3 lw 1
splot [0:100][0:100][0:1] (pmax*(1-x/100)*y/100) notitle lc 3 lw 1
