#include "CfgLootSmall.hpp"
#include "CfgBuildingLoot.hpp"
#include "cfgLoot.hpp"

class HW_RscText {
	idc = -1;
	type = 0;
	style = 0x02;
	text = "";
	font = "Zeppelin32";
	sizeEx = 0.023;
	colorBackground[] = { 1, 1, 1, 0.3 };
	colorText[] = { 0, 0, 0, 1 };
	x = 0.8;
	y = 0.1;
	w = 0.2;
	h = 0.05;
};
class HW_RscListBox {
	type = 5;
	style = 0 + 0x10;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	color[] = {1, 1, 1, 1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.023529, 0, 0.0313725, 1};
	colorSelect2[] = {0.023529, 0, 0.0313725, 1};
	colorSelectBackground[] = {0.58, 0.1147, 0.1108, 1};
	colorSelectBackground2[] = {0.58, 0.1147, 0.1108, 1};
	period = 1;
	colorBackground[] = {0, 0, 0, 1};
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;

	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};
class SnapBuilding {
	class Barrier {
		snapTo[] = {
			"Land_HBarrier5_DZ",
			"Land_HBarrier3_DZ",
			"Land_HBarrier1_DZ",
			"Sandbag1_DZ",
			"BagFenceRound_DZ",
			"Fort_RazorWire"
		};
		radius = 5;
	};
	class Land_HBarrier5Preview: Barrier {
		points[] = {
		{0,0,0,"Pivot"},
		{0,-0.75,0.1,"Back"},
		{0,0.75,0.1,"Front"},
		{-2.85,0,0.1,"Left"},
		{2.85,0,0.1,"Right"},
		{0,0,0.9,"Top"}
		};
	};
	class Land_HBarrier5_DZ: Land_HBarrier5Preview {
		points[] = {
		{0,0,0,"Pivot"},
		{0,-0.75,0,"Back"},
		{0,0.75,0,"Front"},
		{-2.85,0,0,"Left"},
		{2.85,0,0,"Right"},
		{0,0,0.9,"Top"}
		};
	};
	class Land_HBarrier3ePreview: Barrier {
		points[] = {
		{0,0,0,"Pivot"},
		{0,-0.75,0,"Back"},
		{0,0.75,0,"Front"},
		{-1.7,0,0,"Left"},
		{1.7,0,0,"Right"},
		{0,0,0.9,"Top"}
		};
	};
	class Land_HBarrier3_DZ: Land_HBarrier3ePreview {};
	class Land_HBarrier1Preview: Barrier {
		points[] = {
		{0,0,0,"Pivot"},
		{0,-0.75,0,"Back"},
		{0,0.75,0,"Front"},
		{-0.6,0,0,"Left"},
		{0.6,0,0,"Right"},
		{0,0,0.9,"Top"}
		};
	};
	class Land_HBarrier1_DZ: Land_HBarrier1Preview {};
	class Fort_RazorWirePreview: Barrier {
		points[] = {
		{0,0,0,"Pivot"},
		{0,-0.95,-0.3,"Back"},
		{0,0.95,-0.3,"Front"},
		{-4.1,0,-0.3,"Left"},
		{4.1,0,-0.3,"Right"},
		{0,0,1,"Top"}
		};
	};
	class Fort_RazorWire: Fort_RazorWirePreview {};
	class Sandbag1_DZ: Barrier {
		points[] = {
		{0,0,0,"Pivot"},
		{-1.5,0,0,"Left"},
		{1.5,0,0,"Right"},
		{0,0,0.4,"Top"}
		};
	};
	class BagFenceRound_DZ: Barrier {
		points[] = {
		{0,0,0,"Pivot"},
		{-1.295,0.38,0,"Left"},
		{1.295,0.38,0,"Right"},
		{0,0,0.4,"Top"}
		};
	};
	class FloorsWallsStairs {
		snapTo[] = {
			"WoodFloorQuarter_DZ",
			"WoodFloorHalf_DZ",
			"WoodFloor_DZ",
			"WoodStairs_DZ",
			"WoodStairsSans_DZ",
			"WoodSmallWallDoor_DZ",
			"WoodSmallWall_DZ",
			"WoodSmallWallWin_DZ",
			"Land_DZE_WoodDoor",
			"Land_DZE_WoodDoorLocked",
			"WoodLargeWall_DZ",
			"Land_DZE_LargeWoodDoor",
			"WoodLargeWallWin_DZ",
			"WoodLargeWallDoor_DZ",
			"Land_DZE_GarageWoodDoor",
			"Land_DZE_GarageWoodDoorLocked",
			"Land_DZE_LargeWoodDoorLocked",
			"WoodSmallWallThird_DZ",
			"CinderWall_DZ",
			"CinderWallDoorway_DZ",
			"CinderWallDoorLocked_DZ",
			"CinderWallDoor_DZ",
			"CinderWallSmallDoorway_DZ",
			"CinderWallDoorSmallLocked_DZ",
			"CinderWallHalf_DZ",
			"CinderWallDoorSmall_DZ",
			"MetalFloor_DZ"
		};
		radius = 7;
	};
	class WoodFloorQuarter_Preview_DZ: FloorsWallsStairs {
		points[] = {
		{0,0,0,"Pivot"},
		{0,-1.23,0,"Back"},
		{0,1.23,0,"Front"},
		{-1.24,0,0,"Left"},
		{1.24,0,0,"Right"}
		};
	};
	class WoodFloorQuarter_DZ: FloorsWallsStairs { 
		points[] = {
		{0,0,0,"Pivot"},
		{0,-1.23,0.137726,"Back"},
		{0,1.23,0.137726,"Front"},
		{-1.24,0,0.137726,"Left"},
		{1.24,0,0.137726,"Right"}
		};
	};
	class WoodFloorHalf_Preview_DZ: FloorsWallsStairs {
		points[] = {
		{0,0,0,"Pivot"},
		{0,-2.34,0,"Back"},
		{0,2.34,0,"Front"},
		{-1.25,0,0,"Left"},
		{1.25,0,0,"Right"}
		};
	};
	class WoodFloorHalf_DZ: FloorsWallsStairs {
		points[] = {
		{0,0,0,"Pivot"},
		{0,-2.34,0.1407,"Back"},
		{0,2.34,0.1407,"Front"},
		{-1.25,0,0.1407,"Left"},
		{1.25,0,0.1407,"Right"}
		};
	};
	class WoodFloor_Preview_DZ: FloorsWallsStairs {
		points[] = {
		{0,0,0,"Pivot"},
		{0,-2.33,0.130,"Back"},
		{0,2.33,0.130,"Front"},
		{-2.495,0,0.130,"Left"},
		{2.495,0,0.130,"Right"}
		};
		radius = 10;
	};
	class WoodFloor_DZ: WoodFloor_Preview_DZ {};
	class Stairs_DZE: FloorsWallsStairs {
		points[] = {
		{0,0,0,"Pivot"},
		{1.56055,-0.78,1.5,"Back"},
		{1.56055,0.78,1.5,"Front"},
		{1.73926,0.05,2.9,"Top"},
		{-1.73926,0.05,0,"Bottom"}
		};
	};
	class WoodStairs_DZ: Stairs_DZE {};
	class WoodStairs_Preview_DZ: Stairs_DZE {};
	class WoodStairsSans_Preview_DZ: Stairs_DZE {};
	class WoodStairsSans_DZ: Stairs_DZE {};
	class WoodSmall_DZE: FloorsWallsStairs {
		points[] = {
		{0,0,0,"Pivot"},
		{-2.285, 0, 1.5,"Left"},
		{2.285, 0, 1.5,"Right"},
		{0, 0, 3,"Top"}
		};
	};
	class WoodSmallWallDoor_Preview_DZ: WoodSmall_DZE {};
	class WoodSmallWall_Preview_DZ: WoodSmall_DZE {};
	class WoodSmallWallWin_Preview_DZ: WoodSmall_DZE {};
	class WoodSmallWallDoor_DZ: WoodSmall_DZE {};
	class WoodSmallWall_DZ: WoodSmall_DZE {};
	class WoodSmallWallWin_DZ: WoodSmall_DZE {};
	class Land_DZE_WoodDoor: WoodSmall_DZE {};
	class Land_DZE_WoodDoorLocked: WoodSmall_DZE {};
	class WoodDoor_Preview_DZ: WoodSmall_DZE {};
	class WoodLarge_DZE: FloorsWallsStairs {
		points[] = {
		{0,0,0,"Pivot"},
		{-2.45, 0, 1.5,"Left"},
		{2.45, 0, 1.5,"Right"},
		{0, 0, 3,"Top"}
		};
	};
	class WoodLargeWall_Preview_DZ: WoodLarge_DZE {};
	class WoodLargeWallWin_Preview_DZ: WoodLarge_DZE {};
	class WoodLargeWallDoor_Preview_DZ: WoodLarge_DZE {};
	class WoodSmallWallThird_Preview_DZ: WoodLarge_DZE {
		points[] = {
		{0,0,0,"Pivot"},
		{-2.445, 0, 1.5,"Left"},
		{2.445, 0, 1.5,"Right"},
		{0, 0, 1.17,"Top"}
		};
	};
	class WoodSmallWallThird_DZ: WoodSmallWallThird_Preview_DZ {};
	class WoodLargeWall_DZ: WoodLarge_DZE {};
	class Land_DZE_LargeWoodDoor: WoodLarge_DZE {};
	class WoodLargeWallWin_DZ: WoodLarge_DZE {};
	class WoodLargeWallDoor_DZ: WoodLarge_DZE {};
	class Land_DZE_GarageWoodDoor: WoodLarge_DZE {};
	class GarageWoodDoor_Preview_DZ: WoodLarge_DZE {};
	class Land_DZE_GarageWoodDoorLocked: WoodLarge_DZE {};
	class Land_DZE_LargeWoodDoorLocked: WoodLarge_DZE {};
	class LargeWoodDoor_Preview_DZ: WoodLarge_DZE {};
	class Cinder_DZE: FloorsWallsStairs {
		points[] = {
		{0,0,0,"Pivot"},
		{-2.752, 0, 1.5,"Left"},
		{2.752, 0, 1.5,"Right"},
		{0, 0, 3.37042,"Top"}
		};
		radius = 10;
	};
	class CinderWall_Preview_DZ: Cinder_DZE {};
	class CinderWallDoorway_Preview_DZ: Cinder_DZE {};
	class CinderWallSmallDoorway_Preview_DZ: Cinder_DZE {}; 
	class CinderWallHalf_Preview_DZ: Cinder_DZE {
		points[] = {
		{0,0,0,"Pivot"},
		{-2.752, 0, 1.5,"Left"},
		{2.752, 0, 1.5,"Right"},
		{0, 0, 1.5,"Top"}
		};
	};
	class CinderWall_DZ: Cinder_DZE {};
	class CinderWallDoorway_DZ: Cinder_DZE {};
	class CinderWallDoorLocked_DZ: Cinder_DZE {};
	class CinderWallDoor_DZ: Cinder_DZE {};
	class CinderWallSmallDoorway_DZ: Cinder_DZE {};
	class CinderWallDoorSmallLocked_DZ: Cinder_DZE {};
	class CinderWallHalf_DZ: Cinder_DZE {
		points[] = {
		{0,0,0,"Pivot"},
		{-2.752, 0, 1.5,"Left"},
		{2.752, 0, 1.5,"Right"},
		{0, 0, 1.5,"Top"}
		};
	};
	class CinderWallDoorSmall_DZ: Cinder_DZE {};
	class MetalFloor_Preview_DZ: FloorsWallsStairs {
		points[] = {
		{0,0,0.011,"Pivot"},
		{0, -2.64, 0.009,"Back"},
		{0, 2.64, 0.009,"Front"},
		{-2.64, 0, 0.009,"Left"},
		{2.64, 0, 0.009,"Right"}
		};
		radius = 12;
	};
	class MetalFloor_DZ: FloorsWallsStairs {
		points[] = {
		{0,0,0,"Pivot"},
		{0, -2.64, 0.15,"Back"},
		{0, 2.64, 0.15,"Front"},
		{-2.64, 0, 0.15,"Left"},
		{2.64, 0, 0.15,"Right"}
		};
		radius = 12;
	};
	class WoodCrate_DZ {
		snapTo[] = {
			"WoodCrate_DZ"
		};
		radius = 5;
		points[] = {
		{0,0,0,"Pivot"},
		{0,-0.47,0,"Back"},
		{0,0.47,0,"Front"},
		{-0.47,0,0,"Left"},
		{0.47,0,0,"Right"},
		{0,0,0.47,"Top"}
		};
	};
	class MetalPanel_DZ {
		snapTo[] = {
			"MetalPanel_DZ"
		};
		radius = 5;
		points[] = {
		{0,0,0,"Pivot"},
		{-1.5,0,0,"Left"},
		{1.5,0,0,"Right"}
		};
	};
	class MetalGate_DZ {
		snapTo[] = {
			"MetalGate_DZ"
		};
		radius = 5;
		points[] = {
		{0,0,0,"Pivot"},
		{-4.1,0,0,"Left"}
		};
	};
	class StickFence_DZ {
		snapTo[] = {
			"StickFence_DZ"
		};
		radius = 10;
		points[] = {
		{0,0,0,"Pivot"},
		{-2.95,0,0.3,"Left"},
		{2.95,0,0.3,"Right"}
		};
	};
	class Fence_corrugated_DZ {
		snapTo[] = {
			"Fence_corrugated_DZ"
		};
		radius = 10;
		points[] = {
		{0,0,0,"Pivot"},
		{-1.95,0,0.88,"Left"},
		{1.95,0,0.88,"Right"}
		};
	};
	class WoodRamp_Preview_DZ {
		snapTo[] = {
			"WoodRamp_DZ"
		};
		radius = 7;
		points[] = {
		{0,0,0,"Pivot"},
		{0.65,-1.7,1.2,"Back"},
		{0.65,1.5,1.2,"Front"},
		{3.34,-0.115,2.82,"Top"}
		};
	};
	class WoodRamp_DZ: WoodRamp_Preview_DZ {};
	class WoodLadder_Preview_DZ {
		snapTo[] = {
			"WoodLadder_DZ"
		};
		radius = 5;
		points[] = {
		{0,0,0,"Pivot"},
		{-0.4,0,1.725,"Left"},
		{0.4,0,1.725,"Right"}
		};
	};
	class WoodLadder_DZ: WoodLadder_Preview_DZ {};
	class VaultStorageLocked {
		snapTo[] = {
			"VaultStorageLocked",
			"VaultStorage"
		};
		radius = 5;
		points[] = {
		{0,0,0,"Pivot"},
		{0,0.284,0.615,"Back"},
		{0,0,1.23,"Top"},
		{-0.362,0,0.615,"Left"},
		{0.362,0,0.615,"Right"}
		};
		
	};
	class VaultStorage: VaultStorageLocked {};
};
class Life_RscScrollBar {
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.3};
	thumb = "Scripts\Gold_Coin_system\Gui\thumb_ca.paa";
	arrowEmpty = "Scripts\Gold_Coin_system\Gui\arrowEmpty_ca.paa";
	arrowFull = "Scripts\Gold_Coin_system\Gui\arrowFull_ca.paa";
	border = "Scripts\Gold_Coin_system\Gui\border_ca.paa";
	shadow = 0;
	scrollSpeed = 0.06;
	width = 0;
	height = 0;
	autoScrollEnabled = 0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};
