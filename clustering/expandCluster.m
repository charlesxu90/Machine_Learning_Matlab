function [cluster,visited,mark] = expandCluster(i,neibor,prox_mat,eps,minPts,c,cluster,visited,mark)
% expand the neighbors and add to cluster
cluster(i)=c;
for pt=1:size(neibor,2)
    
    if visited(neibor(pt))==0
        visited(neibor(pt))=1;
        new_neib = find(prox_mat(neibor(pt),:)<=eps); % Get index of neighbors
        
        if size(new_neib,2)>=minPts
            mark(neibor(pt))=1;
            for i =1: size(new_neib,2)
                if(size(find(neibor==new_neib(i)),2)==0)
                    neibor=[neibor new_neib(i)];
                end
            end
        else
            mark(neibor(pt))=2;
        end
        
    elseif mark(neibor(pt))==3
        mark(neibor(pt))=2;
    end
    
    if cluster(neibor(pt))==0
        cluster(neibor(pt))=c;
    end
    
end

end