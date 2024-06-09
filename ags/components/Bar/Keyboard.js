const Hyprland = await Service.import("hyprland")

export const Keyboard = () => Widget.Label({
  connections: [[Hyprland, (label, kbName, layoutName) => {
    label.label = kbName ? ( layoutName) : 'yy';
  }, 'keyboard-layout']],

	// Hyprland.connect('keyboard-layout', ( ...args: any) => {
	//
	//     print(...args)
	//
	//   })
});
