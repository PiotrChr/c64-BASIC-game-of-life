30 print "enter grid width (max 40):";: input w
40 print "enter grid height (max 25):";: input h
50 if w>40 then w=40
60 if h>25 then h=25
61 s = 40 / (w * h)
70 print chr$(147)
80 sc% = int((40 - w) / 2)
90 sr% = int((25 - h) / 2)
100 header$ = "c64 game of life"
110  for i = 1 to len(header$)
120      char = asc(mid$(header$, i, 1))
130      if char>64 then char = char-64
150      poke 1023 + 12 + i, char
160  next i
200 dim a(w,h),b(w,h)
300 for x=1 to w
400   for y=1 to h
500     a(x,y)=int(rnd(1)+.5)
510     print "checkup A: "; a(x,y)
600     poke 1024 + sc% + x + (sr% + y - 1) * 40, a(x, y) * 128 + 32
700   next y
800 next x
900 for it=1 to 500
901   pc = 0
910   hu% = int(it / 100)
920   te% = int((it - hu% * 100) / 10)
930   oi% = it - (hu% * 100) - (te% * 10)
940   poke 1061, 48 + hu%
950   poke 1062, 48 + te%
960   poke 1063, 48 + oi%
1000  for x=1 to w
1100    for y=1 to h
1200      c=0
1300      for i=-1 to 1
1400        for j=-1 to 1
1500          vn = x+i>=1 and x+i<=w and y+j>=1 and y+j<=h
1510          nc = not (i=0 and j=0)
1520          if vn and nc then c = c + a(x+i, y+j)
1600        next j
1700      next i
1701      pc = pc + s
1702      poke 1024 + 40 * 24 + int(pc), 160
1800      if (c=3) or (a(x,y) and c=2) then b(x,y) = 1: goto 1900
1810      b(x,y) = 0
1900    next y
2000  next x
2100  for x=1 to w
2200    for y=1 to h
2300      a(x,y)=b(x,y)
2370      print "value b: "; b(x,y)
2380      print "value a: "; a(x,y)
2390      print "poke address: "; 1024+(y-1)*40+x; " value: "; a(x,y)*160
2400      poke 1024 + sc% + x + (sr% + y - 1) * 40, a(x, y) * 128 + 32
2500    next y
2600  next x
2610  for i = 1024 + 40 * 24 to 1024 + 40 * 25 - 1
2620      poke i, 32
2630  next
2700 next it
3999 end
4000 poke 1024 + 40 * 24 + pc%, 160: return

510
2370
2380
2390
