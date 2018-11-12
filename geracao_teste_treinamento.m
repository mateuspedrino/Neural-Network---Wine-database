clc
clear all
close all

M=load('wine.txt');

p=0.7; % Porcentagem de dados que se deseja no subconjunto de teste
[amostras,classes]=size(M);
contador=zeros(1,3);

for i=1:amostras
    if M(i,1)==1
        contador(1)=contador(1)+1;
        M1(contador(1),:)=M(i,:);
    end
    if M(i,1)==2
        contador(2)=contador(2)+1;
        M2(contador(2),:)=M(i,:);
    end
    if M(i,1)==3
        contador(3)=contador(3)+1;
        M3(contador(3),:)=M(i,:);
    end
end

[M1_amostras,aux]=size(M1);
M1_treinamento=M1(1:round(p*M1_amostras),:);
M1_teste=M1((round(p*M1_amostras)+1):M1_amostras,:);

[M2_amostras,aux]=size(M2);
M2_treinamento=M2(1:round(p*M2_amostras),:);
M2_teste=M2((round(p*M2_amostras)+1):M2_amostras,:);

[M3_amostras,aux]=size(M3);
M3_treinamento=M3(1:round(p*M3_amostras),:);
M3_teste=M3((round(p*M3_amostras)+1):M3_amostras,:);



M_treinamento=[M1_treinamento; M2_treinamento; M3_treinamento];

M_teste=[M1_teste; M2_teste; M2_teste; M3_teste];

f_treinamento = fopen('M_treinamento.txt','wt');
for ii = 1:size(M_treinamento,1)
    fprintf(f_treinamento,'%g\t',M_treinamento(ii,:));
    fprintf(f_treinamento,'\n');
end
fclose(f_treinamento);

f_teste = fopen('M_teste.txt','wt');
for ii = 1:size(M_teste,1)
    fprintf(f_teste,'%g\t',M_teste(ii,:));
    fprintf(f_teste,'\n');
end
fclose(f_teste);