function [cluster,visited,mark] = expandCluster(i,neibor,prox_mat,eps,minPts,c,cluster,visited,mark)
% explore neighbors and expand cluster
cluster(i)=c;
pt = 1;
while pt <= size(neibor,2)
% for pt=1:size(neibor,2)
    
    if visited(neibor(pt))==0
        
        visited(neibor(pt))=1;
        new_neib = find(prox_mat(neibor(pt),:)<=eps); % Get index of neighbors
        
        if size(new_neib,2)>=minPts
            
            mark(neibor(pt))=1; % Mark core
            % Join Neighbor with new neighbors un-duplicated
            for i =1: size(new_neib,2)
                if(size(find(neibor==new_neib(i)),2)==0)
                    neibor=[neibor new_neib(i)];
                end
            end
        else
            mark(neibor(pt))=2; % Mark Border
        end
        
    elseif mark(neibor(pt))==3
        mark(neibor(pt))=2; % Mark Border
    end
    
    if cluster(neibor(pt))==0 % If cluster(pt) not belong to any cluster
        cluster(neibor(pt))=c; % Add to cluster c
    end
    pt = pt + 1;
end

end