require "base/internal/ui/wh1teHUD/wh1tehud_core"

wh1tehud_timer = {};

registerWidget("wh1tehud_timer")

function wh1tehud_timer:draw()
  if not shouldShowHUD() then return end

  local specPl = getPlayer()

  local timeRemaining = world.gameTimeLimit - world.gameTime;
  local t = FormatTime(timeRemaining);
  local textTime = string.format("%d:%02d", t.minutes, t.seconds);

  if world.gameState == GAME_STATE_WARMUP then
    textTime = "WARMUP"
  end


  nvgFontSize(80)
  nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE)

  nvgFontFace(WH1TEHUD_BASE_FONT)
  nvgText(0, 0, textTime)

  local text_w = nvgTextWidth(textTime)

  nvgBeginPath()
  nvgRect(-text_w/2-10, -35, text_w+20, 70)
  nvgFillColor(Color(255, 255, 255, 50))
  nvgFill()

end

function wh1tehud_timer:settings()
  consolePerformCommand("ui_show_widget wh1tehud_timer")
  consolePerformCommand("ui_set_widget_anchor wh1tehud_timer 0 1")
  consolePerformCommand("ui_set_widget_offset wh1tehud_timer 0 -190")
end
