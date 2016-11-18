def f(x) 
	1/(x**2+1)
end

def trapezoid(xs,xe,n) 
	deltax = (xe-xs)*1.0/n 
	sum = (f(xs)+f(xe))/2.0 
	for i in 1..(n-1)
		sum = sum + f(xs+i*deltax) 
	end
return deltax * sum 
end

def pi(n)
	return 4.0*trapezoid(0,1,n)
end

def sympson(xs,xe,n)
	deltax = (xe-xs).to_f/(2*n)
	sum  = f(xs)+4*f(xs+deltax)+f(xe)
	for i in 1..(n-1)
		sum += 2.0*f(xs+2*i*deltax)+4.0*f(xs+(2*i+1)*deltax)
	end
return deltax * sum / 3.0
end

def pisy(n)
	return 4.0*sympson(0,1,n)
end

def montecarlo(n) 
	m = 0
	for i in 1..n
		x = rand() # random number in [0,1)
		y = rand()
		if x**2 + y**2 < 1.0
			m = m +1 
		end
	end
m.to_f/n 
end

def mcplot(n)
	a = make2d(500,500) 
	for i in 1..n
		x = rand() # random number in [0,1) 
		y = rand()
		if x*x + y*y < 1.0
			a[y*500][x*500] = 1.0 
		else
			a[y*500][x*500] = 0.5 
		end
	end
a 
end

def mcquadra(xs,xe,n)
	m = 0
	candidate = [xe.abs,xs.abs]
	def g(x)
		return x**2
	end
	# p candidate.max
	for i in 1..n
	 	x = (xe-xs)*1.0*rand()
		y = g(candidate.max)*1.0*rand()
		if y < g(x)
			m += 1
		end
	end
return m.to_f/n*(xe-xs)*g(candidate.max)
end

def erase(a,k,i) #k行目でi列を消去 
	factor = a[k][i]
	for l in 0 .. a[k].length()-1
		a[k][l] = a[k][l]*1.0 / factor 
	end #ここまでk行目の処理
	for j in 0 .. a.length()-1
		if (j != k) #j行目を処理
			factor = a[j][i]
			for l in 0 .. a[j].length()-1
        		a[j][l] = a[j][l]-a[k][l]*factor
				#注意:a[k][i]は既に1にしてある 
			end
		end 
	end
end

def gj(a)
	#aが係数行列+右辺値を並べたもの 
	for i in 0 .. a.length()-1
		erase(a,i,i) #i行目でi列を消去 
	end
	return a
#解は右端の一列に現れる 
end
def maxrow(a,i) #i列目の値の絶対値が最大の行 
# ここを完成させる.
	c = []
	for j in 0 .. a.length-1
		c.push(a[j][i])
	end
	return c.index(c.max)
end

def gj2(a) #aは係数行列+右辺値を並べたもの 
	for i in 0 .. a.length()-1
		erase(a,maxrow(a,i),i) #i列を消去 
	end
	a #解は右端の一列に現れる(現れる順番に注意) 
end
