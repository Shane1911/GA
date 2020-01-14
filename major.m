clc;

clear all;

close all;

global BitLength

global boundsbegin

global boundsend

bounds=[1 4.1];%һά�Ա�����ȡֵ��Χ

precision=0.1; %���㾫��

boundsbegin=bounds(:,1);

boundsend=bounds(:,2);

%�������������⾫��������Ҫ�೤��Ⱦɫ��

BitLength=ceil(log2((boundsend-boundsbegin)' ./ precision));

popsize=10; %��ʼ��Ⱥ��С

Generationnmax=200;  %������

pcrossover=2/3; %�������

pmutation=1/6; %�������

%������ʼ��Ⱥ

population=round(rand(popsize,BitLength));

%������Ӧ��,������Ӧ��Fitvalue���ۻ�����cumsump

[Fitvalue,cumsump]=fitnessfun(population); 

Generation=1;

while Generation<Generationnmax+1

   for j=1:2:popsize

      %ѡ�����

     seln=selection(population,cumsump);

      %�������

     scro=crossover(population,seln,pcrossover);

      scnew(j,:)=scro(1,:);

     scnew(j+1,:)=scro(2,:);

      %�������

     smnew(j,:)=mutation(scnew(j,:),pmutation);

     smnew(j+1,:)=mutation(scnew(j+1,:),pmutation);

   end

   population=smnew;  %�������µ���Ⱥ

   %��������Ⱥ����Ӧ��  

  [Fitvalue,cumsump]=fitnessfun(population);

   %��¼��ǰ����õ���Ӧ�Ⱥ�ƽ����Ӧ��

  [fmax,nmax]=max(Fitvalue);

   fmean=mean(Fitvalue);

   ymax(Generation)=fmax;

   ymean(Generation)=fmean;

   %��¼��ǰ�������Ⱦɫ�����

  x=transform2to10(population(nmax,:));

   %�Ա���ȡֵ��Χ��[-2 2],��Ҫ�Ѿ����Ŵ���������Ⱦɫ�����ϵ�[-2 2]����

 xx=1+0.1*x;

   xmax(Generation)=xx;

   Generation=Generation+1;
end

Generation=Generation-1;

Bestpopulation=xx

Besttargetfunvalue=(xx-2)^2

%���ƾ����Ŵ���������Ӧ�����ߡ�һ��أ����������������Ⱥ��ƽ����Ӧ���������

%Ӧ�������������໥��ͬ����̬����ʾ�㷨�������еú�˳����û�г����𵴣�������ǰ

%���£������Ӧ�ȸ����������ɴ���û�з�������������Ⱥ�Ѿ����졣

% figure(1);
% 
% hand1=plot(xx,ymax);
% 
% set(hand1,'linestyle','-','linewidth',1.8,'marker','*','markersize',6)
% 
% hold on;

% hand2=plot(1:Generation,ymean);


% 
% xlabel('��������');ylabel('���/ƽ����Ӧ��');
% 
% legend('�����Ӧ��','ƽ����Ӧ��');
% 
% box off;hold off;












 

%�ӳ�������Ⱥѡ�����, �������ƴ洢Ϊselection.m


 

%�ӳ��򣺶����Ż����ֵ�򼫴�ֵ�������⣬Ŀ�꺯��������Ϊ��Ӧ�Ⱥ���

%�������ƴ洢Ϊtargetfun.m



 

%�ӳ��򣺽�2������ת��Ϊ10������,�������ƴ洢Ϊtransform2to10.m

