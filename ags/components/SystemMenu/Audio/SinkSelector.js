import Menu from "../quicksettings/menu.js";
import icons from "../../icons/index.js";
import { iconSubstitute } from "./Volume.js";

const Hyprland = await Service.import("hyprland")
const audio = await Service.import("audio")

export const SinkSelector = (type = "sink") => Menu({
  title: type + " Selector",
  icon: type === "sink" ? icons.audio.type.headset : icons.audio.mic.unmuted,
  content: Widget.Box({
    class_name: "sink-selector",
    vertical: true,
    children: [
      Widget.Box({ vertical: true })
        .hook(audio, box => {
          box.children = Array.from(audio[sorms(type)].values()).map(SinkItem(type));
        }, "stream-added")
        .hook(audio, box => {
          box.children = Array.from(audio[sorms(type)].values()).map(SinkItem(type));
        }, "stream-removed")
    ],
  }),
  headerChild: SettingsButton(type === "sink" ? 3 : 4),
});

const SinkItem = (type) => stream => Widget.Button({
  on_clicked: () => audio[sorm(type)] = stream,
  child: Widget.Box({
    class_name: "spacing-5",
    children: [
      Widget.Icon({
        icon: iconSubstitute(stream.icon_name, type),
        tooltip_text: stream.icon_name,
      }),
      Widget.Label(stream.description?.split(" ").slice(0, 4).join(" ")),
      Widget.Icon({
        icon: icons.tick,
        hexpand: true,
        hpack: "end",
      }).hook(audio, icon => {
        icon.visible = audio[sorm(type)] === stream;
      }),
    ],
  }),
});

export const SettingsButton = (tab = 0) => Widget.Button({
  on_clicked: () => Hyprland.messageAsync("dispatch exec pavucontrol -t " + tab)
    .catch(logError),
  child: Widget.Icon(icons.settings),
});

const sorms = (type) => type === "sink" ? "speakers" : "microphones";
const sorm = (type) => type === "sink" ? "speaker" : "microphone";
