local M = {}

-- Function to prompt for a class name and call the ClassNew function
function M.prompt_class_name()
    local class_name = vim.fn.input('Enter class name: ')
    if class_name ~= '' then
        call_class_new(class_name)
    else
        print('Class name cannot be empty')
    end
end

return M
