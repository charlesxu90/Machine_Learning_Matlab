%% Codes for Reinforcement Learning
% 4X5 grid, 4 deterministic actions: up, down, left and right. 
% The goal is to reach the G(Up-Right), starting at S(Bottom-Left)
% Also there is a very bad state B(Bottom-Right).
close all;
clear all;
clc;
%% Learning Parameters
% Discount factor
gamma = 0.9;
% Rewards
% Goal: 100; go off grid: -1; others: 0.
% Q for 4*5 states, each state has 4 actions
Q=zeros(4*5,4);
max_iter=500;
% Q_old=ones(4*5,4);
% threshold = 0.0001;
% Policy
Pi=zeros(4*5,1);% 1: left, 2: up, 3:right, 4:down

%% Calcaluatie Q
t=0;
for i=1:max_iter
% while max(max(abs(Q-Q_old))) >= threshold %&& t<=100
%     Q_old = Q;
%     t=t+1;
    s=1;
%     E=0.3;
    E=(t+1)^(-1/2); % E for E-greedy search
    while s~=4*5
        
        % Exploit using E-greedy search
        prob=rand(1);
        if prob <= E
            % Explore
            a=datasample([1 2 3 4],1);
        else 
            % Exploit
            actions=find(Q(s,:)==max(Q(s,:)));% Go for max Q(s,a)
            a=datasample(actions,1);
        end
        
        % Observe the immediate reward r(t+1) and new state s(t+1)
        if a==1 % Go left
            if mod(s,5)==1
                r_next=-1; % Left border points, left reward is -1
                s_next=s;
            else
                s_next=s-1;
                r_next= 0; % Non-border points, left reward is 0
            end
        elseif a==2 % Go up
            if s>3*5
                r_next=-1; % Up border points, up reward is -1
                s_next=s;
            else
                s_next=s+5;
                if s_next==4*5
                    r_next=100;% Next is goal
                else
                    r_next= 0; % Non-border points, up reward is 0
                end
            end
        elseif a==3 % Go right
            if mod(s,5)==0
                r_next=-1; % Right border points, right reward is -1
                s_next=s;
            else
                s_next=s+1;
                if s_next==4*5 
                    r_next=100; % Next is goal
                elseif s_next==5
                    r_next=-100; % Next is Bad
                else
                    r_next= 0; % Non-border points, right reward is 0
                end
            end
        elseif a==4 % Go down
            if s<=5
                r_next=-1; % Down border points, down reward is -1
                s_next=s;
            else
                s_next=s-5;
                if s_next==5
                    r_next=-100;% Next is goal
                else
                    r_next= 0; % Non-border points, down reward is 0
                end
            end
        else
            fprintf('error in %d.\n',s);
        end
        % Update table entry as follows:
        % Q(s(t),a(t))=r(t+1)+gamma*max(Q_hat(s(t+1),a(t+1)))
        Q(s,a)=r_next+gamma*max(Q(s_next,:));
        
        s=s_next;
    end
%     fprintf('Value of s: %d.\n',s);
end
Q
% t
V=max(Q')'