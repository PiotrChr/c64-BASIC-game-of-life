3 print "Enter grid width (max 40):";: input w
4 print "Enter grid height (max 25):";: input h
5 if w>40 then w=40
6 if h>25 then h=25
7 print chr$(147)
8 sc% = int((40 - w) / 2)
9 sr% = int((25 - h) / 2)
10 header$ = "c64 game of life"
11  for i = 1 to len(header$)
12      char = asc(mid$(header$, i, 1))
13      if char>64 then char = char-64
15      poke 1023 + 12 + i, char
16  next i
20 dim a(w,h),b(w,h)
30 for x=1 to w
40   for y=1 to h
50     a(x,y)=int(rnd(1)+.5)
51     print "checkup A: "; a(x,y)
60     poke 1024 + sc% + x + (sr% + y - 1) * 40, a(x, y) * 160
70   next y
80 next x
90 for it=1 to 500
91   hu% = int(it / 100)
92   te% = int((it - hu% * 100) / 10)
93   oi% = it - (hu% * 100) - (te% * 10)
94   poke 1061, 48 + hu%
95   poke 1062, 48 + te%
96   poke 1063, 48 + oi%
100  for x=1 to w
110    for y=1 to h
120      c=0
130      for i=-1 to 1
140        for j=-1 to 1
150          vn = x+i>=1 and x+i<=w and y+j>=1 and y+j<=h
151          nc = not (i=0 and j=0)
152          if vn and nc then c = c + a(x+i, y+j)
160        next j
170      next i
180      if (c=3) or (a(x,y) and c=2) then b(x,y) = 1: goto 190
181      b(x,y) = 0
190    next y
200  next x
210  for x=1 to w
220    for y=1 to h
230      a(x,y)=b(x,y)
237      print "value b: "; b(x,y)
238      print "value a: "; a(x,y)
239      print "poke address: "; 1024+(y-1)*40+x; " value: "; a(x,y)*160
240      poke 1024 + sc + x + (sr + y - 1) * 40, a(x, y) * 160
250    next y
260  next x
270 next it

51
237
238
239