class Life_RscControlsGroup {
	type = 15;
	idc = -1;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;
	style = 16;

	class VScrollBar : Life_RscScrollBar
	{
		width = 0.021;
		autoScrollEnabled = 1;
	};

	class HScrollBar : Life_RscScrollBar
	{
		height = 0.028;
	};

	class Controls {};
};
class Life_RscControlsGroupNoScrollbars : Life_RscControlsGroup {
	class VScrollbar : VScrollbar {
		width = 0;
	};
	class HScrollbar : HScrollbar {
		height = 0;
	};
};
class Life_RscHud {
	idc = -1;
	type = 0;
	style = 0x00;
	colorBackground[] = { 1 , 1 , 1 , 0 };
	colorText[] = { 1 , 1 , 1 , 1 };
	font = "Zeppelin32";
	sizeEx = 0.025;
	h = 0.25;
	text = "";
};
class Life_RscListNBox {
	style = 16;
	type = 102;
	shadow = 0;
	font = "Zeppelin32";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	color[] = {0.95,0.95,0.95,1};
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	period = 1.2;
	class ListScrollBar: Life_RscScrollBar {};
	class ScrollBar: Life_RscScrollBar {};
};
class Life_RscText {
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	type = 0;
	style = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	font = "Zeppelin32";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	colorText[] = {1, 1, 1, 1.0};
	colorBackground[] = {0, 0, 0, 0};
	linespacing = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};
