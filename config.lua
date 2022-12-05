Config = Config or {}

--// Framework \\--

Config.Framework = 'QB' -- 'QB', 'OX'

--// Target Zones \\--
Config.Locations = {
    [1] = {
        coords = vector3(-767.26, 327.2, 170.64), 
        radius = 1.0,
        name = 'sphere1',
    },
    --[[ Example for adding more
    [2] = {
        coords = vector3(-720.22, 333.45, 30.62), 
        radius = 1.0,
        name = 'sphere2',
    },]]
}
