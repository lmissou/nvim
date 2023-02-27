---------- 工具方法

local M = {}

-- 数组合并
function M.array_concat(arr1, arr2)
  for i in pairs(arr2) do
    arr1[#arr1 + i] = arr2[i]
  end
end

return M

