addpath 'COMPlib_r1_1'
[A,B1,B,C1,C,D11,D12,D21,nx,nw,nu,nz,ny] = COMPleib('REA1');

syms t;

F = [exp(e(1)*t);exp(e(2)*t);exp(e(3)*t);exp(e(4)*t)];

V = [e(1)^3 e(1)^2 e(1) 1;e(2)^3 e(2)^2 e(2) 1;e(3)^3 e(3)^2 e(3) 1;e(4)^3 e(4)^2 e(4) 1];
B = V\F;
B0 = B(4);
B1 = B(3);
B2 = B(2);
B3 = B(1);

e_A = B0*eye(4)+B1*A+B2*A^2+B3*A^3;
e_At = B0*eye(4)+B1*A'+B2*A'^2+B3*A'^3;

integrate_o = simplify(e_At*C'*C*e_A);


result = int(vpa(integrate_o,3),t,0,2)