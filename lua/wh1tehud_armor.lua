require "base/internal/ui/wh1teHUD/wh1tehud_core"

wh1tehud_armor = {};

registerWidget("wh1tehud_armor")

function wh1tehud_armor:draw()
  if not shouldShowHUD() then return end

  local specPl = getPlayer()

  nvgFontSize(150)
  nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_MIDDLE)

  local color

  if specPl.armorProtection == 0 then
    color = Color(0, 255, 0, 255)
  elseif specPl.armorProtection == 1 then
    color = Color(255, 255, 0, 255)
  else
    color = Color(255, 0, 0, 255)
  end

  nvgFontFace(WH1TEHUD_BASE_FONT)

  if SHADOWS then
    nvgFillColor(Color(0, 0, 0, 255))
    nvgText(43, 3, specPl.armor)
  end

  nvgFillColor(color)
  nvgText(40, 0, specPl.armor)
end

function wh1tehud_armor:settings()
  consolePerformCommand("ui_show_widget wh1tehud_armor")
  consolePerformCommand("ui_set_widget_anchor wh1tehud_armor 0 1")
  consolePerformCommand("ui_set_widget_offset wh1tehud_armor 0 -75")
end
