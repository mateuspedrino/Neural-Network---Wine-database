clear all
close all
clc

w = warning ('off','all');

M = load('M_treinamento_final.txt');
[t_x,t_y] = size(M);
T = M(:,1:13)';
d = M(:,14:end)';

num_teste=1;

treinametos = 1000;
tx_aprend = 0.2;
precisao = 1e-15;
alg_treina = 'trainlm';
reflesh = 5;
z2=1;

normaliza(:,1)=min(T')';
normaliza(:,2)=max(T')';

N_a = [15 3;10 3;5 3;20 3];
ativacao_a = [{'logsig' 'logsig'};
            {'logsig' 'purelin'}
            {'purelin' 'purelin'}
            {'tansig' 'purelin'}];

for f=1:4
    for c=1:4
        erro_medio = Inf;
        acertos2 = Inf;
        for u=1:5
            N = N_a(f,:);
            ativacao = ativacao_a(c,:);
            z = num_teste;
            net = newff(normaliza, N, ativacao,alg_treina);

            net.trainParam.epochs = treinametos; % Número de épocas
            net.trainParam.goal = precisao; % Erro final desejado
            net.trainParam.lr = tx_aprend; % Taxa de aprendizado
            net.trainParam.show = reflesh; % Refresh da tela (épocas)

            [net,tr] = train(net, T, d);
            tempo = tr.time(end);
            epocas = tr.epoch(end);
            
            if tr.perf(end)<erro_medio
                erro_medio = tr.perf(end);
                erro_medio_final(z2) = tr.perf(end);
                melhores_resultados(z2) = num_teste;
            end
            
            saveas(plotperform(tr),['img/' num2str(z) '.jpg']);

            %-----------TESTE----------------
            M = load('M_teste_final.txt');
            [t_x,t_y] = size(M);
            T = M(:,1:13)';
            d = M(:,14:end)';

            saida_teste = round(sim(net, T));
            saida_final = [d' saida_teste'];

            acertos1=0;
            for i=1:t_x
                if isequal(saida_final(i,1:3),saida_final(i,4:end))
                    acertos1=acertos1+1;
                end
            end

            acertos1 = (acertos1/t_x)*100;

            w1 = net.IW{1,1};
            w2 = net.LW{2,1};

            b1 = net.b{1};
            b2 = net.b{2};

            acertos_total(z) = acertos1;
            
            erro_medio1 = tr.perf(end);
            save(['par/' num2str(z)],'w1','w2','b1','b2','acertos1','N','ativacao','tempo','epocas','erro_medio1');
            save('acertos','acertos_total','erro_medio_final','melhores_resultados');
            num_teste = num_teste+1;
        end
        z2 = z2+1;
    end
end