class Life_RscLine : Life_RscText {
	idc = -1;
	style = 176;
	x = 0.17;
	y = 0.48;
	w = 0.66;
	h = 0;
	text = "";
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1.0};
};
class Life_RscTree {
	style = 2;
	font = "Zeppelin32";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	expandedTexture = "Scripts\Gold_Coin_system\Gui\expandedTexture_ca.paa";
	hiddenTexture = "Scripts\Gold_Coin_system\Gui\hiddenTexture_ca.paa";
	rowHeight = 0.0439091;
	color[] = {1, 1, 1, 1};
	colorSelect[] = {0.7, 0.7, 0.7, 1};
	colorBackground[] = {0, 0, 0, 0};
	colorSelectBackground[] = {0, 0, 0, 0.5};
	colorBorder[] = {0, 0, 0, 0};
	borderSize = 0;
};
class Life_RscTitle : Life_RscText {
	style = 0;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {0.95, 0.95, 0.95, 1};
};
class Life_RscStructuredText {
	type = 13;
	style = 0;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1, 1, 1, 1.0};
	shadow = 1;
	class Attributes {
		font = "Zeppelin32";
		color = "#ffffff";
		align = "left";
		shadow = 1;
	};
};
class Life_RscListBox2
{
	style = 16;
	idc = -1;
	type = 5;
	w = 0.275;
	h = 0.04;
	font = "Zeppelin32";
	colorSelect[] = {0.11,0.686,0.831,1};
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0.28,0.28,0.28,0.28};
	colorSelect2[] = {1, 1, 1, 1};
	colorSelectBackground[] = {0.95, 0.95, 0.95, 0.5};
	colorSelectBackground2[] = {1, 1, 1, 0.5};
	colorScrollbar[] = {0.2, 0.2, 0.2, 1};
	arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
	arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
	wholeHeight = 0.45;
	rowHeight = 0.04;
	color[] = {0.7, 0.7, 0.7, 1};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	sizeEx = 0.023;
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
		border = "\ca\ui\data\igui_border_scroll_ca.paa";
	};
	soundPush[] = { "", 0, 1 };
	soundEnter[] =	{ "", 0, 1 };
	soundClick[] ={ "", 0, 1 };
	soundEscape[] ={ "", 0, 1 };
	sound[] ={ "", 0, 1 };
	soundSelect[] = { "", 0, 1 };
};
class Life_RscButton {
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "Zeppelin32";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.7};
	colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorShadow[] = {0,0,0,1};
	colorBorder[] = {0,0,0,1};
	borderSize = 0.0;
	soundPush[] = { "", 0, 1 };
	soundEnter[] = { "", 0, 1 };
	soundClick[] = { "", 0, 1 };
	soundEscape[] = { "", 0, 1 };
	sound[] = { "", 0, 1 };
};
class Life_RscShortcutButton {
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	color[] = {1,1,1,1.0};
	colorFocused[] = {1,1,1,1.0};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackground2[] = {1,1,1,1};
	animTextureDefault = "Scripts\Gold_Coin_system\Gui\normal_ca.paa";
	animTextureNormal = "Scripts\Gold_Coin_system\Gui\normal_ca.paa";
	animTextureDisabled = "Scripts\Gold_Coin_system\Gui\normal_ca.paa";
	animTextureOver = "Scripts\Gold_Coin_system\Gui\over_ca.paa";
	animTextureFocused = "Scripts\Gold_Coin_system\Gui\focus_ca.paa";
	animTexturePressed = "Scripts\Gold_Coin_system\Gui\down_ca.paa";
	periodFocus = 1.2;
	periodOver = 0.8;
	class HitZone {
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	class ShortcutPos {
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos {
		left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	period = 0.4;
	font = "Zeppelin32";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	action = "";
	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	class AttributesImage {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
	soundPush[] = { "", 0, 1 };
	soundEnter[] = { "", 0, 1 };
	soundClick[] = { "", 0, 1 };
	soundEscape[] = { "", 0, 1 };
	sound[] = { "", 0, 1 };
};
class Life_RscButtonMenu : Life_RscShortcutButton {
	idc = -1;
	type = 16;
	style = "0x02 + 0xC0";
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[] = {0,0,0,0.8};
	colorBackgroundFocused[] = {1,1,1,1};
	colorBackground2[] = {0.75,0.75,0.75,1};
	color[] = {1,1,1,1};
	colorFocused[] = {0,0,0,1};
	color2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class TextPos {
		left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class ShortcutPos {
		left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
	textureNoShortcut = "";
};
class Life_RscEdit {
	type = 2;
	style = 0x00 + 0x40;
	font = "Zeppelin32";
	shadow = 2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorBackground[] = {0, 0, 0, 1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	autocomplete = 1;
	colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
	canModify = 1;
	soundPush[] = { "", 0, 1 };
	soundEnter[] = { "", 0, 1 };
	soundClick[] = { "", 0, 1 };
	soundEscape[] = { "", 0, 1 };
	sound[] = { "", 0, 1 };
};
class Life_RscCombo {
	style = 16;
	type = 4;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelect[] = {0, 0, 0, 1};	
	colorText[] = {0.95, 0.95, 0.95, 1};
	maxHistoryDelay = 1;
	colorBackground[] = {0.4,0.4,0.4,0.4};
	colorSelectBackground[] = {1, 1, 1, 0.7};
	colow_Rscrollbar[] = {1, 0, 0, 1};
	arrowFull = "Scripts\Gold_Coin_system\Gui\arrowFull_sca.paa";
	arrowEmpty = "Scripts\Gold_Coin_system\Gui\arrowEmpty_ca.paa";
	wholeHeight = 0.45;
	color[] = {1, 1, 1, 1};
	colorActive[] = {1, 0, 0, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	font = "Zeppelin32";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	class ComboScrollBar : Life_RscScrollBar {};
};
class Life_RscToolbox {
	colorText[] = {0.95, 0.95, 0.95, 1};
	color[] = {0.95, 0.95, 0.95, 1};
	colorTextSelect[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.95, 0.95, 0.95, 1};
	colorTextDisable[] = {0.4, 0.4, 0.4, 1};
	colorDisable[] = {0.4, 0.4, 0.4, 1};
	colorSelectedBg[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
	font = "Zeppelin32";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
};
class AHRSCCombo {
	access = 0;
	type = 4;
	style = 0;
	colorSelect[] = {0.023529,0,0.0313725,1};
	colorText[] = {0.023529,0,0.0313725,1};
	colorBackground[] = {0.95,0.95,0.95,1};
	coloAHRSCrollbar[] = {0.023529,0,0.0313725,1};
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	class ScrollBar {
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelectBackground[] = {0.8784,0.8471,0.651,1};
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {0,0,0,0.6};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	font = "Zeppelin32";
	sizeEx = 0.03921;
};
class AHRSCMapControl {
	access = 0;
	type = 101;
	idc = 51;
	style = 48;
	x = "0.42315 * safezoneW + safezoneX";
	y = "0.269348 * safezoneH + safezoneY";
	w = "0.293691 * safezoneW";
	h = "0.463997 * safezoneH";
	moveOnEdges = 0;
	shadow = 0;
	maxSatelliteAlpha = .85;
	alphaFadeStartScale = .35;
	alphaFadeEndScale = .4;
	colorOutside[] = {0,0,0,1};
	font = "EtelkaNarrowMediumPro";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
	colorBackground[] = {.8,.8,.8,1};
	colorText[] = {0,0,0,1};
	colorRailway[] = {.5,.5,.5,.5};
	colorSea[] = {.56,.8,.98,.5};
	colorForest[] = {.6,.8,.2,.5};
	colorRocks[] = {.5,.5,.5,.5};
	colorCountlines[] = {.65,.45,.27,.5};
	colorMainCountlines[] = {.65,.45,.27,1};
	colorCountlinesWater[] = {0,.53,1,.5};
	colorMainCountlinesWater[] = {0,.53,1,1};
	colorForestBorder[] = {.4,.8,0,1};
	colorRocksBorder[] = {.5,.5,.5,1};
	colorPowerLines[] = {0,0,0,1};
	colorNames[] = {0,0,0,1};
	colorInactive[] = {1,1,1,.5};
	colorLevels[] = {.286,.177,.094,.5};
	fontLabel = "TahomaB";
	sizeExLabel = .04;
	fontGrid = "TahomaB";
	sizeExGrid = .04;
	fontUnits = "TahomaB";
	sizeExUnits = .04;
	fontNames = "TahomaB";
	sizeExNames = .04;
	fontInfo = "TahomaB";
	sizeExInfo = .04;
	fontLevel = "TahomaB";
	sizeExLevel = .04;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	stickX[] = {.2,{"Gamma",1,1.5}};
	stickY[] = {.2,{"Gamma",1,1.5}};
	ptsPerSquareSea = 6;
	ptsPerSquareTxt = 8;
	ptsPerSquareCLn = 8;
	ptsPerSquareExp = 8;
	ptsPerSquareCost = 8;
	ptsPerSquareFor = "4.0f";
	ptsPerSquareForEdge = "10.0f";
	ptsPerSquareRoad = 2;
	ptsPerSquareObj = 10;
	showCountourInterval = 0;
	onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)";
	onMouseButtonDown = "mouseButtonDown = _this Select 1";
	onMouseButtonUp = "mouseButtonUp = _this Select 1";				
	class CustomMark {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0,0,1,1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Bunker {
		icon = "\ca\ui\data\map_bunker_ca.paa";
		color[] = {0,0,1,1};
		size = 14;
		importance = 1.5 * 14 * .05;
		coefMin = .25;
		coefMax = 4;
	};
	class Bush {
		icon = "\ca\ui\data\map_bush_ca.paa";
		color[] = {.55,.64,.43,1};
		size = 14;
		importance = .2 * 14 * .05;
		coefMin = .25;
		coefMax = 4;
	};
	class BusStop {
		icon = "\ca\ui\data\map_busstop_ca.paa";
		color[] = {0,0,1,1};
		size = 10;
		importance = 1 * 10 * .05;
		coefMin = .25;
		coefMax = 4;
	};
	class Command {
		icon = "#(argb,8,8,3)color(1,1,1,1)";
		color[] = {0,.9,0,1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Cross {
		icon = "\ca\ui\data\map_cross_ca.paa";
		color[] = {0,0,1,1};
		size = 16;
		importance = .7 * 16 * .05;
		coefMin = .25;
		coefMax = 4;
	};
	class Fortress {
		icon = "\ca\ui\data\map_bunker_ca.paa";
		color[] = {0,0,1,1};
		size = 16;
		importance = 2 * 16 * .05;
		coefMin = .25;
		coefMax = 4;
	};
	class Fuelstation {
		icon = "#(argb,8,8,3)color(0,0,0,1)";
		color[] = {0,0,0,1};
		size = 16;
		importance = 2 * 16 * .05;
		coefMin = .75;
		coefMax = 4;
	};
	class Fountain {
		icon = "\ca\ui\data\map_fountain_ca.paa";
		color[] = {0,.35,.7,1};
		size = 12;
		importance = 1 * 12 * .05;
		coefMin = .25;
		coefMax = 4;
	};
	class Hospital {
		icon = "\ca\ui\data\map_hospital_ca.paa";
		color[] = {.78,0,.05,1};
		size = 16;
		importance = 2 * 16 * .05;
		coefMin = .5;
		coefMax = 4;
	};
	class Chapel {
		icon = "\ca\ui\data\map_chapel_ca.paa";
		color[] = {0,0,1,1};
		size = 16;
		importance = 1 * 16 * .05;
		coefMin = .9;
		coefMax = 4;
	};
	class Church {
		icon = "\ca\ui\data\map_church_ca.paa";
		color[] = {0,0,1,1};
		size = 16;
		importance = 2 * 16 * .05;
		coefMin = .9;
		coefMax = 4;
	};
	class Legend {
		x = "SafeZoneX";
		y = "SafeZoneY";
		w = .34;
		h = .152;
		font = "Zeppelin32";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
		colorBackground[] = {0,0,0,1};
		color[] = {0,0,0,1};
	};
	class Lighthouse {
		icon = "\ca\ui\data\map_lighthouse_ca.paa";
		color[] = {.78,0,.05,1};
		size = 20;
		importance = 3 * 16 * .05;
		coefMin = .9;
		coefMax = 4;
	};
	class Quay {
		icon = "\ca\ui\data\map_quay_ca.paa";
		color[] = {0,0,1,1};
		size = 16;
		importance = 2 * 16 * .05;
		coefMin = .5;
		coefMax = 4;
	};
	class Rock {
		icon = "\ca\ui\data\map_rock_ca.paa";
		color[] = {0,0,1,1};
		size = 12;
		importance = .5 * 12 * .05;
		coefMin = .25;
		coefMax = 4;
	};
	class Ruin {
		icon = "\ca\ui\data\map_ruin_ca.paa";
		color[] = {.78,0,.05,1};
		size = 16;
		importance = 1.2 * 16 * .05;
		coefMin = 1;
		coefMax = 4;
	};
	class SmallTree {
		icon = "\ca\ui\data\map_smalltree_ca.paa";
		color[] = {.55,.64,.43,1};
		size = 12;
		importance = .6 * 12 * .05;
		coefMin = .25;
		coefMax = 4;
	};
	class Stack {
		icon = "\ca\ui\data\map_stack_ca.paa";
		color[] = {0,0,1,1};
		size = 20;
		importance = 2 * 16 * .05;
		coefMin = .9;
		coefMax = 4;
	};
	class Task {
		icon = "\ca\ui\data\ui_taskstate_current_CA.paa";
		iconCreated = "\ca\ui\data\ui_taskstate_new_CA.paa";
		iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
		iconDone = "\ca\ui\data\ui_taskstate_done_CA.paa";
		iconFailed = "\ca\ui\data\ui_taskstate_failed_CA.paa";
		color[] = {.863,.584,.0,1};
		colorCreated[] = {.95,.95,.95,1};
		colorCanceled[] = {.606,.606,.606,1};
		colorDone[] = {.424,.651,.247,1};
		colorFailed[] = {.706,.0745,.0196,1};
		size = 10;
		coefMin = 1;
		coefMax = 4;
		importance = 1;
	};
	class Tree {
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {.55,.64,.43,1};
		size = 12;
		importance = .9 * 16 * .05;
		coefMin = .25;
		coefMax = 4;
	};
	class Tourism {
		icon = "\ca\ui\data\map_tourism_ca.paa";
		color[] = {.78,0,.05,1};
		size = 16;
		importance = 1 * 16 * .05;
		coefMin = .7;
		coefMax = 4;
	};
	class Transmitter {
		icon = "\ca\ui\data\map_transmitter_ca.paa";
		color[] = {0,0,1,1};
		size = 20;
		importance = 2 * 16 * .05;
		coefMin = .9;
		coefMax = 4;
	};
	class ViewTower {
		icon = "\ca\ui\data\map_viewtower_ca.paa";
		color[] = {0,0,1,1};
		size = 16;
		importance = 2.5 * 16 * .05;
		coefMin = .5;
		coefMax = 4;
	};
	class Watertower {
		icon = "\ca\ui\data\map_watertower_ca.paa";
		color[] = {0,.35,.7,1};
		size = 32;
		importance = 1.2 * 16 * .05;
		coefMin = .9;
		coefMax = 4;
	};
	class Waypoint {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0,0,1,1};
		size = 14;
		importance = 2.5 * 16 * .05;
		coefMin = .5;
		coefMax = 4;
	};
	class WaypointCompleted {
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
		color[] = {0,0,1,1};
		size = 14;
		importance = 2.5 * 16 * .05;
		coefMin = .5;
		coefMax = 4;
	};
	class ActiveMarker {
		icon = "";
		color[] = {0,0,1,1};
		size = 14;
		importance = 2.5 * 16 * .05;
		coefMin = .5;
		coefMax = 4;
	};
};
class AHRSCText {
	type =0;
	x = "0";
	y = "0";
	h = "0.037";
	w = "0.3";
	style = 0;
	shadow = 1;
	colorShadow[] = {0,0,0,0.5};
	font = "Zeppelin32";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,1,1,1.0};
	colorBackground[] = {0,0,0,0};
	linespacing = 1;
};
class AHRSCPicture {
	shadow = 0;
	colorText[] = {1,1,1,1};
	x = "0";
	y = "0";
	w = "0.2";
	h = "0.15";
	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {0,0,0,0};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
};
class AHRSCPictureGUI {
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0.38,0.63,0.26,0.75};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	style = "0x30 + 0x100";
	x = "0";
	y = "0";
	w = "0.2";
	h = "0.15";
};
class AHRSCProgress {
	x = "0.344";
	y = "0.619";
	w = "0.313726";
	h = "0.0261438";
	texture = "\ca\ui\data\loadscreen_progressbar_ca.paa";
	colorFrame[] = {0,0,0,0};
	colorBar[] = {1,1,1,1};
};
class AHRSCProgressNotFreeze {
	idc = -1;
	type = 45;
	style = 0;
	x = "0.022059";
	y = "0.911772";
	w = "0.029412";
	h = "0.039216";
	texture = "#(argb,8,8,3)color(0,0,0,0)";
};
class AHRSCActiveText;
class AHRSCStructuredText {
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	x = "0";
	y = "0";
	h = "0.035";
	w = "0.1";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,1,1,1.0};
	shadow = 1;
	class Attributes {
		font = "Zeppelin32";
		color = "#ffffff";
		align = "left";
		shadow = 1;
	};
};
class AHRSCListBox {
	access = 0;
	type = 5;
	w = "0.4";
	h = "0.4";
	rowHeight = 0;
	color[] = {0.95, 0.95, 0.95, 0.5};
	colorText[] = {0.95, 0.95, 0.95, 1};
	coloAHRSCrollbar[] = {0.8, 0.3, 0.3, 1};
	colorSelect[] = {0, 0, 0, 1};
	colorSelect2[] = {0, 0, 0, 1};
	colorSelectBackground[] = {0.7, 0.7, 0.7, 1};
	colorSelectBackground2[] = {0.7, 0.7, 0.7, 1};
	colorDisabled[] = {0.8, 0.3, 0.3, 0.75};
	colorBackground[] = {0,0,0,0.5};
	soundSelect[] = {"",0.1,1};
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	class ScrollBar {
		color[] = {0.8, 0.3, 0.3, 1};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 1};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_left_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_left_active_ca.paa";
		border = "\ca\ui\data\ui_border_frame_ca.paa";
	};
	class ListScrollBar: ScrollBar {};
	style = 16;
	font = "Zeppelin32";
	shadow = 0;
	sizeEx = 0.035;
	period = 0;
	maxHistoryDelay = 0;
	autoScrollRewind = 0;
	autoScrollDelay = 0;
	autoScrollSpeed = 0;
};
class AHRSCSlider {
	access = 0;
	type = 3;
	style = 1024;
	w = "0.3";
	color[] = {1,1,1,0.8};
	colorActive[] = {1,1,1,1};
	shadow = 0;
	h = "0.025";
};
class AHRSCStructuredTextGUI: AHRSCStructuredText {
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	class Attributes: Attributes {
		align = "center";
		valign = "middle";
	};
};
class AHRSCScrollBar {
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.3};
	thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
	arrowEmpty = "\ca\ui\data\ui_arrow_left_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_left_active_ca.paa";
	border = "\ca\ui\data\ui_border_frame_ca.paa";
	shadow = 0;
	scrollSpeed = 0.06;
	width = 0;
	height = 0;
	autoScrollEnabled = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};
class AHRSCControlsgroup {
	type = 15;
	idc = -1;
	style = 16;
	x = "(safeZoneX + (SafezoneW * 0.0163))";
	y = "(safeZoneY + (SafezoneH * 0.132))";
	w = "(SafezoneW  * 0.31)";
	h = "(SafezoneH  * 0.752)";
	class VScrollbar {
		color[] = {0.8, 0.3, 0.3, 1};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 1};
		width = 0.015;
		autoScrollSpeed = -1;
		autoScrollDelay = 0;
		autoScrollRewind = 0;
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_left_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_left_active_ca.paa";
		border = "\ca\ui\data\ui_border_frame_ca.paa";
	};
	class HScrollbar {
		color[] = {1, 1, 1, 1};
		height = 0.028;
	};
	class ScrollBar {
		color[] = {0.8, 0.3, 0.3, 1};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 1};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_left_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_left_active_ca.paa";
		border = "\ca\ui\data\ui_border_frame_ca.paa";
	};
	class Controls {};
};
class AHRSCShortcutButton {
	type = 16;
	x = 0.1;
	y = 0.1;
	class HitZone {
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	class ShortcutPos {
		left = 0.0145;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos {
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	shortcuts[] = {};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] = {0.8784,0.8471,0.651,1};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {1,1,1,1};
	colorBackground2[] = {1,1,1,0.4};
	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	idc = -1;
	style = 0;
	default = 0;
	shadow = 2;
	w = 0.183825;
	h = 0.104575;
	periodFocus = 1.2;
	periodOver = 0.8;
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	period = 0.4;
	font = "Zeppelin32";
	size = 0.03921;
	sizeEx = 0.03921;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	action = "";
	class AttributesImage {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
};
class AHRSCButton {
	access = 0;
    type = 1;
    text = "";
    colorText[] = {1,1,1,.9};
    colorDisabled[] = {0.4,0.4,0.4,0};
    colorBackground[] = {0.75,0.75,0.75,0.8};
    colorBackgroundDisabled[] = {0,0.0,0};
    colorBackgroundActive[] = {0.75,0.75,0.75,1};
    colorFocused[] = {0.75,0.75,0.75,.5};
    colorShadow[] = {0.023529,0,0.0313725,1};
    colorBorder[] = {0.023529,0,0.0313725,1};
    soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
    soundPush[] = {"\ca\ui\data\sound\new1",0,0};
    soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
    soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
    style = 2;
    x = "0";
    y = "0";
    w = "0.055589";
    h = "0.039216";
    shadow = 2;
    font = "Bitstream";
    sizeEx = 0.03921;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};
class AHRSCEdit {
	access = 0;
	type = 2;
	x = "0";
	y = "0";
	h = "0.04";
	w = "0.2";
	colorText[] = {0.95,0.95,0.95,1};
	colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
	autocomplete = "";
	text = "";
	size = 0.2;
	style = "0x00 + 0x40";
	font = "Zeppelin32";
	shadow = 2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorDisabled[] = {1,1,1,0.25};
	canModify = 1;
};
class AHRSCTitle: AHRSCText {
	style = 0;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {0.95,0.95,0.95,1};
};
class W_RscText {
	idc = -1;
	type = 0;
	style = 0x00;
	colorBackground[] = { 1 , 1 , 1 , 0 };
	colorText[] = { 1 , 1 , 1 , 1 };
	font = "Zeppelin32";
	sizeEx = .025;
	h = .25;
	text = "";
};
class W_RscStructuredText {
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {.8784,.8471,.651,1};
	class Attributes {
		font = "Zeppelin32";
		color = "#e0d8a6";
		align = "center";
		shadow = 1;
	};
	x = 0;
	y = 0;
	h = .035;
	w = .1;
	text = "";
	size = .03921;
	shadow = 2;
};
class W_RscList {
	type = 5;
	style = 69;
	idc = -1;
	text = "";
	w = .275;
	h = .04;
	colorSelect[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {1,1,1,1};
	colorSelectBackground[] = {.40, .43, .28, .5};
	colorScrollbar[] = {.2, .2, .2, 1};
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
	wholeHeight = .45;
	rowHeight = .04;
	color[] = {.7, .7, .7, 1};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,.3};
	font = "Zeppelin32";
	sizeEx = .023;
	soundSelect[] = {"",.1,1};
	soundExpand[] = {"",.1,1};
	soundCollapse[] = {"",.1,1};
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	class ScrollBar {
		color[] = {1, 1, 1, 1};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 1};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};
class W_RscPicture {
	idc = -1; 
	type = 0;
	style = 48;
	font = "Zeppelin32";
	sizeEx = .023;	
	colorBackground[] = {};
	colorText[] = {};	
	x = .0; y = .2;
	w = .2; h = .2;	
	text = "";	
}; 
class W_RscButtonBase {
	idc = -1;
	type = 16;
	style = 0;	
	w = .183825;
	h = .104575;	
	color[] = {.95, .95, .95, 1};
	color2[] = {1, 1, 1, .4};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, .4};
	colorDisabled[] = {1, 1, 1, .25};	
	periodFocus = 1.2;
	periodOver = .8;	
	class HitZone {
		left = .004;
		top = .029;
		right = .004;
		bottom = .029;		
	};
	class ShortcutPos {
		left = .004;
		top = .026;
		w = .0392157;
		h = .0522876;		
	};
	class TextPos {	
		left = .05;
		top = .025;
		right = .005;
		bottom = .025;	
	};
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.01.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	textureNoShortcut = "";
	period = .4;
	font = "Zeppelin32";
	size = .023;
	sizeEx = .023;
	text = "";
	
	soundEnter[] = {"\ca\ui\data\sound\mouse2", .09, 1};
	soundPush[] = {"\ca\ui\data\sound\new1", .09, 1};
	soundClick[] = {"\ca\ui\data\sound\mouse3", .07, 1};
	soundEscape[] = {"\ca\ui\data\sound\mouse1", .09, 1};
	
	action = "";
	
	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "1";	
	};
	
	class AttributesImage {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";	
	};
};
class W_RscButton : W_RscButtonBase {

	w = .183825;
	h = .0522876;

	style = 2;

	color[] = {1, 1, 1, 1};
	color2[] = {1, 1, 1, .85};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, .85};
	colorDisabled[] = {1, 1, 1, .4};
	
	class HitZone {	
		left = .002;
		top = .003;
		right = .002;
		bottom = .016;		
	};
	
	class ShortcutPos {	
		left = -.006;
		top = -.007;
		w = .0392157;
		h = .0522876;	
	};
	
	class TextPos {	
		left = .002;
		top = .014;
		right = .002;
		bottom = .005;
	};
	
	animTextureNormal = "\ca\ui\data\igui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\igui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\igui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\igui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\igui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\igui_button_normal_ca.paa";
	animTextureNoShortcut = "\ca\ui\data\igui_button_normal_ca.paa";
	
	class Attributes {	
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "center";
		shadow = "1";		
	};
};

class RscPictureGUI {
    access = 0;
    type = 0;
    idc = -1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {0.38,0.63,0.26,0.75};
    font = "TahomaB";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    style = "0x30 + 0x100";
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
};
class RscTextGUIK {
    type = 0;
    idc = -1;
    style = 0x02;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1, 1, 1, 0.5};
    //color[] = {1, 1, 1, 0.5};
    font = "TahomaB";
    size = 0.03;
    sizeEx = 0.03;
    x = 0;
    y = 0;
    w = 0.1;
    h = 0.2;
};

class RscStructuredText3 {
	access = ReadAndWrite;
	type = 13;
	idc = -1;
	style = 2; 
	font = "Zeppelin33";
	size = "0.025 * safezoneH";
	colorText[] = {1,1,1,1};
	colorBackground[] = {0, 0, 0, 0};
	text = "";
	shadow = 1;
	class Attributes {
		align = "center";
		valign = "middle";	
	};
};
class ZSC_RscScrollBar {
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.3};
	shadow = 0;
	scrollSpeed = 0.06;
	width = 0;
	height = 0;
	autoScrollEnabled = 0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};
class ZSC_RscText {
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	type = 0;
	style = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	font = "Zeppelin32";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	colorText[] = {1, 1, 1, 1.0};
	colorBackground[] = {0, 0, 0, 0};
	linespacing = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};
class ZSC_RscTree {
	style = 2;
	font = "Zeppelin32";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	rowHeight = 0.0439091;
	color[] = {1, 1, 1, 1};
	colorSelect[] = {0.7, 0.7, 0.7, 1};
	colorBackground[] = {0, 0, 0, 0};
	colorSelectBackground[] = {0, 0, 0, 0.5};
	colorBorder[] = {0, 0, 0, 0};
	borderSize = 0;
};
class ZSC_RscTitle : ZSC_RscText {
	style = 0;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {0.95, 0.95, 0.95, 1};
};
class ZSC_RscPicture {
	shadow = 0;
	type = 0;
	style = 48;
	sizeEx = 0.023;
	font = "Zeppelin32";
	colorBackground[] = {};
	colorText[] = {};
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};
class ZSC_RscStructuredText {
	type = 13;
	style = 0;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1, 1, 1, 1.0};
	shadow = 1;
	class Attributes {
		font = "Zeppelin32";
		color = "#ffffff";
		align = "left";
		shadow = 1;
	};
};
class ZSC_RscButton {
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "Zeppelin32";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.7};
	colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorShadow[] = {0,0,0,1};
	colorBorder[] = {0,0,0,1};
	borderSize = 0.0;
	soundPush[] = { "", 0, 1 };
	soundEnter[] = { "", 0, 1 };
	soundClick[] = { "", 0, 1 };
	soundEscape[] = { "", 0, 1 };
	sound[] = { "", 0, 1 };
};
class ZSC_RscShortcutButton {
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	color[] = {1,1,1,1.0};
	colorFocused[] = {1,1,1,1.0};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackground2[] = {1,1,1,1};
	periodFocus = 1.2;
	periodOver = 0.8;
	class HitZone {
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	class ShortcutPos {
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos {
		left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	period = 0.4;
	font = "Zeppelin32";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	action = "";
	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	class AttributesImage {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
	soundPush[] = { "", 0, 1 };
	soundEnter[] = { "", 0, 1 };
	soundClick[] = { "", 0, 1 };
	soundEscape[] = { "", 0, 1 };
	sound[] = { "", 0, 1 };
};
class ZSC_RscButtonMenu : ZSC_RscShortcutButton {
	idc = -1;
	type = 16;
	style = "0x02 + 0xC0";
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[] = {0,0,0,0.8};
	colorBackgroundFocused[] = {1,1,1,1};
	colorBackground2[] = {0.75,0.75,0.75,1};
	color[] = {1,1,1,1};
	colorFocused[] = {0,0,0,1};
	color2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class TextPos {
		left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class ShortcutPos {
		left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
	textureNoShortcut = "";
};
class ZSC_RscListBox {
	style = 16;
	idc = -1;
	type = 5;
	w = 0.275;
	h = 0.04;
	font = "Zeppelin32";
	colorSelect[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0.28,0.28,0.28,0.28};
	colorSelect2[] = {1, 1, 1, 1};
	colorSelectBackground[] = {0.95, 0.95, 0.95, 0.5};
	colorSelectBackground2[] = {1, 1, 1, 0.5};
	colorScrollbar[] = {0.2, 0.2, 0.2, 1};
	wholeHeight = 0.45;
	rowHeight = 0.04;
	color[] = {0.7, 0.7, 0.7, 1};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	sizeEx = 0.023;
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class ListScrollBar: ZSC_RscScrollBar {
		color[] = {1,1,1,1};
		autoScrollEnabled = 1;
	};
	soundPush[] = { "", 0, 1 };
	soundEnter[] = { "", 0, 1 };
	soundClick[] = { "", 0, 1 };
	soundEscape[] = { "", 0, 1 };
	sound[] = { "", 0, 1 };
};
class ZSC_RscEdit {
	type = 2;
	style = 0x00 + 0x40;
	font = "Zeppelin32";
	shadow = 2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorBackground[] = {0, 0, 0, 1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	autocomplete = 1;
	colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
	canModify = 1;
	soundPush[] = { "", 0, 1 };
	soundEnter[] = { "", 0, 1 };
	soundClick[] = { "", 0, 1 };
	soundEscape[] = { "", 0, 1 };
	sound[] = { "", 0, 1 };
};
class AT_Zupa_BlueButton: ZSC_RscButtonMenu {
	colorBackground[] = {0.2,0.75,1,1};
	colorText[] = {1,1,1,1};
	class Attributes {
		align = "center";
	};
};
class RscTitles {
    class EarPlugs {
	    idd = -1;
	    fadeout=0;
	    fadein=0;
	    onLoad = "uiNamespace setVariable ['EarPlugs', _this select 0]";
	    duration = 10e10;
	    name= "EarPlugs";
	    controlsBackground[] = {};
	    objects[] = {};
	    class controls {
		    class EarPlugs : RscStructuredText{
			    idc = 1;
			    size = 0.040;
			    text = "";
			    colorBackground[] = { 0,0,0,0 };
                x = 0.930 * safezoneW + safezoneX;
                y = 0.75 * safezoneH + safezoneY;
                w = 0.2;
                h = 0.2;				
		    };
	    };
    };
    class playerStatusGUI {
        idd = 6900;
        movingEnable = 0;
        duration = 100000;
        name = "statusBorder";
        onLoad = "uiNamespace setVariable ['DAYZ_GUI_display', _this select 0];";
        class ControlsBackground {
			//PLAYER NAME
			class RscStructuredText_1199 : RscStructuredText3 {
				idc = 1199;
				x = 0.250001;
				y = 0.350001;
				w = 0.5;
				h = 0.1;
			};			
			//FOOD BACKGROUND
            class RscPicture_1901: RscPictureGUI {
                idc = 1901;
                text = "\z\addons\dayz_code\gui\status\status_bg.paa";
                x = 0.905 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;//2
                w = 0.075;
                h = 0.10;
            };
			//FOOD BORDER
            class RscPicture_1201: RscPictureGUI {
                idc = 1201;
                text = "\z\addons\dayz_code\gui\status\status_food_border_ca.paa";
                x = 0.905 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;//2
                w = 0.075;
                h = 0.10;
            };
			//BLOOD BACKGROUND
            class RscPicture_1900: RscPictureGUI {
                idc = 1900;
                text = "\z\addons\dayz_code\gui\status\status_bg.paa";
                x = 0.875 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                w = 0.075;
                h = 0.10;
            };
			//BLOOD BORDER
            class RscPicture_1200: RscPictureGUI {
                idc = 1200;
                text = "\z\addons\dayz_code\gui\status\status_blood_border_ca.paa";
                x = 0.875 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                w = 0.075;
                h = 0.10;
            };
//new		    //COMBAT BORDER
		    class RscPicture_1207: RscPictureGUI {
                idc = 1207;
                text = "\z\addons\dayz_code\gui\status\status_combat_border_CA.paa";
                x = 0.965 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                w = 0.075;
                h = 0.10;
            };			
			//THIRST BACKGROUND
            class RscPicture_1902: RscPictureGUI {
                idc = 1902;
                text = "\z\addons\dayz_code\gui\status\status_bg.paa";
                x = 0.935 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                w = 0.075;
                h = 0.10;
            };
			//THIRST BORDER
            class RscPicture_1202: RscPictureGUI {
                idc = 1202;
                text = "\z\addons\dayz_code\gui\status\status_thirst_border_ca.paa";
                x = 0.935 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                w = 0.075;
                h = 0.10;
            };
			//TEMP BACKGROUND
            class RscPicture_1908: RscPictureGUI {
                idc = 1908;
                text = "\z\addons\dayz_code\gui\status\status_bg.paa";
                x = 0.845 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                w = 0.075;
                h = 0.10;
            };
			//TEMP BORDER
            class RscPicture_1208: RscPictureGUI {
                idc = 1208;
                text = "\z\addons\dayz_code\gui\status\status_temp_outside_ca.paa";
                x = 0.845 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                w = 0.075;
                h = 0.10;
            };
			//BROKEN LEG
            class RscPicture_1203: RscPictureGUI {
                idc = 1203;
                text = "\z\addons\dayz_code\gui\status\status_effect_brokenleg.paa";
                x = 0.810 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                w = 0.075;
                h = 0.10;
                colorText[] = {1,1,1,1};
            };
        };
        class Controls {
			//FOOD ICON
            class RscPicture_1301: RscPictureGUI {
                idc = 1301;
                //text = "\z\addons\dayz_code\gui\status\status_food_inside_ca.paa";
                x = 0.905 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;//2
                w = 0.075;
                h = 0.10;
            };
			//BLOOD ICON
            class RscPicture_1300: RscPictureGUI {
                idc = 1300;
                //text = "\z\addons\dayz_code\gui\status\status_blood_inside_ca.paa";
                x = 0.875 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                w = 0.075;
                h = 0.10;
            };
//new			//COMBAT ICON
			class RscPicture_1307: RscPictureGUI {
                idc = 1307;
                text = "\z\addons\dayz_code\gui\status\status_combat_inside_ca.paa";
                x = 0.965 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                w = 0.075;
                h = 0.10;
            };			
			//THIRST ICON
            class RscPicture_1302: RscPictureGUI {
                idc = 1302;
                //text = "\z\addons\dayz_code\gui\status\status_thirst_inside_ca.paa";
                x = 0.935 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                w = 0.075;
                h = 0.10;
            };
			//TEMP ICON
            class RscPicture_1306: RscPictureGUI {
                idc = 1306;
                //text = "\z\addons\dayz_code\gui\status\status_temp_ca.paa";
                x = 0.845 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                w = 0.075;
                h = 0.10;
            };
			//BLOOD ICON - BLEEDING
            class RscPicture_1303: RscPictureGUI {
                idc = 1303;
                text = "\z\addons\dayz_code\gui\status\status_bleeding_ca.paa";
                x = 0.875 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                w = 0.075;
                h = 0.10;
                colorText[] = {1,1,1,0.5};
            };
        };
    };
	
    #define hud_status_idc 4900

    class AsReMixhud {
	    idd = -1;
        fadeout=0;
        fadein=0;
	    duration = 20;
	    name= "AsReMixhud";
	    onLoad = "uiNamespace setVariable ['AsReMixhud', _this select 0]";

	    class controlsBackground {

		    class AsReMixhud_Status:Hw_RscText {
			    idc = hud_status_idc;
			    type = 13;
			    size = 0.040;
                x = safezoneX + (safezoneW -0.35);
        	    y = safezoneY + 0.65 * safezoneW;
			    w = 0.35;
				h = 0.60;
			    colorText[] = {1,1,1,1};
			    lineSpacing = 3;
			    colorBackground[] = {0,0,0,0};
			    text = "";
			    shadow = 2;
			    class Attributes {
				    align = "right";
			    };
		    };
	    };
    };
class DZGMHud_Rsc {
	idd = -1;
	movingEnable = 1;
	enableSimulation = 1;
	enableDisplay = 1;

	onLoad = "uiNamespace setVariable ['dcgHudDisp',_this select 0];";

	duration = 99999999999999999;
	fadein  = 0;
	fadeout = 0;
	class controls {
		class Icons : w_RscStructuredText {
			idc = -1;
			style = 0x00;
			x = .9;
			y = .9;
			w = .9;
			h = .9;
			size = .08;
			colorBackground[] = {0,0,0,0};
			colortext[] = {0,0,0,.7};
			text ="";
			class Attributes {
				align = "left";
			};		
		};
		class PlayerIcon00:Icons {idc = 46300 +  0;};
		class PlayerIcon01:Icons {idc = 46300 +  1;};
		class PlayerIcon02:Icons {idc = 46300 +  2;};
		class PlayerIcon03:Icons {idc = 46300 +  3;};
		class PlayerIcon04:Icons {idc = 46300 +  4;};
		class PlayerIcon05:Icons {idc = 46300 +  5;};
		class PlayerIcon06:Icons {idc = 46300 +  6;};
		class PlayerIcon07:Icons {idc = 46300 +  7;};
		class PlayerIcon08:Icons {idc = 46300 +  8;};
		class PlayerIcon09:Icons {idc = 46300 +  9;};
		class PlayerIcon10:Icons {idc = 46300 + 10;};
		class PlayerIcon11:Icons {idc = 46300 + 11;};
		class PlayerIcon12:Icons {idc = 46300 + 12;};
		class PlayerIcon13:Icons {idc = 46300 + 13;};
		class PlayerIcon14:Icons {idc = 46300 + 14;};
		class PlayerIcon15:Icons {idc = 46300 + 15;};
		class PlayerIcon16:Icons {idc = 46300 + 16;};
		class PlayerIcon17:Icons {idc = 46300 + 17;};
		class PlayerIcon18:Icons {idc = 46300 + 18;};
		class PlayerIcon19:Icons {idc = 46300 + 19;};
		class PlayerIcon20:Icons {idc = 46300 + 20;};
		class PlayerIcon21:Icons {idc = 46300 + 21;};
		class PlayerIcon22:Icons {idc = 46300 + 22;};
		class PlayerIcon23:Icons {idc = 46300 + 23;};
		class PlayerIcon24:Icons {idc = 46300 + 24;};
		class PlayerIcon25:Icons {idc = 46300 + 25;};
		class PlayerIcon26:Icons {idc = 46300 + 26;};
		class PlayerIcon27:Icons {idc = 46300 + 27;};
		class PlayerIcon28:Icons {idc = 46300 + 28;};
		class PlayerIcon29:Icons {idc = 46300 + 29;};
		class PlayerIcon30:Icons {idc = 46300 + 30;};
		class PlayerIcon31:Icons {idc = 46300 + 31;};
		class PlayerIcon32:Icons {idc = 46300 + 32;};
		class PlayerIcon33:Icons {idc = 46300 + 33;};
		class PlayerIcon34:Icons {idc = 46300 + 34;};
		class PlayerIcon35:Icons {idc = 46300 + 35;};
		class PlayerIcon36:Icons {idc = 46300 + 36;};
		class PlayerIcon37:Icons {idc = 46300 + 37;};
		class PlayerIcon38:Icons {idc = 46300 + 38;};
		class PlayerIcon39:Icons {idc = 46300 + 39;};
		class PlayerIcon40:Icons {idc = 46300 + 40;};
	    };
    };
};
class ExtraRc {
    class ItemRadio {
        class GroupManagement {
            text = "Group Management";
            script = "execVM 'Scripts\dzgm\loadGroupManagement.sqf'";
        };
    };
    class ItemMap {
        class locate {
            text = "Locate Vehicles";
            script = "execVM 'Scripts\custom\locate_vehicle.sqf'";
        };
    };	
	class Binocular_Vector {
                class viewdistanceTitle {
                        text = "View Distance:";
                        script = "systemChat('Change View Distance Locally. Click on one of the distance options');";
                };
                class distance600m {
                        text = "600 Meters";
                        script = "setViewDistance 600; systemChat('ViewDistance: 600');";
                };
                class distance800m {
                        text = "800 Meters";
                        script = "setViewDistance 800; systemChat('ViewDistance: 800');";
                };
                class distance1000m {
                        text = "1000 Meters";
                        script = "setViewDistance 1000; systemChat('ViewDistance: 1000');";
                };
                class distance1250m {
                        text = "1250 Meters";
                        script = "setViewDistance 1250; systemChat('ViewDistance: 1250');";
                };
                class distance1500m {
                        text = "1500 Meters";
                        script = "setViewDistance 1500; systemChat('ViewDistance: 1500');";
                };
                class distance2000m {
                        text = "2000 Meters";
                        script = "setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');";
                };
                class distance3000m {
                        text = "3000 Meters";
                        script = "setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');";
                };
				class distance3500m {
                        text = "3500 Meters";
                        script = "setViewDistance 3500; systemChat('ViewDistance: 3500'); systemChat('Warning: Higher the view distance Lower the FPS');";
                };				
        };
        class Binocular {
                class viewdistanceTitle {
                        text = "View Distance:";
                        script = "systemChat('Change View Distance Locally. Click on one of the distance options');";
                };
                class distance600m {
                        text = "600 Meters";
                        script = "setViewDistance 600; systemChat('ViewDistance: 600');";
                };
                class distance800m {
                        text = "800 Meters";
                        script = "setViewDistance 800; systemChat('ViewDistance: 800');";
                };
                class distance1000m {
                        text = "1000 Meters";
                        script = "setViewDistance 1000; systemChat('ViewDistance: 1000');";
                };
                class distance1250m {
                        text = "1250 Meters";
                        script = "setViewDistance 1250; systemChat('ViewDistance: 1250');";
                };
                class distance1500m {
                        text = "1500 Meters";
                        script = "setViewDistance 1500; systemChat('ViewDistance: 1500');";
                };
                class distance2000m {
                        text = "2000 Meters";
                        script = "setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');";
                };
                class distance3000m {
                        text = "3000 Meters";
                        script = "setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');";
                };
				class distance3500m {
                        text = "3500 Meters";
                        script = "setViewDistance 3500; systemChat('ViewDistance: 3500'); systemChat('Warning: Higher the view distance Lower the FPS');";
                };				
        };
};
class GroupManagement {

	idd = 55510;
	movingEnable = 1;
	enableSimulation = 1;
	
	class ControlsBackground {
		
		class MainBG : W_RscPicture {
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";		
			moving = 1;
			x = .0; y = .1;
			w = 1.0; h = .65;
		};
		
		class MainTitle : W_RscText {
			idc = -1;
			text = "Group Management";
			sizeEx = .04;
			shadow = 2;		
			x = .260; y = .112;
			w = .3; h = .05;
		};

		class InviteTitleText : W_RscText {
			idc = -1;
			text = "Players";
			sizeEx = .025;
			shadow = 2;		
			x = .0875; y = .155;
			w = .3; h = .050;
		};

		class GroupTitleText : W_RscText {
			idc = -1;
			text = "Your Group";
			sizeEx = .025;
			shadow = 2;		
			x = .5575; y = .155;
			w = .3; h = .050;
		};

		class InviteText: W_RscStructuredText {
			idc = 55520;
			text = "";
			size = .025;
			x = .255; y = .500;
			w = .235; h = .075;
		};
	};
	
	class controls {

		class PlayerListBox : W_RscList {
			idc = 55511;
			onLBSelChanged = "call playerSelectChange;";
			x = .020; y = .200;
			w = .235; h = .380;
		};
		
		class RefreshButton : W_RscButton {
			idc = -1;
			text = "Refresh";
			onButtonClick = "call updatePlayerList;";
			x = .08; y = .59;
			w = .125; h = .033 * safezoneH;
			color[] = {.1,.95,.1,1};
		};
		
		class GroupListBox : W_RscList {
			idc = 55512;
			x = .490; y = .200;
			w = .235; h = .425;
		};

		class CloseButton : W_RscButton {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;groupManagmentActive = 1;";
			x = .02; y = .68;
			w = .125; h = .033 * safezoneH;
			color[] = {.95,.1,.1,1};
		};

		class InviteButton : W_RscButton {
			idc = 55514;
			text = "Invite";
			onButtonClick = "call inviteToGroup;";
			x = .3075; y = .200;
			w = .125; h = .033 * safezoneH;
			color[] = {.1,.95,.1,1};
		};

		class KickButton : W_RscButton {
			idc = 55515;
			text = "Kick";
			onButtonClick = "call kickFromGroup;";
			x = .3075; y = .250;
			w = .125; h = .033 * safezoneH;
			color[] = {.95,.1,.1,1};
		};

		class DisbandButton : W_RscButton {
			idc = 55516;
			text = "Disband";
			onButtonClick = "call disbandGroup;";
			x = .3075; y = .300;
			w = .125; h = .033 * safezoneH;
			color[] = {.95,.1,.1,1};
		};

		class LeaveButton : W_RscButton {
			idc = 55517;
			text = "Leave Group";
			onButtonClick = "call leaveGroup;";
			x = .3075; y = .400;
			w = .125; h = .033 * safezoneH;
			color[] = {.95,.1,.1,1};
		};

		class AcceptInviteButton : W_RscButton {
			idc = 55518;
			text = "Accept";
			onButtonClick = "call acceptGroupInvite;";
			x = .275; y = .625 - .0255 * safezoneH;
			w = .100; h = .033 * safezoneH;
			color[] = {.1,.95,.1,1};
		};

		class DeclineInviteButton : W_RscButton {
			idc = 55519;
			text = "Decline";
			onButtonClick = "call declineGroupInvite;";
			x = .375; y = .625 - .0255 * safezoneH;
			w = .100; h = .033 * safezoneH;
			color[] = {.95,.1,.1,1};
		};
	};
};
class BankDialog {
	idd = -1;
	movingenable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.35;
			y = 0.2;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.35;
			y = 0.2 + (11 / 250);
			w = 0.3;
			h = 0.6 - (22 / 250);
		};
	};

	class Controls {

		class CashTitle : Life_RscStructuredText
		{
			idc = 2701;
			text = "Cash In Bank";
			colorText[] = {0.8784,0.8471,0.651,1};
			x = 0.39;
			y = 0.26;
			w = 0.3;
			h = 0.2;
		};

		class RscTextT_1005 : RscTextT
		{
			idc = 13002;
			text = "";
			colorText[] = {1,1,1,1};
			x = 0.39;
			y = 0.27;
			w = 0.6;
			h = 0.2;
		};

		class moneyEdit : Life_RscEdit {

		idc = 2702;
		colorText[] = {0.8784,0.8471,0.651,1};
		text = "0";
		sizeEx = 0.030;
		x = 0.4; y = 0.41;
		w = 0.2; h = 0.03;

		};

		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Banking";
			colorText[] = {1,1,1,1};
			x = 0.35;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class WithdrawButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "Withdraw";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[(ctrlText 2702)] spawn BankDialogWithdrawAmount; ((ctrlParent (_this select 0)) closeDisplay 9000);";
			colorText[] = {0.8784,0.8471,0.651,1};
			x = 0.432;
			y = 0.46;
			w = (6 / 40);
			h = (1 / 25);
		};

		class DepositButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "Deposit";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick =  "[(ctrlText 2702)] spawn BankDialogDepositAmount; ((ctrlParent (_this select 0)) closeDisplay 9000);";
			colorText[] = {0.8784,0.8471,0.651,1};
			x = 0.432;
			y = 0.512;
			w = (6 / 40);
			h = (1 / 25);
		};

		class CashTitle3 : Life_RscStructuredText
		{
			idc = 2703;
			text = "Cash on Hand";
			colorText[] = {0.8784,0.8471,0.651,1};
			x = 0.39;
			y = 0.58;
			w = 0.3;
			h = 0.2;
		};

		class RscTextT_1004 : RscTextT
		{
			idc = 13001;
			text = "";
			colorText[] = {1,1,1,1};
			x = 0.39;
			y = 0.59;
			w = 0.6;
			h = 0.2;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
			x = 0.35;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
class GivePlayerDialog {
	idd = -1;
	movingenable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class Life_RscTitleBackground2:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.35;
			y = 0.2;
			w = 0.3;
			h = (1 / 25);
		};
		class MainBackground2:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.35;
			y = 0.2 + (11 / 250);
			w = 0.3;
			h = 0.6 - (22 / 250);
		};
	};
	
	class Controls {

		class CashTitle5 : Life_RscStructuredText
		{
			idc = 2710;
			text = "You Have";
			colorText[] = {0.8784,0.8471,0.651,1};
			x = 0.39;
			y = 0.26;
			w = 0.3;
			h = 0.2;
		};
		class RscTextT_10052 : RscTextT
		{
			idc = 14001;
			text = "";
			colorText[] = {1,1,1,1};
			x = 0.39;
			y = 0.27;
			w = 0.6;
			h = 0.2;
		};
		class moneyEdit2 : Life_RscEdit {
		
			idc = 14000;
			colorText[] = {0.8784,0.8471,0.651,1};
			text = "1";
			sizeEx = 0.030;
			x = 0.4; y = 0.41;
			w = 0.2; h = 0.03;
		
		};
		class Title2 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Transfer Cash";
			colorText[] = {1,1,1,1};
			x = 0.35;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		class DepositButton2 : life_RscButtonMenu 
		{
			idc = -1;
			text = "Give Cash";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[(ctrlText 14000)] spawn GivePlayerAmount; ((ctrlParent (_this select 0)) closeDisplay 9000);";
			colorText[] = {0.8784,0.8471,0.651,1};
			x = 0.432;
			y = 0.512;
			w = (6 / 40);
			h = (1 / 25);
		};
		class RscTextT_10005 : RscTextT
		{
			idc = 14003;
			text = "";
			colorText[] = {0.8784,0.8471,0.651,1};
			x = 0.39;
			y = 0.58;
			w = 0.3;
			h = 0.2;
		};
		class CloseButtonKey2 : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
			x = 0.35;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
class CurrencyPlayerDialog {
	idd = -1;
	movingenable = 0;
	enableSimulation = 1;
	class controlsBackground {
		class CurrencyTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};	idc = -1;
			x = 0.35;
			y = 0.2;
			w = 0.3;
			h = (1 / 25);
		};
		class CurrencyMainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};	idc = -1;
			x = 0.35;
			y = 0.2 + (11 / 250);
			w = 0.3;
			h = 0.6 - (22 / 250);
		};
	};
	class Controls {
		class CurrencyCashTitle : RscTextT {
			idc = 15007;
			text = "";
			colorText[] = {1,1,1,1};	x = 0.39;
			y = 0.23;
			w = 0.3;
			h = 0.15;
		};
		class CurrencyBankTitle : RscTextT {
			idc = 15004;
			text = "";
			colorText[] = {1,1,1,1};	x = 0.39;
			y = 0.27;
			w = 0.6;
			h = 0.15;
		};
		class CurrencyAmountEdit : Life_RscEdit {
		
