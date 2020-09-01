using SortingLab, ShiftedArrays, LoopVectorization

v = rand(1:1_000_000,100_000_000)
@time fsort!(v)

function f1(v)
    count = 1
    for i in 1:length(v)-1
        count += !isequal(v[i], v[i+1])
    end
    count
end

function f2(v)
    length(v) - sum(skipmissing(lag(v) .== v))
end

function f3(x)
    count = 1
    @avx for i in 1:length(x)-1
        count += !isequal(x[i], x[i+1])
    end
    count
end

@time f1(v)
@time f2(v)
@time f3(v)
