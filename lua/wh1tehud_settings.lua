wh1tehud =
  {
  };

registerWidget("wh1tehud");


function wh1tehud:draw()
  consolePerformCommand("ui_hide_all")
  consolePerformCommand("ui_show_widget Crosshairs")
  consolePerformCommand("ui_show_widget chatlog")
  consolePerformCommand("ui_show_widget Scoreboard")
  wh1tehud_timer:settings()
  wh1tehud_health:settings()
  wh1tehud_armor:settings()
  wh1tehud_ammo:settings()
  wh1tehud_scores:settings()
  wh1tehud_weapons:settings()
end
