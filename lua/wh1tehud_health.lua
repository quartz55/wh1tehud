require "base/internal/ui/wh1teHUD/wh1tehud_core"

wh1tehud_health = {};

registerWidget("wh1tehud_health")

function wh1tehud_health:draw()
  if not shouldShowHUD() then return end

  local specPl = getPlayer()
  local hp = specPl.health

  local color

  if hp <= 20 then
    color = Color(255, 0, 0, 255)
  elseif hp <= 50 then
    color = Color(255, 255, 0, 255)
  elseif hp <= 100 then
    color = Color(255, 255, 255, 255)
  else
    color = Color(0, 100, 255, 255)
  end

  nvgFontSize(150)
  nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_MIDDLE)

  nvgFontFace(WH1TEHUD_BASE_FONT)

  if SHADOWS then
    nvgFillColor(Color(0, 0, 0, 255))
    nvgText(-37, 3, specPl.health)
  end

  nvgFillColor(color)
  nvgText(-40, 0, specPl.health)

  nvgBeginPath()
  nvgMoveTo(0, -60)
  nvgLineTo(0, 60)
  nvgStrokeColor(Color(255, 255, 255, 255));
  nvgStrokeWidth(4)
  nvgStroke()
end

function wh1tehud_health:settings()
  consolePerformCommand("ui_show_widget wh1tehud_health")
  consolePerformCommand("ui_set_widget_anchor wh1tehud_health 0 1")
  consolePerformCommand("ui_set_widget_offset wh1tehud_health 0 -75")
end
