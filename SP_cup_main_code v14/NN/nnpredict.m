function labels = nnpredict(nn, x,threshold)
    nn.testing = 1;
    nn = nnff(nn, x, zeros(size(x,1), nn.size(end)));
    nn.testing = 0;
    
    [dummy,labels] = max(nn.a{end},[],2);
    
    for j=1:length(dummy)
        if(dummy(j) < threshold)
            labels(j) = 10;
        end
    end
    
end
