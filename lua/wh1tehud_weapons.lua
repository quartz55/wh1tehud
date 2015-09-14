require "base/internal/ui/wh1teHUD/wh1tehud_core"

wh1tehud_weapons = {};

registerWidget("wh1tehud_weapons")

function wh1tehud_weapons:draw()
  if not shouldShowHUD() then return end;

  -- Find player
  local player = getPlayer();

  local weaponCount = 8; -- table.maxn(player.ammo);
  local spaceCount = weaponCount - 1;

  -- Options
  local weaponWidth = 100;
  local weaponHeight = 35;
  local weaponSpacing = 5; -- 0 or -1 to remove spacing

  -- Helpers
  local rackWidth = (weaponWidth * weaponCount) + (weaponSpacing * spaceCount);
  local rackLeft = -(rackWidth / 2);
  local weaponX = rackLeft;
  local weaponY = 0;

  rackHeight = (weaponHeight * weaponCount) + (weaponSpacing * spaceCount);
  rackTop = -(rackHeight / 2);
  weaponX = 0;
  weaponY = rackTop;

  for weaponIndex = 1, weaponCount do

    local weapon = player.weapons[weaponIndex];
    local color = weapon.color;

    -- if we havent picked up the weapon, colour it grey
    if not weapon.pickedup then
      color.r = 128;
      color.g = 128;
      color.b = 128;
    end

    local backgroundColor = Color(0,0,0,65)


    -- Icon
    local iconRadius = weaponHeight * 0.40;
    local iconX = weaponX + (weaponHeight - iconRadius);
    local iconY = (weaponHeight / 2);
    local iconColor = color;

    iconX = weaponX + iconRadius + 5;
    iconY = weaponY + (weaponHeight / 2);

    local circleRadius = iconRadius * 1.70

    local circleAlpha = 0

    if weaponIndex == player.weaponIndexSelected then
      circleAlpha = lerp(circleAlpha, 255, player.weaponSelectionIntensity)
      nvgBeginPath()
      nvgCircle(iconX, iconY, circleRadius)
      nvgFillColor(Color(0, 0, 0, circleAlpha))
      nvgFill()
      nvgStrokeColor(Color(255, 255, 255, circleAlpha))
      nvgStrokeWidth(3)
      nvgStroke()
    end

    if weaponIndex == player.weaponIndexSelected then
      iconColor.r = lerp(iconColor.r, 255, player.weaponSelectionIntensity);
      iconColor.g = lerp(iconColor.g, 255, player.weaponSelectionIntensity);
      iconColor.b = lerp(iconColor.b, 255, player.weaponSelectionIntensity);
      iconColor.a = lerp(iconColor.a, 255, player.weaponSelectionIntensity);
    end

    local svgName = "internal/ui/icons/weapon"..weaponIndex;
    nvgFillColor(iconColor);
    nvgSvg(svgName, iconX, iconY, iconRadius);

    -- Ammo
    local ammoX = weaponX + (iconRadius) + (weaponWidth / 2);
    local ammoCount = player.weapons[weaponIndex].ammo;

    ammoX = weaponX + (weaponWidth / 2) + circleRadius;

    if weaponIndex == 1 then ammoCount = "-" end

    nvgFontSize(weaponHeight);
    nvgFontFace(WH1TEHUD_BASE_FONT);
    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_TOP);

    nvgFontBlur(0);
    nvgFillColor(Color(255,255,255));
    nvgText(ammoX, weaponY, ammoCount);

    weaponY = weaponY + weaponHeight + weaponSpacing;

  end
end

function wh1tehud_weapons:settings()
  consolePerformCommand("ui_show_widget wh1tehud_weapons")
  consolePerformCommand("ui_set_widget_anchor wh1tehud_weapons -1 0")
  consolePerformCommand("ui_set_widget_offset wh1tehud_weapons 20 0")
end
