#!/usr/bin/env python3
import os

i=5

if i <= 0:
	exit(0)

if not __debug__:
	i -= 1

sq,dq,pc,hs,bn,tb,ob,cb,bs,s="'",'"','%','#','\n','\t','{','}','\\',"{hs}!/usr/bin/env python3{bn}import os{bn}{bn}i={i}{bn}{bn}if i <= 0:{bn}{tb}exit(0){bn}{bn}if not __debug__:{bn}{tb}i -= 1{bn}{bn}sq,dq,pc,hs,bn,tb,ob,cb,bs,s={dq}'{dq},'{dq}','{pc}','{hs}','{bs}n','{bs}t','{ob}','{cb}','{bs}{bs}',{dq}{s}{dq}{bn}try:{bn}{tb}print(f{dq}{s}{dq}, file=open(f{dq}Sully_{ob}i{cb}.py{dq}, {dq}w{dq})){bn}{tb}os.system(f{dq}/usr/bin/env python3 -O Sully_{ob}i{cb}.py{dq}){bn}except:{bn}{tb}pass"
try:
	print(f"{hs}!/usr/bin/env python3{bn}import os{bn}{bn}i={i}{bn}{bn}if i <= 0:{bn}{tb}exit(0){bn}{bn}if not __debug__:{bn}{tb}i -= 1{bn}{bn}sq,dq,pc,hs,bn,tb,ob,cb,bs,s={dq}'{dq},'{dq}','{pc}','{hs}','{bs}n','{bs}t','{ob}','{cb}','{bs}{bs}',{dq}{s}{dq}{bn}try:{bn}{tb}print(f{dq}{s}{dq}, file=open(f{dq}Sully_{ob}i{cb}.py{dq}, {dq}w{dq})){bn}{tb}os.system(f{dq}/usr/bin/env python3 -O Sully_{ob}i{cb}.py{dq}){bn}except:{bn}{tb}pass", file=open(f"Sully_{i}.py", "w"))
	os.system(f"/usr/bin/env python3 -O Sully_{i}.py")
except:
	pass
