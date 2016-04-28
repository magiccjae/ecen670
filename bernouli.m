function output = bernouli(n,p)
output = 0;    
for i=1:n
    if rand < p
            output = output + 1;
    end
end