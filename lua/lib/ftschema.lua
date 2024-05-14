local M = {}

local function get_local_schema_path(name)
    return os.getenv("HOME") .. "/.config/nvim/data/schemas/" .. name
end

M.SCHEMAS = {
    ["json.asl"]            = get_local_schema_path("amazon-states-language.json"),
    ["json.aws-sam"]        = "https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json",
    ["json.cloudformation"] = "https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json",
    ["yaml.asl"]            = get_local_schema_path("amazon-states-language.json"),
    ["yaml.aws-sam"]        = "https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json",
    ["yaml.cloudformation"] = "https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json",
}

function M.get_schema_for_ft(ft)
    return M.SCHEMAS[ft]
end

return M
