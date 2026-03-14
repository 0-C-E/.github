-- _fix-links.lua — Pandoc Lua filter for 0 C.E. GDD
-- Place at:  docs/scripts/_fix-links.lua  in the main repository.
--
-- Rewrites bare wiki-style local links so they resolve to .html pages
-- in the generated site.  e.g. [Economy](Economy) → Economy.html
--
-- Rules:
--   • Absolute URLs (http/https/mailto)  → untouched
--   • Pure fragment links (#section)     → untouched
--   • Local links that already have a
--     file extension (.md, .typ, …)      → untouched
--   • Everything else                    → append .html (before any fragment)

function Link(el)
  local url = el.target

  -- Leave absolute URLs and in-page anchors alone.
  if url:match("^https?://") or url:match("^mailto:") or url:match("^#") then
    return el
  end

  -- Split off any fragment (#section-id).
  local path, fragment = url:match("^([^#]*)(#?.*)$")

  -- If the path already has a file extension, leave it.
  if path:match("%.[a-zA-Z0-9]+$") then
    return el
  end

  -- Otherwise append .html.
  el.target = path .. ".html" .. fragment
  return el
end
