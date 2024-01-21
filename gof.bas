10 print chr$(147)
20 dim a(10,10),b(10,10)
30 for x=1 to 10
40   for y=1 to 10
50     a(x,y)=int(rnd(1)+.5)
51     print "checkup A: "; a(x,y)
60     poke 1024+(y-1)*40+x, a(x,y)*160
70   next y
80 next x
90 for it=1 to 500
91   hu% = int(it / 100)
92   te% = int((it - hu% * 100) / 10)
93   oi% = it - (hu% * 100) - (te% * 10)
94   poke 1061, 48 + hu%
95   poke 1062, 48 + te%
96   poke 1063, 48 + oi%
100  for x=1 to 10
110    for y=1 to 10
120      c=0
130      for i=-1 to 1
140        for j=-1 to 1
150          vn = x+i>=1 and x+i<=10 and y+j>=1 and y+j<=10
151          nc = not (i=0 and j=0)
152          if vn and nc then c = c + a(x+i, y+j)
160        next j
170      next i
180      if (c=3) or (a(x,y) and c=2) then b(x,y) = 1: goto 190
181      b(x,y) = 0
190    next y
200  next x
210  for x=1 to 10
220    for y=1 to 10
230      a(x,y)=b(x,y)
237      print "value b: "; b(x,y)
238      print "value a: "; a(x,y)
239      print "poke address: "; 1024+(y-1)*40+x; " value: "; a(x,y)*160
240      poke 1024+(y-1)*40+x, a(x,y)*160
250    next y
260  next x
270 next it

51
237
238
239
