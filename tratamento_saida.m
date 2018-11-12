clear all
close all
clc

M = load('M_treinamento.txt');

T = M(:,2:end)';
d = M(:,1)';

for i=1:size(d,2)
    if d(i)==1
        d_n(i,:)=[0 0 1];
    elseif d(i)==2
        d_n(i,:)=[0 1 0];
    elseif d(i)==3
        d_n(i,:)=[1 0 0];
    end
end

M = [T' d_n];

f_treinamento = fopen('M_treinamento_final.txt','wt');
for ii = 1:size(M,1)
    fprintf(f_treinamento,'%g\t',M(ii,:));
    fprintf(f_treinamento,'\n');
end
fclose(f_treinamento);



%------------------------------------------------------------------------
clear all
close all
clc

M = load('M_teste.txt');

T = M(:,2:end)';
d = M(:,1)';

for i=1:size(d,2)
    if d(i)==1
        d_n(i,:)=[0 0 1];
    elseif d(i)==2
        d_n(i,:)=[0 1 0];
    elseif d(i)==3
        d_n(i,:)=[1 0 0];
    end
end

M = [T' d_n];

f_teste = fopen('M_teste_final.txt','wt');
for ii = 1:size(M,1)
    fprintf(f_teste,'%g\t',M(ii,:));
    fprintf(f_teste,'\n');
end
fclose(f_teste);