function [ gain_ratio] = GainRatio( C1, C2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%% Calculation of GAINRatio
Total = [sum(C1) sum(C2)];
gini = 1-sum((Total./sum(Total)).^2);
C_T = C1+C2;
for i=1:size(C_T,2)
    if C_T(i)~=0
        gini = gini- (C_T(i))/sum(Total)*(1-(C1(i)/C_T(i)).^2 ...
            -(C2(i)/C_T(i)).^2);
    else
        fprintf('\n Input Error: Useless decision!\n');
        return;
    end
end

gain_ratio = gini/sum(-C_T./sum(C_T).*log2(C_T./sum(C_T)));

% T=TC1+TC2;;
% L_T = L_C2+L_C1
% NL_T = T - L_T
% NL_C1 = TC1-L_C1
% NL_C2 = TC2-L_C2
%
%
% if L_T ~=0 && NL_T~=0
%     GAINRatio=((1-(TC1/T)^2-(TC2/T)^2)...
%         -(L_T/T*(1-(L_C1/L_T)^2-(L_C2/L_T)^2)...
%         +NL_T/T*(1-(NL_C1/NL_T)^2-(NL_C2/NL_T)^2)))/...
%         (-L_T/T*log2(L_T/T)-NL_T/T*log2(NL_T/T))
% else
%     fprintf('\n Input Error: Useless decision!\n');
% end

end

