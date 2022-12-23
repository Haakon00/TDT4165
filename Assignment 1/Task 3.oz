local  X Y Z in 
Y = 300
Z = 30
X = Y*Z
end

%I think the code can run because execution of that thread is halted until Y is assigned a value. This is useful because it makes programming concurrency easier. Y=X assigns the value of X to Y.