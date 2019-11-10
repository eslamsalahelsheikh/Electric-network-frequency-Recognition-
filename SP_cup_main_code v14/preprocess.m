function [features,number_of_features,ENF,Fs] = preprocess(x)

freq_resolution=16;
example_length=10;              %example_length in minutes
% number_of_features=136;
time_resolution=10;                   %time resolution of one ENF sample; taken in seconds
L=7;  %number of harmonics taken into consideration in spectrum combining
% ==========================================
[x,Fs] = audioread(x);

        if rem(length(x),time_resolution*Fs) ~=0  %remove any data more than multiples of 5 seconds
         x=x(1:(end-rem(length(x),time_resolution*Fs)));   
        end

detected_nominal = calc_nominal(x,Fs,freq_resolution,L);

% DCT_denoising_coeff=0.075;
% DCT_denoising_length=size(x,1);
% y=dct(x,DCT_denoising_length);
% trimmed_y=y(1:DCT_denoising_coeff*DCT_denoising_length);
% x=idct(trimmed_y,DCT_denoising_length);

%now we split data into parts of 10 minutes 
        first_minutes = x(1:(end-rem(length(x),example_length*60*Fs)));
        first_minutes = reshape(first_minutes,example_length*60*Fs,(length(first_minutes))/(example_length*60*Fs)) ; 
        last_minutes = x((end-rem(length(x),example_length*60*Fs))+1:end);
%         ENF_first_minutes=zeros(size(first_minutes,2),60*example_length/time_resolution);%initialization
%         features_first_minutes=zeros(size(first_minutes,2),number_of_features);%initialization

    for i=1:size(first_minutes,2)                % or ENF_first_minutes =calc_dominant(first_minutes,Fs,detected_nominal,freq_resolution,L);
        ENF_first_minutes(i,:) = calc_dominant(first_minutes(:,i),Fs,detected_nominal,freq_resolution,L);
        [features_first_minutes(i,:),number_of_features] = feature_extract(ENF_first_minutes(i,:));
    end
    
ENF_last_minutes =calc_dominant(last_minutes,Fs,detected_nominal,freq_resolution,L);   %separated them for dimension mismatch ;; will be equal after feature extract
features=features_first_minutes;
    if ~isempty(ENF_last_minutes);
    [features_last_minutes,number_of_features] = feature_extract(ENF_last_minutes);
    features=[features_first_minutes ; features_last_minutes];
    end
ENF=ENF_first_minutes;  

% =============================================================

end
