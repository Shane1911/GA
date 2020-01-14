function pcc=IfCroIfMut(mutORcro);

test(1:100)=0;

l=round(100*mutORcro);

test(1:l)=1;

n=round(rand*99)+1;

pcc=test(n); 

end

