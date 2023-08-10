require("conf.remap")
require("conf.set")


vim.cmd('colorscheme night-owl')

require("nvim-tree").setup()
require("mason").setup{
	providers = {
		"mason.providers.client",
		"mason.providers.registry-api",
	}
}

-- Define the Class function using VimScript within Lua
local function define_class()
    local vim_script = [[
        function! Class(ClassName)
		    "==================  editing header file =====================                                                       
     let header = a:ClassName.".hpp"                                                                                                                                                                                                                                                                                        
     :vsp %:h/.hpp                                                                                                                                                                                                                             
     call append(0,"#ifndef ".toupper(a:ClassName)."_H")                                                                 
     call append(1,"#define ".toupper(a:ClassName)."_H")                                                           
     call append(2," ")                                                                                                  
     call append(3,"class ".a:ClassName )                                                                                
     call append(4, "{")                                                                                                 
     call append(5, "   public:")                                                                                        
     call append(6, "      ".a:ClassName."();")                                                                          
     call append(7, "      virtual ~".a:ClassName."();")                                                                 
     call append(8, "   protected:")                                                                                     
     call append(9, "   private:")                                                                                       
     call append(10, "};")                                                                                               
     call append(11,"#endif // ".toupper(a:ClassName)."_H")                                                              
     :execute 'write' ! header                                                                                             
   "================== editing source file ========================                                                      
     let src    = a:ClassName.".cpp"                                                                                     
     :vsp %:hpp/.cpp                                                                                                                                                                                                                     
     call append(0,"#include ".a:ClassName.".hpp")                                                                          
     call append(1," ")                                                                                                   
     call append(2,a:ClassName."::".a:ClassName."()")                                                                           
     call append(3,"{")                                                                                                   
     call append(4,"//ctor ")                                                                                             
     call append(5,"}")                                                                                                   
     call append(6," ")                                                                                                   
     call append(7," ")                                                                                                   
     call append(8,a:ClassName."::~".a:ClassName."()")                                                                         
     call append(9,"{")                                                                                                   
     call append(10,"//dtor ")                                                                                            
     call append(11,"}")                                                                                                  
     :execute 'write' ! src
        endfunction
    ]]
    vim.api.nvim_exec(vim_script, true)
end

-- Call the Class function using VimScript from Lua
local function call_class(class_name)
    --[[ local cmd = string.format("call Class('%s')", class_name)
    vim.api.nvim_exec(cmd, true) ]]
	return string.format("call Class('%s')", class_name)
end

-- Define the Class function
define_class()
-- create_mapping()

-- Call the Class function with a class name
--call_class("MyClassName")
