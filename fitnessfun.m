function [Fitvalue,cumsump]=fitnessfun(population);

global BitLength

global boundsbegin

global boundsend

popsize=size(population,1);  %��popsize������

for i=1:popsize

   x=transform2to10(population(i,:));  %��������ת��Ϊʮ����

    %ת��Ϊ[-2,2]�����ʵ��

xx=1+x/10;

  Fitvalue(i)=(xx-2)^2;  %���㺯��ֵ������Ӧ��

end

%����Ӧ�Ⱥ�������һ����С��������Ա㱣֤��Ⱥ��ӦֵΪ����

%����ѡ�����

fsum=sum(Fitvalue);

Pperpopulation=Fitvalue/fsum;

%�����ۻ�����

cumsump(1)=Pperpopulation(1);

for i=2:popsize

  cumsump(i)=cumsump(i-1)+Pperpopulation(i);

end

cumsump=cumsump';

 

end

