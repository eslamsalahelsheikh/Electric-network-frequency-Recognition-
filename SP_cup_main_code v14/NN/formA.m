function [ A ] = formA( nNeurons , nGroups )
    A = zeros( nNeurons , nGroups );
    %{
    nones = nNeurons / nGroups;
    onesG = ones(nones,1);
    assert(rem(nNeurons,nGroups)==0,'nNeurons is not divisable by nGroups');
    
    for i=0:(nGroups-1)
        A( ((i*nones)+1):((i+1)*nones) ,i+1) = onesG;
    end
    %}
    
    s = 1;
    for i=0:(nGroups-1)
        nones = i+1;
        onesG = ones(nones,1);
        
        A( s:s+nones-1 ,i+1) = onesG;
        s = s + nones;
    end
end