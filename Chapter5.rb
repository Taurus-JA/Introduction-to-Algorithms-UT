def matmul(a,b)
    ans =[[0,0],[0,0]]
    ans[0][0] = a[0][0]*b[0][0]+a[1][0]*b[0][1]
    ans[0][1] = a[0][0]*b[1][0]+a[1][0]*b[1][1]
    ans[1][0] = a[0][1]*b[0][0]+a[1][1]*b[0][1]
    ans[1][1] = a[0][1]*b[1][0]+a[1][1]*b[1][1]
    return ans
end
def matsquare(a)
    return matmul(a,a)
end

def matpower(a,n)
    ans = a
    for i in 1..n-1
        ans = matmul(ans,a)
    end
    return ans
end

def fibm(k)
    f =[1,1]
    a = [[1,1],[1,0]]
    f_k = matpower(a,k)[1][0]+matpower(a,k)[1][1]
    return f_k
end

def timeit(k)
    require 'benchmark'

    result = Benchmark.realtime do
        def fibm6(k)
            return fibm(k)%1000000
        end
    end
    puts "処理概要 #{result}s"
    return result
end

def relation(k)
    include (Math)
    for i in k-10..k
        p timeit(2**i)/log(2**i),2**i
    end
end
def min_index(a,i)
    tmp = a.slice(i..a.length()-1)
    return a.index(tmp.min)
end
def simplesort(a)
    for i in 0..(a.length()-1)
        k = min_index(a,i) 
        v = a[k]
        a[k] = a[i]
        a[i] = v
    end
    return a 
end
def merge(a,b)
    c = Array.new() 
    ia=0
    ib=0
    ic=0
    while ia < a.length() && ib < b.length()
        if a[ia] < b[ib] then 
            c[ic] = a[ia]
            ia = ia + 1
        else
            c[ic] = b[ib] 
            ib = ib + 1
        end
        ic = ic + 1 
    end
    if ia == a.length()
        for i in b.slice(ib..b.length()-1)
            c.push(i)
        end
    else
        for i in a.slice(ia..a.length()-1)
            c.push(i)
        end
    end
    return c
end