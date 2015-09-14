require "base/internal/ui/wh1teHUD/wh1tehud_core"

wh1tehud_scores = {};

registerWidget("wh1tehud_scores")

function wh1tehud_scores:draw()
  if not shouldShowHUD() then return end

  local specPl = getPlayer()
  local locPl = getLocalPlayer()

  if gamemodes[world.gameModeIndex].shortName ~= "1v1" then
    return
  end

  local barWidth = 70
  local barHeight = 40
  local fontSize = barHeight*1.1

  local plScore = specPl.score
  local enScore = 0

  for i, v in pairs(players) do
    if v.name ~= specPl.name and v.connected and v.state == PLAYER_STATE_INGAME then
      enScore = v.score
      break
    end
  end

  -- Player score
  nvgBeginPath()
  nvgRect(0, -barHeight, -barWidth, -barHeight)
  nvgFillColor(Color(0, 0, 255, 135))
  nvgFill()

  nvgStrokeColor(Color(255, 255, 255, 255))
  nvgStrokeWidth(3)
  nvgStroke()

  -- nvgFontFace(WH1TEHUD_BASE_FONT)
  nvgFontSize(fontSize)
  nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_MIDDLE)
  nvgFillColor(Color(255, 255, 255, 255))
  nvgText(-barWidth+10, -barHeight-barHeight/2, plScore)

  -- Enemy score
  nvgBeginPath()
  nvgRect(0, 0, -barWidth, -barHeight)
  nvgFillColor(Color(255, 0, 0, 135))
  nvgFill()

  -- nvgFontFace(WH1TEHUD_BASE_FONT)
  nvgFontSize(fontSize)
  nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_MIDDLE)
  nvgFillColor(Color(255, 255, 255, 255))
  nvgText(-barWidth+10, -barHeight/2, enScore)

end

function wh1tehud_scores:settings()
  consolePerformCommand("ui_show_widget wh1tehud_scores")
  consolePerformCommand("ui_set_widget_anchor wh1tehud_scores 1 1")
  consolePerformCommand("ui_set_widget_offset wh1tehud_scores 0 0")
end
