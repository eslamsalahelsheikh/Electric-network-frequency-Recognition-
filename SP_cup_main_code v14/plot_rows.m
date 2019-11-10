function [] = plot_rows(x)
for i=1:ceil(size(x,1)/10)
  figure;
  for j=1:10
      subplot(10,1,j);plot(x(j+10*(i-1),:));
  end
    
end    

end