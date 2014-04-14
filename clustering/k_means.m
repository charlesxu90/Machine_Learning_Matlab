%% K-means algorithm
% Load data
data = importdata('clu_data.txt');
n = size(data,1);
data=(data-repmat(mean(data),n,1))./repmat(std(data),n,1);
%% Set initial params
ks = 2:20;
threshold = 0.0001; % Stop threshold for which centroids changes
ss_err= zeros(size(ks));
t = 1; % Used to update ss_err

%% Running clustering with different k
% Here we use Euclidean distance
for k=ks
    
    % Generate k random centroids
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
    
    % Calculate SSE
    s_err=0;
    
    % Calculate distance
    for i=1:k
        dist(:,i)= sum((repmat(cent(i,:),n,1)-data).^2,2);
    end
    [dist_sort, I]=sort(dist,2);
    cluster=I(:,1);
    
    for j=1:k
        idx=find(cluster==j);
        s_err=sum(dist(idx,j).^2);
        ss_err(t)=ss_err(t)+s_err;
    end
    t=t+1;
end

%% Evaluate the SSE
figure(1)
plot(ks,ss_err);

%% Plot out the best clustering k=8

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

% Plot out the data
for i=1:k
    dist(:,i)= sum((repmat(cent(i,:),n,1)-data).^2,2);
end
[dist_sort, I]=sort(dist,2);
cluster=I(:,1);

figure(2)
plot(data(cluster==1,1),data(cluster==1,2),'r*');
hold on
plot(data(cluster==2,1),data(cluster==2,2),'bx');
plot(data(cluster==3,1),data(cluster==3,2),'g*');
plot(data(cluster==4,1),data(cluster==4,2),'rx');
plot(data(cluster==5,1),data(cluster==5,2),'ro');
plot(data(cluster==6,1),data(cluster==6,2),'go');
plot(data(cluster==7,1),data(cluster==7,2),'bx');
plot(data(cluster==8,1),data(cluster==8,2),'bo');
hold off
legend('1','2','3','4','5','6','7','8');
