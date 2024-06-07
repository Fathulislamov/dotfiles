import brightness from './brightness.js';

// export const Brightness = () => Widget.Slider({
//   on_change: self => brightness.screen_value = self.value,
//   value: brightness.bind('screen-value'),
// });

// const label = Label({
//   label: brightness.bind('screen-value').as(v => `${v}`),
//   setup: self => self.hook(brightness, (self, screenValue) => {
//     // screenValue is the passed parameter from the 'screen-changed' signal
//     self.label = screenValue ?? 0;
//
//     // NOTE:
//     // since hooks are run upon construction
//     // the passed screenValue will be undefined the first time
//
//     // all three are valid
//     self.label = `${brightness.screenValue}`;
//     self.label = `${brightness.screen_value}`;
//     self.label = `${brightness['screen-value']}`;
//
//   }, 'screen-changed'),
// });
export const Brightness= () => {
  return Widget.LevelBar({
    widthRequest: 140,
    vpack: "center",
		value: brightness.bind('screen-value'),

  })
}
