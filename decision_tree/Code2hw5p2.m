%% Codes to Homework 5 problem 2
%% 1. Root Node
%% Department 
% binary
% Sale 
% C1=[30 22];
% C2=[80 33];
% GRatio=GainRatio(C1,C2)
% Systems
% C1=[8 44];
% C2=[23 90];
% GRatio=GainRatio(C1,C2)
% marketing
% C1=[10 42];
% C2=[4 109];
% GRatio=GainRatio(C1,C2)
% Secretary
% C1=[4 48];
% C2=[6 107];
% GRatio=GainRatio(C1,C2)
% Sale/System
% C1=[38 14];
% C2=[103 10];
% GRatio=GainRatio(C1,C2)
% Sale/Marketing
% C1=[40 12];
% C2=[84 29];
% GRatio=GainRatio(C1,C2)
% Sale/Secretary
% C1=[34 18];
% C2=[86 27];
% GRatio=GainRatio(C1,C2)

% 3class
% Sale/Sys Mar Sec
% C1=[38 10 4];
% C2=[103 3 6];
% GRatio=GainRatio(C1,C2)
% Sal/Mar Sys Sec
% C1=[40 8 44];
% C2=[84 23 6];
% GRatio=GainRatio(C1,C2)
% Sal/Sec Sys Mar
% C1=[34 8 10];
% C2=[86 23 4];
% GRatio=GainRatio(C1,C2)
% Sys/Mar Sal Sec
% C1=[18 30 4];
% C2=[27 80 6];
% GRatio=GainRatio(C1,C2)
% Sys/Sec Sal Mar
% C1=[12 30 10];
% C2=[29 80 4];
% GRatio=GainRatio(C1,C2)
% Mar/Sec Sal Sys
% C1=[14 30 8];
% C2=[10 80 23];
% GRatio=GainRatio(C1,C2)

%% Age
% 1|2 3 4 5 6
% C1=[0 52];
% C2=[20 93];
% GRatio=GainRatio(C1,C2)
% 1 2|3 4 5 6
% C1=[0 52];
% C2=[69 44];
% GRatio=GainRatio(C1,C2)
% 1 2 3|4 5 6
% C1=[35 17];
% C2=[113 0];
% GRatio=GainRatio(C1,C2)
% 1 2 3 4|5 6
% C1=[45 7];
% C2=[113 0];
% GRatio=GainRatio(C1,C2)
% 1 2 3 4 5|6
% C1=[48 4];
% C2=[113 0];
% GRatio=GainRatio(C1,C2)
% 1|2|3 4 5 6
% C1=[0 0 52];
% C2=[20 49 44];
% GRatio=GainRatio(C1,C2)
% 1|2 3|4 5 6
% C1=[0 35 17];
% C2=[20 93 0];
% GRatio=GainRatio(C1,C2)
% % 1|2 3 4|5 6
% C1=[0 45 7];
% C2=[20 93 0];
% GRatio=GainRatio(C1,C2)
% % 1|2 3 4 5|6
% C1=[0 48 4];
% C2=[20 93 0];
% GRatio=GainRatio(C1,C2)
% % 1 2|3|4 5 6
% C1=[0 35 17];
% C2=[69 44 0];
% GRatio=GainRatio(C1,C2)

% (1-(52/165)^2-(113/165)^2-69/165*(1-(0/69)^2-(69/69)^2)...
%     -79/165*(1-(35/79)^2-(44/79)^2)...
%     -17/165*(1-(0/17)^2-(17/17)^2))/(-69/165*log2(69/165)...
%     -79/165*log2(79/165)-17/165*log2(17/165))