			idc = 15003;
			colorText[] = {0.8784,0.8471,0.651,1};	text = "";
			sizeEx = 0.030;
			x = 0.4; y = 0.41;
			w = 0.2; h = 0.03;
		
		};
		class CurrencyTitleText : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};	idc = -1;
			text = "Currency Transfer";
			colorText[] = {1,1,1,1};	x = 0.35;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		class CurrencyAddCashButton : life_RscButtonMenu {
			idc = -1;
			text = "Add cash";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};	onButtonClick = "[(ctrlText 15003),currencyTarget,'add','cash'] spawn CurrencyTransferMoney; ((ctrlParent (_this select 0)) closeDisplay 9000);";
			colorText[] = {0.8784,0.8471,0.651,1};	x = 0.4;
			y = 0.450; // 0.045 = full
			w = (6 / 30);
			h = (1 / 25); 
		};
		class CurrencyAddBankButton : life_RscButtonMenu {
			idc = -1;
			text = "Add bank";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};	onButtonClick = "[(ctrlText 15003),currencyTarget,'add','bank'] spawn CurrencyTransferMoney; ((ctrlParent (_this select 0)) closeDisplay 9000);";
			colorText[] = {0.8784,0.8471,0.651,1};	x = 0.4;
			y = 0.495;
			w = (6 / 30);
			h = (1 / 25);
		};
		class CurrencyRemoveCashButton : life_RscButtonMenu {
			idc = -1;
			text = "Remove cash";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};	onButtonClick = "[(ctrlText 15003),currencyTarget,'remove','cash'] spawn CurrencyTransferMoney; ((ctrlParent (_this select 0)) closeDisplay 9000);";
			colorText[] = {0.8784,0.8471,0.651,1};	x = 0.4;
			y = 0.540;
			w = (6 / 30);
			h = (1 / 25);
		};
		class CurrencyRemoveBankButton : life_RscButtonMenu {
			idc = -1;
			text = "Remove bank";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};	onButtonClick = "[(ctrlText 15003),currencyTarget,'remove','bank'] spawn CurrencyTransferMoney; ((ctrlParent (_this select 0)) closeDisplay 9000);";
			colorText[] = {0.8784,0.8471,0.651,1};	x = 0.4;
			y = 0.585;
			w = (6 / 30);
			h = (1 / 25);
		};
		class CurrencyTargetTitle : RscTextT {
			idc = 15006;
			text = "";
			sizeEx = 0.030;
			colorText[] = {0.8784,0.8471,0.651,1};	x = 0.39;
			y = 0.58;
			w = 0.3;
			h = 0.2;
		};
		class CurrencyCloseButton : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
			x = 0.35;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
