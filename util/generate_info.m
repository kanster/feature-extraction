function [c] = generate_info(dataset_dir, n_test_images)
%
% Copyright Kanzhi Wu, https://kanzi.cc
%
% Please cite this paper if you use this code in your publication:
%   A. Khosla, J. Xiao, A. Torralba, A. Oliva
%   Memorability of Image Regions
%   Advances in Neural Information Processing Systems (NIPS) 2012
%
% Please cite this paper if you use this code in your publication:
%
%
%

% generate trainning samples
[labels, list, c.classes] = get_im_label( dataset_dir );

% generate testing samples
n_categories = unique(labels);
c.test_list = []; 
c.test_labels = [];
c.train_list = []; 
c.train_labels = [];
for i = 1:length(n_categories)
    ind = find(labels == i);
    perm = randperm(length(ind));
    if n_test_images < length(ind)
        c.test_list = [c.test_list list(ind(perm(1:n_test_images)))];
        c.test_labels = [c.test_labels labels(ind(perm(1:n_test_images)))];
        c.train_list = [c.train_list list(ind(perm(1+n_test_images:end)))];
        c.train_labels = [c.train_labels labels(ind(perm(1+n_test_images:end)))];
    else
        c.test_list = [c.test_list list(ind(perm(1:n_test_images)))];
        c.test_labels = [c.test_labels labels(ind(perm(1:n_test_images)))];
        c.train_list = [c.train_list list(ind(perm(1:n_test_images)))];
        c.train_labels = [c.train_labels labels(ind(perm(1:n_test_images)))];    
    end
end





