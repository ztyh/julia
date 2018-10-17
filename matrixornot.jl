using Random

function usematrix(n)
    X=rand(n,2)
    counter=0
    for i=1:n
        counter+=X[i,1]^2+X[i,2]^2<1
    end
    return counter/n*4
end

function dontusematrix(n)
    counter=0
    for i=1:n
        counter+=rand()^2+rand()^2<1
    end
    return counter/n*4
end

@elapsed usematrix(Int(1e8))
@elapsed dontusematrix(Int(1e8))
