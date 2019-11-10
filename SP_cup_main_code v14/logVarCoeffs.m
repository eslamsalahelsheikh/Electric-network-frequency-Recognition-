%wavelet analysis = [approximation coeffs detail coeffs] 
%it is required to calculate the log of variance of:
%-approximation signal of 9 level wavelet analysis
%-detail signal of wavelet analysis levels 1 to 9 
%ENF is "in" and features 4 to 13 are the 10 elements of "vars"
function [logVarCoeff]=logVarCoeffs(x)

    logVarCoeff=zeros(10,1);

    [y,lengthes]=wavedec(x,9,'db4');                                      %wavedec ( input signal , wavelet level , type )
    s = 1;
    for i=2:10
        s = s + lengthes(i-1);
        e = s + lengthes(i) - 1;
        
        logVarCoeff(i)=log( var ( y(s:e) ) );
    end
    %detail coeffs
    logVarCoeff(1)= log ( var ( y ( 1 : lengthes(1)) ) );                              %approx. coeffs.
end
