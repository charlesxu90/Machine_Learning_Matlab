%% Run C4.5 with data count
% p2data = importdata('p2data.txt');
% data =[];
% for i=1:size(p2data.data)
%     data = [data;repmat(p2data.textdata(i+1,:),p2data.data(i),1)];
% end
% % sum(p2data.data)
% % size(data)
% test_patterns = ['system' '26-30' '46K-50K'];
% Results=C4_5(data(:,[1 3 4]), data(:,2), test_patterns, 0.5)

p2data = importdata('p2data_changed.txt');
data =[];
for i=1:size(p2data,1)
    data = [data;repmat(p2data(i,:),p2data(i,5),1)];
end
% sum(p2data(:,5))
% size(data)
test_patterns = [2 2 5;1 2 5];
Results=C4_5(data(:,[1 3 4]), data(:,2), test_patterns, 0.05)
