function [ Vk ] = forwardSweep ( I_branch, Z_branch, Vk, is_end_node, node )
%   The input node is checked to see if it is an end node or not. If it
%   is not an end node, the function proceeds to find the number of
%   branches going out from the node. For each branch going out of the node
%   the funciton is recursively called until the end node of that branch is
%   reached
if(is_end_node(node) ~= 1),
    in_idx = find(I_branch(:,1)==node);
    for i = (1:length(in_idx)),
        out_bus = I_branch(in_idx(i), 2);
        Vk(out_bus) = Vk(node) - Z_branch(in_idx(i), 3)*I_branch(in_idx(i), 3);
        Vk = forwardSweep (I_branch, Z_branch, Vk, is_end_node, out_bus);
    end
end
end

