def make2d(w,h)
	ans = []
	for j in 1..h
	a =[]
		for i in 1..w
			a.push(0)
		end
	ans.push(a)
	end
	return ans
end
def score(award)
    gain=make2d(award[0].length,award.length)
    gain[0][0] = award[0][0]
    for i in 1..award[0].length-1
        gain[0][i]  = gain[0][i-1] + award[0][i]
    end
    for j in 1..award.length-1
        gain[j][0] = gain[j-1][0] + award[j][0]
    end
    for i in 1..award.length-1
        for j in 1..award[0].length-1
            tmp = [gain[i][j-1]+award[i][j],gain[i-1][j]+award[i][j]]
            gain[i][j] = tmp.max()
        end
    end
    return gain[award.length-1][award[0].length-1]
end
award = [[2,6,5,-2],[3,-1,4,-3],[-3,12,-1,8],[1,2,3,4]]

def q(c,d) 
    if c == d
        return 2 
    else
        return -1 
    end
end

def g()
    return -2
end

def align(s,t)
    m = s.length()
    n = t.length()
    a = make2d(m+1,n+1)
    a[0][0] = 0
    for j in 1..m
        a[0][j] = a[0][j-1] + g() 
    end
    for i in 1..n
        a[i][0] = i * g()
    end
    for j in 1..m
        for i in 1..n
            tmp = [a[i][j-1]+g(),a[i-1][j-1]+q(s[j-1],t[i-1]),a[i-1][j]+g()]
            p tmp,i,j
            #if i ==2&&j == 1
            #    p tmp
            #end
            a[i][j] = tmp.max
        end
    end
    return a
end
