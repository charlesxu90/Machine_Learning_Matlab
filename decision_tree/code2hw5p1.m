%% Hw5 problem 1

%% 1. Choose root node
% TC1=10;
% TC2=10;
%% Gender M/F 
% L_C1=6;
% L_C2=4;

%% Car Type 
% F/[S L] 
% L_C1=1;
% L_C2=3;
% S/[F L]
% L_C1=8;
% L_C2=0;
% L/[S F]
% L_C1=1;
% L_C2=7;


%% Shirt Size 
%S/[M L XL] 
% L_C1=3;
% L_C2=2;
% M/[S L XL] 
% L_C1=3;
% L_C2=4;
% [S L]/[M XL] 
% L_C1=5;
% L_C2=4;
% [S XL]/[M L] 
% L_C1=5;
% L_C2=4;
%% 2. Choose second node
% TC1=2;
% TC2=10;
%% Gender M/F
% L_C1=1;
% L_C2=4;
%% Car Type F/L
% L_C1=1;
% L_C2=3;
%% Shirt Size 
% S/[M L XL]
% L_C1=1;
% L_C2=2;
% M/[S L XL] 
% L_C1=0;
% L_C2=4;
% L/[S M XL] 
% L_C1=1;
% L_C2=2;
% XL/[S M L] 
% L_C1=0;
% L_C2=2;
% [S M]/[L XL]
% L_C1=1;
% L_C2=6;
% [S L]/[M XL] 
% L_C1=2;
% L_C2=4;
% [S XL]/[M L]
% L_C1=1;
% L_C2=4;

%% 3. Choose Third node
% TC1=2;
% TC2=4;
%% Gender M/F
% L_C1=1;
% L_C2=1;
%% Car Type F/L
% L_C1=1;
% L_C2=1;
%% Shirt Size 
% S/L
% L_C1=1;
% L_C2=2;
%% 4. Choose Forth node
% TC1=1;
% TC2=1;
%% Car Type F/L
% L_C1=1;
% L_C2=1;
%% Shirt Size 
% S/L
% L_C1=1;
% L_C2=0;
%% 4. Choose Forth node
TC1=1;
TC2=3;
%% Car Type F/L
% L_C1=1;
% L_C2=3;
%% Shirt Size 
% S/L
L_C1=0;
L_C2=2;
%% Calculation of GAIN

T= TC1+TC2;
L_T = L_C2+L_C1;
NL_T = T - L_T;
NL_C1 = TC1-L_C1;
NL_C2 = TC2-L_C2;

if L_T ~=0 && NL_T~=0
    GAIN=(1-(TC1/T)^2-(TC2/T)^2)...
        -(L_T/T*(1-(L_C1/L_T)^2-(L_C2/L_T)^2)...
        +NL_T/T*(1-(NL_C1/NL_T)^2-(NL_C2/NL_T)^2))
else
    fprintf('\n Input Error: Useless decision!\n');
end

