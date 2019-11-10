function [ A,nGroups] = formAInRange( nNeurons, startSize, EndSize )

    nGroups = ceil( (2*nNeurons)/(startSize+EndSize) );  %must be ceiled
    step    = (EndSize - startSize)/(nGroups-1); 
    A = zeros( nNeurons , nGroups );

    s = 1;
    for i=0:(nGroups-1)
        
        nones = round(startSize + i*step);
        onesG = ones(nones,1);

        if (s+nones-1 > nNeurons)
            A( s:nNeurons ,i+1) = ones(nNeurons-s+1,1);
            break;
        end
        
        A( s:s+nones-1 ,i+1) = onesG;
        s = s + nones;
        
    end
    
end