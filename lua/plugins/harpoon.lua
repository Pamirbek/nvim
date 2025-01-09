return {
	"theprimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function()
		require("harpoon"):setup()
	end,
	keys = {
		{ "<leader>a", function() require("harpoon"):list():add() end, desc = "[A]dd file", },
		{ "<C-e>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon quick menu", },
		{ "<A-q>", function() require("harpoon"):list():select(1) end, desc = "Harpoon to file 1", }, 
        { "<A-w>", function() require("harpoon"):list():select(2) end, desc = "Harpoon to file 2", }, 
        { "<A-e>", function() require("harpoon"):list():select(3) end, desc = "Harpoon to file 3", }, 
        { "<A-r>", function() require("harpoon"):list():select(4) end, desc = "Harpoon to file 4", },
		{ "<A-t>", function() require("harpoon"):list():select(5) end, desc = "Harpoon to file 5", },
	},
}
