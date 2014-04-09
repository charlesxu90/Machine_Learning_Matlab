%% Agglomerative hierarchical clustering
% Load data
data = importdata('clu_data.txt');
n = size(data,1);
threshold = 0.0001; % Stop threshold for k-means

%% Running K-means clustering with k=8
% Here we use Euclidean distance
% Generate k random centroids
k=8;
cent = data(randperm(n, k),:);
prev_cent = data(1:k,:);
dist=zeros(n,k);

% Repeat until centroids do not change much
while sum(sum(abs(cent - prev_cent))) >= threshold
    prev_cent = cent;
    % Calculate distance
    for i=1:k
        dist(:,i)= sum((repmat(cent(i,:),n,1)-data).^2,2);
    end
    [dist_sort, I]=sort(dist,2);
    cluster=I(:,1);
    % Update centroids
    for j=1:k
        idx=find(cluster==j);
        cent(j,:)=mean(data(idx,:),1);
    end
end

%% Plot out the clusters

for i=1:k
    dist(:,i)= sum((repmat(cent(i,:),n,1)-data).^2,2);
end
[dist_sort, I]=sort(dist,2);
cluster=I(:,1);

figure(1)
plot(data(cluster==1,1),data(cluster==1,2),'r*',data(cluster==2,1),...
    data(cluster==2,2),'b*',data(cluster==3,1),data(cluster==3,2),'g*',...
    data(cluster==4,1),data(cluster==4,2),'rx',data(cluster==5,1),...
    data(cluster==5,2),'bo',data(cluster==6,1),data(cluster==6,2),'go',...
    data(cluster==7,1),data(cluster==7,2),'ro',data(cluster==8,1),...
    data(cluster==8,2),'bx');
legend('1', '2','3', '4','5', '6','7', '8');
hold off

%% Agglomerative hierarchical clustering
% Compute the proximity matrix
% Repeat:
%   1. Update distance
%   2. Merge the nearest two cluster
%   3. Update proximity matrix to reflect the proximity between the new
%   cluster and the original clusters
% Until: Only one cluster remains

%% Single linkage
prox_mat=nan(k);
% Calculate distance
for i=1:k
    for j=1:k
        ith_cluster = data(cluster==i,:);
        jth_cluster = data(cluster==j,:);
        % Compute for each element in proximity matrix
        for m=1:size(ith_cluster,1)
            % For each element calculate min dist from other cluster members
            % Update the dist if the new dist is smaller
            prox_mat(i,j)=min([prox_mat(i,j) ...
                min(sum((repmat(ith_cluster(m,:),size(jth_cluster,1),1)-jth_cluster).^2,2))]);
        end
    end
end
% Join and update distance
% z=linkage(prox_mat,'average');

% Problem with the indices.
% z=zeros(k-1,3);
% prox_mat(~prox_mat)=nan;
% while min(min(prox_mat)) ~= nan
%     idx=find(prox_mat==min(min(prox_mat)));
%     i=floor(idx(1)/k);
%     j=idx(1)-(i-1)*k;
%     prox_mat(i,j)=nan;
% end

figure(2)
dendrogram(z)
% %% Complete linkage
% merge = [];
% for i=1:k
% end
% %% Average linkage
% merge = [];
% for i=1:k
% end