require "base/internal/ui/wh1teHUD/wh1tehud_core"

wh1tehud_ammo = {};

registerWidget("wh1tehud_ammo")

function wh1tehud_ammo:draw()
  if not shouldShowHUD() then return end

  local specPl = getPlayer()

  local weapon = specPl.weapons[specPl.weaponIndexSelected]
  local ammo = weapon.ammo
  if specPl.weaponIndexSelected == 1 then ammo = "-" end

	local svgName = "internal/ui/icons/weapon" .. specPl.weaponIndexSelected;
	iconColor = specPl.weapons[specPl.weaponIndexSelected].color;

  nvgFontSize(100)
  nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_MIDDLE)

  nvgFontFace(WH1TEHUD_BASE_FONT)

  if SHADOWS then
    nvgFillColor(Color(0, 0, 0, 255))
    nvgText(52, 2, ammo)
  end

  nvgFillColor(Color(255, 255, 255, 255))
  nvgText(50, 0, ammo)

  nvgFillColor(iconColor);
  nvgSvg(svgName, 0, 0, 30);
end

function wh1tehud_ammo:settings()
  consolePerformCommand("ui_show_widget wh1tehud_ammo")
  consolePerformCommand("ui_set_widget_anchor wh1tehud_ammo 0 1")
  consolePerformCommand("ui_set_widget_offset wh1tehud_ammo -400 -75")
end
