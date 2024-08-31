-----------------------------------
-- Detects bits
-----------------------------------
xi = xi or {}

---@enum xi.detects
xi.detects =
{
    NONE              = 0x000,
    SIGHT             = 0x001,
    HEARING           = 0x002,
    SIGHT_AND_HEARING = 0x003,
    LOWHP             = 0x004,
    NONE1             = 0x008,
    NONE2             = 0x010,
    MAGIC             = 0x020,
    WEAPONSKILL       = 0x040,
    JOBABILITY        = 0x080,
    SCENT             = 0x100,
}
