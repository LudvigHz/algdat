include("utils.jl")

function max_flow(source, sink, nodes, capacities)

  flows = zeros(Int, (nodes, nodes))

  aug_path = find_augmenting_path(source, sink, nodes, flows, capacities)

  while aug_path != nothing
    flow_inc = max_path_flow(aug_path, flows, capacities)
    send_flow!(aug_path, flow_inc, flows)

    aug_path = find_augmenting_path(source, sink, nodes, flows, capacities)
  end

  total_flow = sum(flows[:, sink])

  return flows, total_flow
end
