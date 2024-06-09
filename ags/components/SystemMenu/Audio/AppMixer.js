import Menu from "../quicksettings/menu.js";
import icons from "../../icons/index.js";
import { SettingsButton } from "./SinkSelector.js";
const audio = await Service.import("audio")

export const AppMixer = () => Menu({
  title: "App Mixer",
  icon: icons.audio.mixer,
  content: Widget.Box({
    class_name: "app-mixer",
    vertical: true,
    children: [
      Widget.Box({vertical: true})
        .hook(audio, box => {
          box.children = audio.apps.map(MixerItem);
        }, "notify::apps")
    ],
  }),
  headerChild: SettingsButton(1),
});

const MixerItem = stream => Widget.EventBox({
  on_primary_click: () => stream.is_muted = !stream.is_muted,
  on_scroll_up: () => stream.volume += 0.03,
  on_scroll_down: () => stream.volume -= 0.03,
  child: Widget.Box({
    hexpand: true,
    class_name: "mixer-item",
    children: [
      Widget.Icon({
        icon: stream.bind("icon_name").transform(() => streamIconSubstiture(stream)),
        tooltip_text: stream.bind("name").transform(name => name || "")
      }),
      Widget.Box({
        vertical: true,
        vpack: "center",
        children: [
          Widget.Box({
            children: [
              Widget.Label({
                xalign: 0,
                hexpand: true,
                class_name: "mixer-item-title",
                truncate: "end",
                label: stream.bind("description").transform(desc => desc || ""),
              }),
              Widget.Label({
                xalign: 0,
                class_name: "mixer-item-volume",
                label: stream.bind("volume").transform(volume => `${Math.floor(volume * 100)}%`)
              }),
            ]
          }),
          Widget.Slider({
            hexpand: true,
            class_name: "mixer-item-slider",
            draw_value: false,
            value: stream.bind("volume"),
            on_change: ({value}) => {
              stream.volume = value;
            },
          }),
        ],
      }),
    ],
  })
});

const streamIconSubstiture = stream => {
  const subs = {
    "spotify": "spotify",
    "Firefox": "firefox",
  };
  return subs[stream.name] || stream.icon_name;
};

