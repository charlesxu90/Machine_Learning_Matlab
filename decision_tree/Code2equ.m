%% Codes to calculate the equations

%% Problem 1
% Choose root node
% Gender M/F 
% (1-(10/20)^2-(10/20)^2)-(10/20*(1-(6/10)^2-(4/10)^2)...
%     +10/20*(1-(6/10)^2-(4/10)^2))

% Car Type S/[F L] 
% (1-(10/20)^2-(10/20)^2)-(8/20*(1-(8/8)^2-(0/8)^2)...
%     +12/20*(1-(10/12)^2-(2/12)^2))

% Car Type F/[S L] 
% (1-(10/20)^2-(10/20)^2)-(8/20*(1-(1/8)^2-(7/8)^2)...
%     +12/20*(1-(9/12)^2-(3/12)^2))

% Shirt Size S/[M L XL] 
% (1-(10/20)^2-(10/20)^2)-(5/20*(1-(3/5)^2-(2/5)^2)...
%     +15/20*(1-(7/15)^2-(8/15)^2))

% Shirt Size [S M]/[L XL] 
% (1-(10/20)^2-(10/20)^2)-(12/20*(1-(6/12)^2-(6/12)^2)...
%     +8/20*(1-(4/8)^2-(4/8)^2))

% Shirt Size M/[S L XL] 
% (1-(10/20)^2-(10/20)^2)-(7/20*(1-(3/7)^2-(4/7)^2)...
%     +13/20*(1-(7/13)^2-(6/13)^2))

% Shirt Size [S L]/[M XL] 
% (1-(10/20)^2-(10/20)^2)-(9/20*(1-(5/9)^2-(4/9)^2)...
%     +11/20*(1-(5/11)^2-(6/11)^2))

% Choose second node
% Gain1 = 1-(2/12)^2 - (10/12)^2;

% Gender M/F
% Gain1-(5/12*(1-(1/5)^2-(4/5)^2)+7/12*(1-(1/7)^2-(6/7)^2))

% Shirt Size S/[M L XL]
% Gain1-(3/12*(1-(1/3)^2-(2/3)^2)+9/12*(1-(1/9)^2-(8/9)^2))

% Shirt Size [S M]/[L XL]
% Gain1-(7/12*(1-(1/7)^2-(6/7)^2)+5/12*(1-(1/5)^2-(4/5)^2))

% Shirt Size [S M L]/XL
% Gain1-(10/12*(1-(2/10)^2-(8/10)^2)+2/12*(1-(0/2)^2-(2/2)^2))

% Shirt Size M/[S L XL] 
% Gain1-(4/12*(1-(0/4)^2-(4/4)^2)+8/12*(1-(2/8)^2-(6/8)^2))

% Shirt Size [S L]/[M XL] 
% Gain1-(6/12*(1-(2/6)^2-(4/6)^2)+6/12*(1-(0/6)^2-(6/6)^2))

% Choose last node
% Gain2 = 1-(2/6)^2-(4/6)^2;

% Gender M/F
% Gain2-(2/6*(1-(1/2)^2-(1/2)^2)+4/6*(1-(1/4)^2-(3/4)^2))


%% Problem 2
% 30+40+40+20+5+3+3+10+4+4+6;
%% Root Node
% T=165;
% TC1=52;
% % Department Sale 
% L_C1=30;
% L_C2=80;
% % Department Systems
% L_C1=8;
% L_C2=23;
% % Department marketing
% L_C1=10;
% L_C2=4;
% % Department Secretary
% L_C1=4;
% L_C2=6;% Total of labled in class 2
% % Department Sale/System
% L_C1=38;
% L_C2=103;% Total of labled in class 2
% % Department Sale/Marketing
% L_C1=40;
% L_C2=84;% Total of labled in class 2
% % Department Sale/Secretary
% L_C1=34;
% L_C2=86;% Total of labled in class 2

