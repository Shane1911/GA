function x=transform2to10(Population);

BitLength=size(Population,2);

x=Population(BitLength);

for i=1:BitLength-1

  x=x+Population(BitLength-i)*power(2,i);

end
end

