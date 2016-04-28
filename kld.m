function result = kld(p,n)

result = zeros(length(p),length(n));

for p_index = 1:length(p)
    for n_index = 1:length(n)
        n_element = n(n_index);
        p_element = p(p_index);
        p_original = pdf('Binomial',0:n_element,n_element,p_element);
        p_compare = pdf('Normal',0:n_element,n_element*p_element,sqrt(n_element*p_element*(1-p_element)));
        
        result(p_index,n_index) = sum(p_original.*log(p_original./p_compare));
    end
end

end