% % 1 2|3 4|5 6
% C1=[0 45 7];
% C2=[69 44 0];
% GRatio=GainRatio(C1,C2)
% % 1 2|3 4 5|6
% C1=[0 48 4];
% C2=[69 44 0];
% GRatio=GainRatio(C1,C2)
% % 1 2 3|4|5 6
% C1=[35 10 7];
% C2=[113 0 0];
% GRatio=GainRatio(C1,C2)
% % 1 2 3|4 5|6
% C1=[35 13 4];
% C2=[113 0 0];
% GRatio=GainRatio(C1,C2)
% % 1 2 3 4|5|6
% C1=[45 3 4];
% C2=[113 0 0];
% GRatio=GainRatio(C1,C2)
% % 1|2|3|4 5 6
% C1=[0 0 35 17];
% C2=[20 49 44 0];
% GRatio=GainRatio(C1,C2)
% % 1|2|3 4|5 6
% C1=[0 0 45 7];
% C2=[20 49 44 0];
% GRatio=GainRatio(C1,C2)
% % 1|2|3 4 5|6
% C1=[0 0 48 4];
% C2=[20 49 44 0];
% GRatio=GainRatio(C1,C2)
% % 1|2 3|4|5 6
% C1=[0 35 10 7];
% C2=[20 93 0 0];
% GRatio=GainRatio(C1,C2)
% % 1|2 3|4|5 6
% C1=[0 35 13 4];
% C2=[20 93 0 0];
% GRatio=GainRatio(C1,C2)
% % 1|2 3|4|5 6
% C1=[0 45 3 4];
% C2=[20 93 0 0];
% GRatio=GainRatio(C1,C2)
% % 1|2 3|4|5 6
% C1=[0 35 10 7];
% C2=[69 44 0 0];
% GRatio=GainRatio(C1,C2)
% % 1 2|3|4|5 6
% C1=[0 35 13 4];
% C2=[69 44 0 0];
% GRatio=GainRatio(C1,C2)
% % 1 2|3 4|5|6
% C1=[0 45 3 4];
% C2=[69 44 0 0];
% GRatio=GainRatio(C1,C2)
% % 1 2 3|4|5|6
% C1=[35 10 3 4];
% C2=[113 0 0 0];
% GRatio=GainRatio(C1,C2)
% % 1|2|3|4|5 6
% C1=[0 0 35 10 7];
% C2=[20 49 44 0 0];
% GRatio=GainRatio(C1,C2)
% % 1|2|3|4|5 6
% C1=[0 0 35 13 4];
% C2=[20 49 44 0 0];
% GRatio=GainRatio(C1,C2)
% % 1|2|3|4|5 6
% C1=[0 0 45 3 4];
% C2=[20 49 44 0 0];
% GRatio=GainRatio(C1,C2)
% C1=[0 35 10 3 4];
% C2=[20 93 0 0 0];
% GRatio=GainRatio(C1,C2)
% C1=[0 35 20 3 4];
% C2=[69 44 0 0 0];
% GRatio=GainRatio(C1,C2)
% C1=[0 0 35 10 3 4];
% C2=[20 49 44 0 0 0];
% GRatio=GainRatio(C1,C2)


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
%% 2. Second Node
% T=113+35;
% TC1=35;
%% Department
% Sale 
% L_C1=30;
% L_C2=80;
% Systems
% L_C1=5;
% L_C2=23;
% marketing
% L_C1=0;
% L_C2=4;
% Secretary
% L_C1=0;
% L_C2=6;% Total of labled in class 2
% Sale/System
% L_C1=35;
% L_C2=103;% Total of labled in class 2 %??? Error
% Sale/Marketing
% L_C1=30;
% L_C2=84;% Total of labled in class 2
% Sale/Secretary
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
%
C1=[0 35];
C2=[86 27];
GRatio=GainRatio(C1,C2)
C1=[0 30 5];
C2=[86 27 0];
GRatio=GainRatio(C1,C2)
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
%% 3. Third Node
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
% Sale 
% L_C1=30;
% L_C2=80;
% Systems
% L_C1=0;
% L_C2=23;
% marketing
% L_C1=0;
% L_C2=4;
% Secretary
% L_C1=0;
% L_C2=6;
% Sale/System
% L_C1=30;
% L_C2=103;
% Sale/Marketing
% L_C1=30;
% L_C2=84;
% Sale/Secretary
% L_C1=30;
% L_C2=86;

%% 4. Forth Node
% T=23+30;
% TC1=30;
%% Department 
% Sale 
% L_C1=30;
% L_C2=0;
%% Age
% 25
% L_C1=0;
% L_C2=3;
% 25
% L_C1=0;
% L_C2=23;