%% Age
% %20
% L_C1=0;
% L_C2=0;
% %25
% L_C1=0;
% L_C2=20;
% %30
% L_C1=0;
% L_C2=69;
% %35
% L_C1=35;
% L_C2=113;
% %40
% L_C1=45;
% L_C2=113;
% %45
% L_C1=48;
% L_C2=113;
% %50
% L_C1=52;
% L_C2=113;

%% Salary
% %25
% L_C1=0;
% L_C2=0;
% %30
% L_C1=0;
% L_C2=46;
% %35
% L_C1=0;
% L_C2=86;
% %40
% L_C1=4;
% L_C2=86;
% %45
% L_C1=4;
% L_C2=90;
% %58
% L_C1=44;
% L_C2=113;
% %70
% L_C1=52;
% L_C2=113;
%% Second Node
% T=113+35;
% TC1=35;
%% Department
% % Department Sale 
% L_C1=30;
% L_C2=80;
% % Department Systems
% L_C1=5;
% L_C2=23;
% % Department marketing
% L_C1=0;
% L_C2=4;
% % Department Secretary
% L_C1=0;
% L_C2=6;% Total of labled in class 2
% % Department Sale/System
% L_C1=35;
% L_C2=103;% Total of labled in class 2 %??? Error
% % Department Sale/Marketing
% L_C1=30;
% L_C2=84;% Total of labled in class 2
% % Department Sale/Secretary
% L_C1=30;
% L_C2=86;% Total of labled in class 2
%% Salary
% %25
% L_C1=0;
% L_C2=0;
% %30
% L_C1=0;
% L_C2=46;
% %38
% L_C1=0;
% L_C2=86;
% %45
% L_C1=0;
% L_C2=90;
% %58
% L_C1=30;
% L_C2=113;
% %70
% L_C1=35;
% L_C2=113;
%% Age
% %20
% L_C1=0;
% L_C2=0;
% %25
% L_C1=0;
% L_C2=20;
% % %30
% L_C1=0;
% L_C2=69;
% %35
% L_C1=35;
% L_C2=113;
%% Third Node
% T=113+30;
% TC1=30;
%% Age
% %20
% L_C1=0;
% L_C2=0;
% %25
% L_C1=0;
% L_C2=20;
% % %30
% L_C1=0;
% L_C2=69;
% %35
% L_C1=30;
% L_C2=113;
%% Salary
% %25
% L_C1=0;
% L_C2=0;
% %30
% L_C1=0;
% L_C2=46;
% %38
% L_C1=0;
% L_C2=86;
% %45
% L_C1=0;
% L_C2=90;
% %50
% L_C1=30;
% L_C2=113;
%% Department
% % Department Sale 
% L_C1=30;
% L_C2=80;
% % Department Systems
% L_C1=0;
% L_C2=23;
% % Department marketing
% L_C1=0;
% L_C2=4;
% % Department Secretary
% L_C1=0;
% L_C2=6;
% % Department Sale/System
% L_C1=30;
% L_C2=103;
% % Department Sale/Marketing
% L_C1=30;
% L_C2=84;
% % Department Sale/Secretary
% L_C1=30;
% L_C2=86;

%% Forth Node
T=23+30;
TC1=30;
% Department Sale 
% L_C1=30;
% L_C2=0;
% % Age
% % 25
% L_C1=0;
% L_C2=3;
% 25
L_C1=0;
L_C2=23;
%% Calculation of GAINRatio

L_T = L_C2+L_C1
TC2 = T-TC1;
NL_T = T - L_T
NL_C1 = TC1-L_C1
NL_C2 = TC2-L_C2

if L_T ~=0 && NL_T~=0
    i=0
    GAINRatio=((1-(TC1/T)^2-(TC2/T)^2)...
        -(L_T/T*(1-(L_C1/L_T)^2-(L_C2/L_T)^2)...
        +NL_T/T*(1-(NL_C1/NL_T)^2-(NL_C2/NL_T)^2)))/...
        (-L_T/T*log2(L_T/T)-NL_T/T*log2(NL_T/T))
else
    fprintf('\n Input Error: Useless decision!\n');
end
