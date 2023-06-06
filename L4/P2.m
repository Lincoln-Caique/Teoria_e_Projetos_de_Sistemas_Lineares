addpath 'COMPlib_r1_1'
[A,B1,B,C1,C,D11,D12,D21,nx,nw,nu,nz,ny] = COMPleib('REA1');

%Avaliando controlabilidade e observalidade
Cn = ctrb(A,B);
cp = rank(Cn);% Possui posto completo
On = obsv(A,C);
op = rank(On);% Possui posto completo

%Graminiano de controlabilidade


%Graminiano de observalidade

%Decomposição com relação a Controlabilidade
Q = [Cn(:,1:3) [1;3;5;2]];
qp = rank(Q); %Os vetores selecionados são linearmente independentes

Ab = Q\A*Q;
Bb =  Q\B;
Cb = C*Q;

%Decomposição com relação a Observabilidade 
P = [On(1:3,:);[1 0 2 6]];
pp = rank(P);

Abo = P\A*P;
Bbo =  P\B;
Cbo = C*P;

%Formas canônicas
%Controlável
[Abar1,Bbar1,Cbar1,T,k] = ctrbf(A,B,C);
%Observável
[Abar2,Bbar2,Cbar2,T,k] = obsvf(A,B,C);

%Forma de Jordan
[M,D] = eig(A);
J = M\A*M;
%Avaliando a controlabilidade
C1J = [D(1,1)*eye(4)-A B]; %Posto completo
C2J = [D(2,2)*eye(4)-A B]; %Posto completo
C3J = [D(3,3)*eye(4)-A B]; %Posto completo
C4J = [D(4,4)*eye(4)-A B]; %Posto completo
%Avaliando a observalidade
O1J = [D(1,1)*eye(4)-A; C]; %Posto completo
O2J = [D(2,2)*eye(4)-A; C]; %Posto completo
O3J = [D(3,3)*eye(4)-A; C]; %Posto completo
O4J = [D(4,4)*eye(4)-A; C]; %Posto completo

%Conferindo se f>0 modifica a controlabilidade do sistema
B_alt1 = [B(:,1) 0.1*B(:,2)];
C_alt1 = [A,B_alt1];
rank(C_alt1);

B_alt2 = [B(:,1) 150*B(:,2)];
C_alt2 = [A,B_alt2];
rank(C_alt2);
