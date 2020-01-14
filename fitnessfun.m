function [Fitvalue,cumsump]=fitnessfun(population);

global BitLength

global boundsbegin

global boundsend

popsize=size(population,1);  %有popsize个个体

for i=1:popsize

   x=transform2to10(population(i,:));  %将二进制转换为十进制

    %转化为[-2,2]区间的实数

xx=1+x/10;

  Fitvalue(i)=(xx-2)^2;  %计算函数值，即适应度

end

%给适应度函数加上一个大小合理的数以便保证种群适应值为正数

%计算选择概率

fsum=sum(Fitvalue);

Pperpopulation=Fitvalue/fsum;

%计算累积概率

cumsump(1)=Pperpopulation(1);

for i=2:popsize

  cumsump(i)=cumsump(i-1)+Pperpopulation(i);

end

cumsump=cumsump';

 

end