class PlotManagement {
	idd = 711194;
	onLoad = "uiNamespace setVariable ['PlotManagement', _this select 0]";
	class Controls {
		class RscText_7000: RscTextT {
			idc = 7000;
			x = 0.30 * safezoneW + safezoneX;
			y = 0.30 * safezoneH + safezoneY;
			w = 0.30 * safezoneW;
			h = 0.5 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};	
		class RscListbox_7001: RscListbox {
			idc = 7001;
			x = 0.31* safezoneW + safezoneX;
			y = 0.41 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.30 * safezoneH;
			soundSelect[] = {"",0.1,1};
			colorBackground[] = {0.1,0.1,0.1,0.8};
		};
		class RscListbox_7002: RscListbox {
			idc = 7002;
			x = 0.45 * safezoneW + safezoneX;
			y = 0.41* safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.30 * safezoneH;
			soundSelect[] = {"",0.1,1};
			colorBackground[] = {0.1,0.1,0.1,0.8};
		};
		class RscShortcutButton_7004: RscShortcutButton {
			idc = 7004;
			text = "Add";
			x = 0.33 * safezoneW + safezoneX;
			y = 0.70 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.06 * safezoneH;
			onButtonClick = "[(lbCurSel 7001)] call PlotAddFriend;";
		};
		class RscShortcutButton_7005: RscShortcutButton {
			idc = 7005;
			text = "Delete";
			x = 0.47 * safezoneW + safezoneX;
			y = 0.70 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.06 * safezoneH;
			onButtonClick = "[(lbCurSel 7002)] call PlotRemoveFriend;";
		};	
		class RscShortcutButton_7006: RscShortcutButton {
			idc = 7006;
			text = "Close";
			x = 0.40 * safezoneW + safezoneX;
			y = 0.74 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.06 * safezoneH;
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
		};		
		class RscText_7007: RscTextT {
			idc = 7007;
			text = "Plot Management";
			x = 0.30 * safezoneW + safezoneX;
			y = 0.30 * safezoneH + safezoneY;
			w = 0.30 * safezoneW;
			h = 0.05 * safezoneH;		
			colorBackground[] = {0,0,0,0.8};	
			colorText[] = {1,1,1,1};			
		};
		class RscText_7008: RscTextT {
			idc = 7008;
			text = "Humans Nearby";
			x = 0.31 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
		};		
		class RscText_7003: RscTextT {
			idc = 7003;
			text = "PlotFriends";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
		};
	};
};
class ClassDialog {
	idd = -1;
	movingenable = 0;
	class controlsBackground {
		class ClassBackground: RscText {
			text = "";
			x = .31 * safezoneW + safezoneX;
			y = .3 * safezoneH + safezoneY;
			w = .138504 * safezoneW;
			h = .325 * safezoneH;
			colorBackground[] = {.3,.3,.3,1};
			fixedWidth = 0;
		};
	};
	class Controls {
		class ClassSelect: RscText {
			text = "Class Selection";
			x = .31 * safezoneW + safezoneX;
			y = .26 * safezoneH + safezoneY;
			w = .138504 * safezoneW;
			h = .04025 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {.384,.702,.886,.8};
			fixedWidth = 0;
			shadow = 1;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
		};
		class ClassList {
			idc = 8888;
			x = .31 * safezoneW + safezoneX;
			y = .303 * safezoneH + safezoneY;
			w = .138504 * safezoneW;
			h = .25 * safezoneH;
			autoScrollDelay = 5;
			autoScrollRewind = 0;
			autoScrollSpeed = -1;
			colorSelect[] = {};
			colorSelectBackground[] = {.5,.5,.5,1};
			colorText[] = {.88,.88,.88,1};
			font = "Zeppelin32";
			maxHistoryDelay = 1;
			onLBSelChanged = "call classPreview;";
			rowHeight = .04;
			class ScrollBar {
				arrowEmpty = "\ca\ui\data\arrow_up_ca.paa";
				arrowFull = "\ca\ui\data\arrow_up_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
				color[] = {.5,.5,.5,.5};
				colorActive[] = {.5,.5,.5,.3};
				colorDisabled[] = {.5,.5,.5,.1};
				shadow = 0;
				thumb = "";
			};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
			soundSelect[] = {"",.1,1};
			style = 16;
			type = 5;
		};
		class ClassButton {
			idc = 8889;
			text = "Select Class";
			x = .324 * safezoneW + safezoneX;
			y = .567 * safezoneH + safezoneY;
			w = .109 * safezoneW;
			h = .044 * safezoneH;
			action = "call classPick;";
			borderSize = 0;
			colorBackground[] = {.4,.4,.4,1};
			colorBackgroundActive[] = {.5,.5,.5,1};
			colorBackgroundDisabled[] = {.2,.2,.2,1};
			colorBorder[] = {.88,.88,.88,1};		
			colorDisabled[] = {.2,.2,.2,1};
			colorFocused[] = {.4,.4,.4,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = .002;
			offsetPressedY = .002;
			offsetX = .003;
			offsetY = .003;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
			soundClick[] = {"\ca\ui\data\sound\onclick",.07,1};
			soundEnter[] = {"\ca\ui\data\sound\onover",.09,1};
			soundEscape[] = {"\ca\ui\data\sound\onescape",.09,1};
			soundPush[] = {"\ca\ui\data\sound\new1",0,0};			
			style = 2;
			type = 1;
		};
	};
};
class HaloDialog {
	idd = -1;
	movingenable = 0;
	class controlsBackground {
		class HaloBackground: RscText {
			text = "";
			x = .370287 * safezoneW + safezoneX;
			y = .338822 * safezoneH + safezoneY;
			w = .260299 * safezoneW;
			h = .3 * safezoneH;
			colorBackground[] = {.3,.3,.3,1};
			fixedWidth = 0;
		};
	};
	class Controls {
		class HaloSelect: RscText {
			text = "Spawn Type Selection";
			x = .370288 * safezoneW + safezoneX;
			y = .289 * safezoneH + safezoneY;
			w = .260299 * safezoneW;
			h = .05 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {.384,.702,.886,.8};
			fixedWidth = 0;
			shadow = 1;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
		};
		class HaloAir: RscPicture {
			fixedWidth = 0;
			text = "\ca\ui\data\iconplane_ca.paa";
			x = .403107 * safezoneW + safezoneX;
			y = .386064 * safezoneH + safezoneY;
			w = .0738056 * safezoneW;
			h = .0873141 * safezoneH;
		};
		class HaloGround: RscPicture {
			fixedWidth = 0;
			text = "\ca\ui\data\icontruck_ca.paa";
			x = .524484 * safezoneW + safezoneX;
			y = .386064 * safezoneH + safezoneY;
			w = .0732848 * safezoneW;
			h = .0868511 * safezoneH;
		};
		class HaloButtonAir {
			idc = -1;
			text = "Air";
			x = .402585 * safezoneW + safezoneX;
			y = .523 * safezoneH + safezoneY;
			w = .0743267 * safezoneW;
			h = .0877774 * safezoneH;
			action = "uiNamespace setVariable ['haloChoice',1];";
			borderSize = 0;
			colorBackground[] = {.4,.4,.4,1};
			colorBackgroundActive[] = {.5,.5,.5,1};
			colorBackgroundDisabled[] = {.2,.2,.2,1};
			colorBorder[] = {.88,.88,.88,1};		
			colorDisabled[] = {.2,.2,.2,1};
			colorFocused[] = {.4,.4,.4,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = .002;
			offsetPressedY = .002;
			offsetX = .003;
			offsetY = .003;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
			soundClick[] = {"\ca\ui\data\sound\onclick",.07,1};
			soundEnter[] = {"\ca\ui\data\sound\onover",.09,1};
			soundEscape[] = {"\ca\ui\data\sound\onescape",.09,1};
			soundPush[] = {"\ca\ui\data\sound\new1",0,0};			
			style = 2;
			type = 1;
		};
		class HaloButtonGround {
			idc = -1;
			text = "Ground";
			x = .524484 * safezoneW + safezoneX;
			y = .523 * safezoneH + safezoneY;
			w = .0743267 * safezoneW;
			h = .0877774 * safezoneH;
			action = "uiNamespace setVariable ['haloChoice',0];";
			borderSize = 0;
			colorBackground[] = {.4,.4,.4,1};
			colorBackgroundActive[] = {.5,.5,.5,1};
			colorBackgroundDisabled[] = {.2,.2,.2,1};
			colorBorder[] = {.88,.88,.88,1};		
			colorDisabled[] = {.2,.2,.2,1};
			colorFocused[] = {.4,.4,.4,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = .002;
			offsetPressedY = .002;
			offsetX = .003;
			offsetY = .003;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
			soundClick[] = {"\ca\ui\data\sound\onclick",.07,1};
			soundEnter[] = {"\ca\ui\data\sound\onover",.09,1};
			soundEscape[] = {"\ca\ui\data\sound\onescape",.09,1};
			soundPush[] = {"\ca\ui\data\sound\new1",0,0};			
			style = 2;
			type = 1;
		};
	};
};
class SpawnDialog {
	idd = 88890;
	movingenable = 0;
	class controlsBackground {
		class SpawnBackground: RscText {
			text = "";
			x = .305217 * safezoneW + safezoneX;
			y = .269348 * safezoneH + safezoneY;
			w = .1185 * safezoneW;
			h = .4644 * safezoneH;
			colorBackground[] = {.3,.3,.3,1};
			fixedWidth = 0;
		};
	};
	class Controls {
		class SpawnSelect: RscText {
			text = "Spawn Selection";
			x = .305218 * safezoneW + safezoneX;
			y = .269348 * safezoneH + safezoneY;
			w = .1185 * safezoneW;
			h = .0405354 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {.384,.702,.886,.8};
			fixedWidth = 0;
			shadow = 1;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
		};
		class SpawnList {
			idc = 8888;
			x = .305217 * safezoneW + safezoneX;
			y = .314737 * safezoneH + safezoneY;
			w = .1185 * safezoneW;
			h = .33 * safezoneH;
			autoScrollDelay = 5;
			autoScrollRewind = 0;
			autoScrollSpeed = -1;
			colorSelect[] = {};
			colorSelectBackground[] = {.5,.5,.5,1};
			colorText[] = {.88,.88,.88,1};
			font = "Zeppelin32";
			maxHistoryDelay = 1;
			onLBSelChanged = "call moveMap;";
			rowHeight = .04;
			class ScrollBar {
				arrowEmpty = "\ca\ui\data\arrow_up_ca.paa";
				arrowFull = "\ca\ui\data\arrow_up_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
				color[] = {.5,.5,.5,.5};
				colorActive[] = {.5,.5,.5,.3};
				colorDisabled[] = {.5,.5,.5,.1};
				shadow = 0;
				thumb = "";
			};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
			soundSelect[] = {"",.1,1};
			style = 16;
			type = 5;
		};
		class SpawnButton {
			idc = 8889;
			text = "Select Spawn";
			x = .318 * safezoneW + safezoneX;
			y = .6565 * safezoneH + safezoneY;
			w = .092 * safezoneW;
			h = .067 * safezoneH;
			action = "call spawnPick;";
			borderSize = 0;
			colorBackground[] = {.4,.4,.4,1};
			colorBackgroundActive[] = {.5,.5,.5,1};
			colorBackgroundDisabled[] = {.2,.2,.2,1};
			colorBorder[] = {.88,.88,.88,1};		
			colorDisabled[] = {.2,.2,.2,1};
			colorFocused[] = {.4,.4,.4,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "Zeppelin32";
			offsetPressedX = .002;
			offsetPressedY = .002;
			offsetX = .003;
			offsetY = .003;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
			soundClick[] = {"\ca\ui\data\sound\onclick",.07,1};
			soundEnter[] = {"\ca\ui\data\sound\onover",.09,1};
			soundEscape[] = {"\ca\ui\data\sound\onescape",.09,1};
			soundPush[] = {"\ca\ui\data\sound\new1",0,0};			
			style = 2;
			type = 1;
		};
		class SpawnMap {
			idc = 8890;
			x = .42315 * safezoneW + safezoneX;
			y = .269348 * safezoneH + safezoneY;
			w = .293691 * safezoneW;
			h = .463997 * safezoneH;
			moveOnEdges = 0;
			shadow = 0;
			maxSatelliteAlpha = .85;
			alphaFadeStartScale = .35;
			alphaFadeEndScale = .4;
			colorOutside[] = {0,0,0,1};			
			style = 48;
			font = "EtelkaNarrowMediumPro";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
			type = 101;
			colorBackground[] = {.8,.8,.8,1};
			colorText[] = {0,0,0,1};
			colorRailway[] = {.5,.5,.5,.5};
			colorSea[] = {.56,.8,.98,.5};
			colorForest[] = {.6,.8,.2,.5};
			colorRocks[] = {.5,.5,.5,.5};
			colorCountlines[] = {.65,.45,.27,.5};
			colorMainCountlines[] = {.65,.45,.27,1};
			colorCountlinesWater[] = {0,.53,1,.5};
			colorMainCountlinesWater[] = {0,.53,1,1};
			colorForestBorder[] = {.4,.8,0,1};
			colorRocksBorder[] = {.5,.5,.5,1};
			colorPowerLines[] = {0,0,0,1};
			colorNames[] = {0,0,0,1};
			colorInactive[] = {1,1,1,.5};
			colorLevels[] = {.286,.177,.094,.5};
			fontLabel = "TahomaB";
			sizeExLabel = .04;
			fontGrid = "TahomaB";
			sizeExGrid = .04;
			fontUnits = "TahomaB";
			sizeExUnits = .04;
			fontNames = "TahomaB";
			sizeExNames = .04;
			fontInfo = "TahomaB";
			sizeExInfo = .04;
			fontLevel = "TahomaB";
			sizeExLevel = .04;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			stickX[] = {.2,{"Gamma",1,1.5}};
			stickY[] = {.2,{"Gamma",1,1.5}};
			ptsPerSquareSea = 6;
			ptsPerSquareTxt = 8;
			ptsPerSquareCLn = 8;
			ptsPerSquareExp = 8;
			ptsPerSquareCost = 8;
			ptsPerSquareFor = "4.0f";
			ptsPerSquareForEdge = "10.0f";
			ptsPerSquareRoad = 2;
			ptsPerSquareObj = 10;
			showCountourInterval = 0;
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)";
			onMouseButtonDown = "mouseButtonDown = _this Select 1";
			onMouseButtonUp = "mouseButtonUp = _this Select 1";				
			class CustomMark {
				icon = "\ca\ui\data\map_waypoint_ca.paa";
				color[] = {0,0,1,1};
				size = 18;
				importance = 1;
				coefMin = 1;
				coefMax = 1;
			};
			class Bunker {
				icon = "\ca\ui\data\map_bunker_ca.paa";
				color[] = {0,0,1,1};
				size = 14;
				importance = 1.5 * 14 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Bush {
				icon = "\ca\ui\data\map_bush_ca.paa";
				color[] = {.55,.64,.43,1};
				size = 14;
				importance = .2 * 14 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class BusStop {
				icon = "\ca\ui\data\map_busstop_ca.paa";
				color[] = {0,0,1,1};
				size = 10;
				importance = 1 * 10 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Command {
				icon = "#(argb,8,8,3)color(1,1,1,1)";
				color[] = {0,.9,0,1};
				size = 18;
				importance = 1;
				coefMin = 1;
				coefMax = 1;
			};
			class Cross {
				icon = "\ca\ui\data\map_cross_ca.paa";
				color[] = {0,0,1,1};
				size = 16;
				importance = .7 * 16 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Fortress {
				icon = "\ca\ui\data\map_bunker_ca.paa";
				color[] = {0,0,1,1};
				size = 16;
				importance = 2 * 16 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Fuelstation {
				icon = "#(argb,8,8,3)color(0,0,0,1)";
				color[] = {0,0,0,1};
				size = 16;
				importance = 2 * 16 * .05;
				coefMin = .75;
				coefMax = 4;
			};
			class Fountain {
				icon = "\ca\ui\data\map_fountain_ca.paa";
				color[] = {0,.35,.7,1};
				size = 12;
				importance = 1 * 12 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Hospital {
				icon = "\ca\ui\data\map_hospital_ca.paa";
				color[] = {.78,0,.05,1};
				size = 16;
				importance = 2 * 16 * .05;
				coefMin = .5;
				coefMax = 4;
			};
			class Chapel {
				icon = "\ca\ui\data\map_chapel_ca.paa";
				color[] = {0,0,1,1};
				size = 16;
				importance = 1 * 16 * .05;
				coefMin = .9;
				coefMax = 4;
			};
			class Church {
				icon = "\ca\ui\data\map_church_ca.paa";
				color[] = {0,0,1,1};
				size = 16;
				importance = 2 * 16 * .05;
				coefMin = .9;
				coefMax = 4;
			};
			class Legend {
				x = "SafeZoneX";
				y = "SafeZoneY";
				w = .34;
				h = .152;
				font = "Zeppelin32";
				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .6)";
				colorBackground[] = {0,0,0,1};
				color[] = {0,0,0,1};
			};
			class Lighthouse {
				icon = "\ca\ui\data\map_lighthouse_ca.paa";
				color[] = {.78,0,.05,1};
				size = 20;
				importance = 3 * 16 * .05;
				coefMin = .9;
				coefMax = 4;
			};
			class Quay {
				icon = "\ca\ui\data\map_quay_ca.paa";
				color[] = {0,0,1,1};
				size = 16;
				importance = 2 * 16 * .05;
				coefMin = .5;
				coefMax = 4;
			};
			class Rock {
				icon = "\ca\ui\data\map_rock_ca.paa";
				color[] = {0,0,1,1};
				size = 12;
				importance = .5 * 12 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Ruin {
				icon = "\ca\ui\data\map_ruin_ca.paa";
				color[] = {.78,0,.05,1};
				size = 16;
				importance = 1.2 * 16 * .05;
				coefMin = 1;
				coefMax = 4;
			};
			class SmallTree {
				icon = "\ca\ui\data\map_smalltree_ca.paa";
				color[] = {.55,.64,.43,1};
				size = 12;
				importance = .6 * 12 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Stack {
				icon = "\ca\ui\data\map_stack_ca.paa";
				color[] = {0,0,1,1};
				size = 20;
				importance = 2 * 16 * .05;
				coefMin = .9;
				coefMax = 4;
			};
			class Task {
				icon = "\ca\ui\data\ui_taskstate_current_CA.paa";
				iconCreated = "\ca\ui\data\ui_taskstate_new_CA.paa";
				iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
				iconDone = "\ca\ui\data\ui_taskstate_done_CA.paa";
				iconFailed = "\ca\ui\data\ui_taskstate_failed_CA.paa";
				color[] = {.863,.584,.0,1};
				colorCreated[] = {.95,.95,.95,1};
				colorCanceled[] = {.606,.606,.606,1};
				colorDone[] = {.424,.651,.247,1};
				colorFailed[] = {.706,.0745,.0196,1};
				size = 10;
				coefMin = 1;
				coefMax = 4;
				importance = 1;
			};
			class Tree {
				icon = "\ca\ui\data\map_tree_ca.paa";
				color[] = {.55,.64,.43,1};
				size = 12;
				importance = .9 * 16 * .05;
				coefMin = .25;
				coefMax = 4;
			};
			class Tourism {
				icon = "\ca\ui\data\map_tourism_ca.paa";
				color[] = {.78,0,.05,1};
				size = 16;
				importance = 1 * 16 * .05;
				coefMin = .7;
				coefMax = 4;
			};
			class Transmitter {
				icon = "\ca\ui\data\map_transmitter_ca.paa";
				color[] = {0,0,1,1};
				size = 20;
				importance = 2 * 16 * .05;
				coefMin = .9;
				coefMax = 4;
			};
			class ViewTower {
				icon = "\ca\ui\data\map_viewtower_ca.paa";
				color[] = {0,0,1,1};
				size = 16;
				importance = 2.5 * 16 * .05;
				coefMin = .5;
				coefMax = 4;
			};
			class Watertower {
				icon = "\ca\ui\data\map_watertower_ca.paa";
				color[] = {0,.35,.7,1};
				size = 32;
				importance = 1.2 * 16 * .05;
				coefMin = .9;
				coefMax = 4;
			};
			class Waypoint {
				icon = "\ca\ui\data\map_waypoint_ca.paa";
				color[] = {0,0,1,1};
				size = 14;
				importance = 2.5 * 16 * .05;
				coefMin = .5;
				coefMax = 4;
			};
			class WaypointCompleted {
				icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
				color[] = {0,0,1,1};
				size = 14;
				importance = 2.5 * 16 * .05;
				coefMin = .5;
				coefMax = 4;
			};
			class ActiveMarker {
				icon = "";
				color[] = {0,0,1,1};
				size = 14;
				importance = 2.5 * 16 * .05;
				coefMin = .5;
				coefMax = 4;
			};
		};
	};
};
class AdvancedTrading {
	idd = 711197;
	onLoad = "uiNamespace setVariable ['AdvancedTrading', _this select 0]";
	class Controls {
		class RscText_ATBackground1: ZSC_RscText {
			idc = -1;
			x = 0.20 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.40 * safezoneW;
			h = 0.70 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
		class RscText_ATBackground2: ZSC_RscText {
			idc = -1;
			x = 0.60 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.20 * safezoneW;
			h = 0.70 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class RscText_AT2: ZSC_RscText {
			idc = -1;
			text = "Advanced Trading";
			x = 0.20 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.60 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0.2,0.75,1,1};
			colorText[] = {1,1,1,1};
		};
		class RscText_Zupa_1: ZSC_RscText {
			idc = 7408;
			text = "Selling from gear.";
			x = 0.21 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.38 * safezoneW;
			h = 0.05 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class ZSC_RscButtonMenu_Z1: AT_Zupa_BlueButton {
			idc = -1;
			text =  "Gear";
			x = 0.21 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			onButtonClick = "[2] call Z_getContainer;";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
		};
		class ZSC_RscButtonMenu_Z2: AT_Zupa_BlueButton {
			idc = -1;
			text =  "Backpack";
			x = 0.31 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			onButtonClick = "[0] call Z_getContainer;";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
		};
		class ZSC_RscButtonMenu_Z3: AT_Zupa_BlueButton {
			idc = -1;
			text =  "Vehicle";
			x = 0.41 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			onButtonClick = "[1] call Z_getContainer;";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
		};
		class ZSC_RscButtonMenu_Z4: AT_Zupa_BlueButton {
			idc = 7416;
			text =  "Sell";
			x = 0.51 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			onButtonClick = "call Z_ChangeBuySell;";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
		};
		class RscText_AT6: ZSC_RscText {
			idc = 7412;
			text = "";
			x = 0.21 * safezoneW + safezoneX;
			y = 0.30 * safezoneH + safezoneY;
			w = 0.30 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_AT7: ZSC_RscText {
			idc = 7413;
			text = "";
			x = 0.21 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.30 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_AT8: ZSC_RscText {
			idc = -1;
			text = "Inventory";
			x = 0.21 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_AT9: ZSC_RscText {
			idc = 7409;
			text = "Selling";
			x = 0.46 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscBackgroundText_Zupa_1: ZSC_RscText {
			idc = -1;
			text = "";
			x = 0.21* safezoneW + safezoneX;
			y = 0.41 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.30 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class RscBackgroundText_Zupa_2: ZSC_RscText {
			idc = -1;
			text = "";
			x = 0.46 * safezoneW + safezoneX;
			y = 0.41* safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.30 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class RscListbox_AT10: ZSC_RscListBox {
			idc = 7401;
			type = 5;
			idcLeft = -1;
			idcRight = -1;
			x = 0.21* safezoneW + safezoneX;
			y = 0.41 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.30 * safezoneH;
			soundSelect[] = {"",0.1,1};
			colorBackground[] = {0.1,0.1,0.1,0.8};
			onLBSelChanged = "['sellable',(lbCurSel 7401)] call Z_getItemInfo";
			class ListScrollBar: ZSC_RscScrollBar {};
			class ScrollBar {
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				shadow = 0;
				thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
				arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
				arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
			};
		};
		class RscListbox_AT11: ZSC_RscListBox {
			idc = 7402;
			x = 0.46 * safezoneW + safezoneX;
			y = 0.41* safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.30 * safezoneH;
			soundSelect[] = {"",0.1,1};
			colorBackground[] = {0.1,0.1,0.1,0.8};
			onLBSelChanged = "['selling',(lbCurSel 7402)] call Z_getItemInfo";
			class ListScrollBar: ZSC_RscScrollBar {};
			class ScrollBar {
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				shadow = 0;
				thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
				arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
				arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
			};
		};
		class RscListbox_AT20: ZSC_RscListBox {
			idc = 7421;
			type = 5;
			idcLeft = -1;
			idcRight = -1;
			x = 0.21* safezoneW + safezoneX;
			y = 0.41 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.30 * safezoneH;
			soundSelect[] = {"",0.1,1};
			colorBackground[] = {0.1,0.1,0.1,0.8};
			onload = "ctrlShow [_this,false]";
			onLBSelChanged = "['buyable',(lbCurSel 7421)] call Z_getItemInfo";
			class ListScrollBar: ZSC_RscScrollBar {};
			class ScrollBar {
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				shadow = 0;
				thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
				arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
				arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
			};
		};
		class RscListbox_AT21: ZSC_RscListBox {
			idc = 7422;
			x = 0.46 * safezoneW + safezoneX;
			y = 0.41* safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.30 * safezoneH;
			soundSelect[] = {"",0.1,1};
			colorBackground[] = {0.1,0.1,0.1,0.8};
			onload = "ctrlShow [_this,false]";
			onLBSelChanged = "['buying',(lbCurSel 7422)] call Z_getItemInfo";
			class ScrollBar {
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				shadow = 0;
				thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
				arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
				arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
			};
		};
		class RscSearchBackground: ZSC_RscText {
			idc = -1;
			x = 0.21 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class Zupa_Filter_Edit : ZSC_RscEdit {
			idc = 7444;
			colorText[] = {1,1,1,1};
			text = "";
			sizeEx = 0.030;
			x = 0.21 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.04;
		};
		class ZSC_RscButtonMenu_ATTFilter: AT_Zupa_BlueButton {
			idc = -1;
			text = "Filter";
			x = 0.21 * safezoneW + safezoneX;
			y = 0.77 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			onButtonClick = "[(ctrlText 7444)] call Z_filterList;";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
		};
		class ZSC_RscButtonMenu_AT12: AT_Zupa_BlueButton {
			idc = 7430;
			text =  " > ";
			x = 0.36 * safezoneW + safezoneX;
			y = 0.41 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			onButtonClick = "[(lbCurSel 7401)] call Z_pushItemToList;";
			colorBackground[] = {1,1,1,1};
    	color[] = {0,0,0,1};
		};
		class ZSC_RscButtonMenu_AT14: AT_Zupa_BlueButton {
			idc = 7431;
			text = " >> ";
			x = 0.36 * safezoneW + safezoneX;
			y = 0.49 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			onButtonClick = "call Z_pushAllToList;";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
		};
		class ZSC_RscButtonMenu_AT13: AT_Zupa_BlueButton {
			idc = 7432;
			text = " < ";
			x = 0.36 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			onButtonClick = "[(lbCurSel 7402)] call Z_removeItemFromList;";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
		};
		class ZSC_RscButtonMenu_AT15: AT_Zupa_BlueButton {
			idc = 7433;
			text = " << ";
			x = 0.36 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			onButtonClick = "call Z_removeAllToList;";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
		};
		class ZSC_RscButtonMenu_ATT1: AT_Zupa_BlueButton {
			idc = 7440;
			text = " > ";
			x = 0.36 * safezoneW + safezoneX;
			y = 0.41 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			onButtonClick = "[(lbCurSel 7421),(ctrlText 7441)] call Z_toBuyingList;";
			onload = "ctrlShow [_this,false]";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
		};
		class Zupa_Ammount_Edit : ZSC_RscEdit {
			idc = 7441;
			colorText[] = {1,1,1,1};
			text = "1";
			sizeEx = 0.030;
			x = 0.36 * safezoneW + safezoneX;
			y = 0.49 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.03;
			onload = "ctrlShow [_this,false]";
		};
		class ZSC_RscButtonMenu_ATT3: AT_Zupa_BlueButton {
			idc = 7442;
			text = " < ";
			x = 0.36 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			onButtonClick = "[(lbCurSel 7422)] call Z_removeItemFromBuyingList;";
			onload = "ctrlShow [_this,false]";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
		};
		class ZSC_RscButtonMenu_ATT4: AT_Zupa_BlueButton {
			idc = 7443;
			text = " << ";
			x = 0.36 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			onButtonClick = "call Z_removeAllFromBuyingList;";
			onload = "ctrlShow [_this,false]";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
		};
		class RscText_ATT8: ZSC_RscText {
			idc = 7404;
			text = "0/0/0";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
			onload = "ctrlShow [_this,false]";
		};
		class RscSearchBackground2: ZSC_RscText {
			idc = -1;
			text = "";
			x = 0.46 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class RscText_AT18: ZSC_RscText {
			idc = 7410;
			text = "Nothing";
			x = 0.46 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class ZSC_RscButtonMenu_AT16: AT_Zupa_BlueButton {
			idc = 7435;
			text = "Sell";
			x = 0.46 * safezoneW + safezoneX;
			y = 0.77 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			onButtonClick = "call Z_SellItems;";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
		};
		class ZSC_RscButtonMenu_AT27: AT_Zupa_BlueButton {
			idc = 7436;
			text = "Buy";
			x = 0.46 * safezoneW + safezoneX;
			y = 0.77 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			onload = "ctrlShow [_this,false]";
			onButtonClick = "call Z_BuyItems;";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
		};
		class ZSC_RscButtonMenu_AT28: AT_Zupa_BlueButton {
			idc = -1;
			x = 0.63 * safezoneW + safezoneX;
			y = 0.77 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);player setVariable [""tradingmoney"",false,true];";
			colorBackground[] = {1,1,1,1};
			color[] = {0,0,0,1};
			text = "Close";
		};
		class RscStrText_AT_PriceInfo: ZSC_RscStructuredText {
			idc = 7451;
			text = "";
			x = 0.46 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_AT_InfoLabel: ZSC_RscText {
		    idc = -1;
		    text = "   Item info";
		    x = 0.60 * safezoneW + safezoneX;
		    y = 0.38 * safezoneH + safezoneY;
		    w = 0.20 * safezoneW;
		    h = 0.03 * safezoneH;
		    colorBackground[] = {0.2,0.75,1,1};
		    colorText[] = {1,1,1,1};
		};
		class RscText_AT_BreakLine: ZSC_RscText {
				idc = -1;
				x = 0.60 * safezoneW + safezoneX;
				y = 0.15 * safezoneH + safezoneY;
				w = 0.0005 * safezoneW;
				h = 0.70 * safezoneH;
			  colorBackground[] = {0.2,0.75,1,1};
		};
		class RscStrText_AT_ItemInfo: ZSC_RscStructuredText {
			idc = 7445;
			text = "";
			x = 0.61 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.19 * safezoneW;
			h = 0.59 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscStrText_AT_ContainerInfo: ZSC_RscStructuredText {
			idc = 7446;
			text = "";
			x = 0.61 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.19 * safezoneW;
			h = 0.35 * safezoneH;
			colorText[] = {1,1,1,1};
		};
	};
};