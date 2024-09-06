local util = require("lib.util")

util.nnoremap("<Leader>ped", util.cmd("Project env dev"))
util.nnoremap("<Leader>pes", util.cmd("Project env staging"))
util.nnoremap("<Leader>pep", util.cmd("Project env prod"))

util.nnoremap("<Leader>pcd", util.cmd("Project cmd deploy"))
