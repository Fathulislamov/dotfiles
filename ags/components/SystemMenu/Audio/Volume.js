const audio = await Service.import("audio")


export const Volume = (type = "sink") => Widget.Box({
  class_name: "audio-volume-box",
  children: [
    TypeIndicator(type),
    VolumeSlider(type),
    PercentLabel(type)
  ],
});

const TypeIndicator = (type = "sink") => Widget.Button({
  on_clicked: () => Utils.execAsync(`pactl set-${type}-mute @DEFAULT_${type.toUpperCase()}@ toggle`),
  child: Widget.Icon()
    .hook(audio, icon => {
      if (audio[sorm(type)])
        icon.icon = iconSubstitute(audio[sorm(type)].icon_name, type);
    }, sorm(type) + "-changed")
});

const VolumeSlider = (type = "sink") => Widget.Slider({
  hexpand: true,
  draw_value: false,
  on_change: ({ value }) => audio[sorm(type)].volume = value,
})
  .hook(audio, slider => {
    if (!audio[sorm(type)])
      return;
    slider.sensitive = !audio[sorm(type)]?.stream.is_muted;
    slider.value = audio[sorm(type)].volume;
  }, sorm(type) + "-changed");

const PercentLabel = (type = "sink") => Widget.Label({
  class_name: "audio-volume-label",
})
  .hook(audio, label => {
    if (audio[sorm(type)])
      // @ts-ignore
      label.label = `${Math.floor(audio[sorm(type)].volume * 100)}%`;
  }, sorm(type) + "-changed");

export const iconSubstitute = (item, type) => {
  const microphoneSubstitutes = {
    "audio-headset-analog-usb": "audio-headset-symbolic",
    "audio-headset-bluetooth": "audio-headphones-symbolic",
    "audio-card-analog-usb": "audio-input-microphone-symbolic",
    "audio-card-analog-pci": "audio-input-microphone-symbolic",
    "audio-card-analog": "audio-input-microphone-symbolic",
    "camera-web-analog-usb": "camera-web-symbolic"
  };
  const substitues = {
    "audio-headset-bluetooth": "audio-headphones-symbolic",
    "audio-card-analog-usb": "audio-speakers-symbolic",
    "audio-card-analog-pci": "audio-speakers-symbolic",
    "audio-card-analog": "audio-speakers-symbolic",
    "audio-headset-analog-usb": "audio-headset-symbolic"
  };

  if (type === "sink") {
    return substitues[item] || item;
  }
  return microphoneSubstitutes[item] || item;
};
const sorm = (type) => type === "sink" ? "speaker" : "microphone";
