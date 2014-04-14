%% Agglomerative hierarchical clustering
% Load data
data = importdata('clu_data.txt');
n = size(data,1);
data=(data-repmat(mean(data),n,1))./repmat(std(data),n,1);
Options = 1; % Choose different linkage methods: 1:single,2:complete,3:average

%% Agglomerative hierarchical clustering
% Compute the proximity matrix
% Repeat:
%   1. Update distance
%   2. Merge the nearest two clusters
%   3. Update proximity matrix to reflect the proximity between the new
%   cluster and the original clusters
% Until: Only one cluster remains

prox_mat=nan(n);
% Initiate proximity matrix
% Initiate proximity matrix
for i=1:n
    for j=i:n
        prox_mat(i,j) = sum((data(i,:)-data(j,:)).^2);
        prox_mat(j,i) = prox_mat(i,j);
   
    end
end
%% Single linkage
if Options==1
    % Join and update distance
    % z=zeros(n-1,3);
    % % prox_mat(~prox_mat)=nan;
    % while isnan(min(min(prox_mat)))
    %     idx=find(prox_mat==min(min(prox_mat)));
    %     i=floor(idx(1)/n);
    %     j=idx(1)-(i-1)*n;
    %     prox_mat(i,j)=nan;
    % end
    z=linkage(prox_mat,'single');
    figure(1)
    [H,T,outperm]=dendrogram(z);
    title('Single Linkage')
    cluster1=outperm(1:17);
    cluster2=outperm(18:20);
    cluster3=outperm(21:22);
    cluster4=outperm(23:25);
    outlier =outperm(26:30);
    for i=1:n
        if find(T(i)==cluster1)
            CluR(i)=1;
        elseif find(T(i)==cluster2)
            CluR(i)=2;
        elseif find(T(i)==cluster3)
            CluR(i)=3;
        elseif find(T(i)==cluster4)
            CluR(i)=4;
        elseif find(T(i)==outlier)
            CluR(i)=5;
        end
    end
    figure(2)
    plot(data(CluR==1,1),data(CluR==1,2),'r*');
    hold on
    plot(data(CluR==2,1),data(CluR==2,2),'bx');
    plot(data(CluR==3,1),data(CluR==3,2),'g*');
    plot(data(CluR==4,1),data(CluR==4,2),'rx');
    plot(data(CluR==5,1),data(CluR==5,2),'ro');
    hold off
    legend('1','2','3','4','5');
    
    
%% Complete linkage
elseif Options ==2
    z=linkage(prox_mat,'complete');
    figure(1)
    [H,T,outperm]=dendrogram(z);
    title('Complete Linkage')
    cluster1=outperm(1:17);
    cluster2=outperm(18);
    cluster3=outperm(19:25);
    cluster4=outperm(26:30);
%     outlier =outperm(26:30);
    for i=1:n
        if find(T(i)==cluster1)
            CluR(i)=1;
        elseif find(T(i)==cluster2)
            CluR(i)=2;
        elseif find(T(i)==cluster3)
            CluR(i)=3;
        elseif find(T(i)==cluster4)
            CluR(i)=4;
%         elseif find(T(i)==outlier)
%             CluR(i)=5;
        end
    end
    figure(2)
    plot(data(CluR==1,1),data(CluR==1,2),'r*');
    hold on
    plot(data(CluR==2,1),data(CluR==2,2),'bx');
    plot(data(CluR==3,1),data(CluR==3,2),'g*');
    plot(data(CluR==4,1),data(CluR==4,2),'rx');
%     plot(data(CluR==5,1),data(CluR==5,2),'ro');
    hold off
    legend('1','2','3','4');
    
%% Average linkage
elseif Options == 3
    z=linkage(prox_mat,'average');
    figure(1)
    [H,T,outperm]=dendrogram(z);
    title('Average Linkage')
    cluster1=outperm(1:17);
    cluster2=outperm(18);
    cluster3=outperm(19:25);
    cluster4=outperm(26:30);
%     outlier =outperm(26:30);
    for i=1:n
        if find(T(i)==cluster1)
            CluR(i)=1;
        elseif find(T(i)==cluster2)
            CluR(i)=2;
        elseif find(T(i)==cluster3)
            CluR(i)=3;
        elseif find(T(i)==cluster4)
            CluR(i)=4;
%         elseif find(T(i)==outlier)
%             CluR(i)=5;
        end
    end
    figure(2)
    plot(data(CluR==1,1),data(CluR==1,2),'r*');
    hold on
    plot(data(CluR==2,1),data(CluR==2,2),'bx');
    plot(data(CluR==3,1),data(CluR==3,2),'g*');
    plot(data(CluR==4,1),data(CluR==4,2),'rx');
%     plot(data(CluR==5,1),data(CluR==5,2),'ro');
    hold off
    legend('1','2','3','4');
end