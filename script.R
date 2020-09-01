x = sample(1:1e6,1e9,replace=T)
system.time(length(unique(x))) #10.6 s
system.time(dplyr::n_distinct(x)) #8.6 s
system.time(data.table::uniqueN(x)) # 1.6 s
system.time(sum(data.table::shift(x,1)==x,na.rm=T)) # 0.7s
