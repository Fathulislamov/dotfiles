import { AppMixer } from "./AppMixer.js";
import { SinkSelector } from "./SinkSelector.js";
import { Volume } from "./Volume.js";

export const Audio= () => Widget.Box({
  class_name: "volume_box",
  vertical: true,
  children: [
    Widget.Box({
      vertical: true,
      children: [
        Volume("sink"),
        Volume("source"),
      ]
    }),
    SinkSelector("sink"),
    SinkSelector("source"),
    AppMixer(),
  ]
});




