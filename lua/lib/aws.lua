return {
    get_profile = function ()
        return os.getenv("AWS_PROFILE")
    end,
    get_credential_timout = function ()
        local filepath = os.getenv("AWS_SESSION_STARTED_FILE")
        if not filepath then
            return nil
        end

        local file = io.open(filepath, "r")
        if not file then
            return nil
        end

        local started_at = file:read("n")
        local current_time = os.time(os.date("*t"))
        local remaining = math.ceil((3600 + started_at - current_time) / 60)
        if remaining <= 0 then
            return "EXP"
        else
            return remaining .. "m"
        end
    end
}
