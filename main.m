Vk = ones(69,1);
Vkprev = zeros(69,1);
Ik = zeros(69,1);
reg_branches = 68;
eps = 0.01;
nodes = (1:length(Vk));
end_nodes = find(~ismember(nodes,I_branch(:,1)));
is_end_node = ismember(nodes, end_nodes);
n_of_endnodes = length(end_nodes);
n_of_branches = length(I_branch);
n_iter = 40;
e = zeros(n_iter,1);
i=1;
for i = (1:n_iter), 
    %Backward Sweep
    Ik = conj(Sl./Vk);
    I_branch(1:reg_branches,3) = 0;
    for end_node = (1:n_of_endnodes),
        n = end_nodes(end_node);
        while n~=1,
            out_idx = find(I_branch(1:reg_branches,2)==n);
            in_idx = find(I_branch(1:reg_branches,1)==n);
            interco_idx = find(I_branch(reg_branches+1:n_of_branches,2)==n);
            I_branch(out_idx,3) = I_branch(out_idx,3) + Ik(n) + sum(I_branch(in_idx,3)) - sum(I_branch(interco_idx,3));
            Ik(n)=0;
            n = I_branch(out_idx,1);
        end
    end
    
    %Forward Sweep
    Vkprev = Vk;
    Vk = forwardSweep(I_branch, Z_branch, Vk, is_end_node, 1);
    e(i) = max(abs(Vk - Vkprev));
    
    %if(e(i) < eps)
     %   break;
    %end
    
    %Interconnect current
    for i =(reg_branches+1:n_of_branches),
        in_bus = I_branch(i,1);
        out_bus = I_branch(i,2);
        I_branch(i,3) = (Vk(in_bus)-Vk(out_bus))/Z_branch(i,3);
    end
end
disp(abs(Vk));
y = (1:69);
x = (1:n_iter);
plot(x,e);
%disp(i);
plot(y, abs(Vk));

            
    
