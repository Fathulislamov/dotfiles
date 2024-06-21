const hyprland = await Service.import("hyprland")

export const Title = () => {
  return (
    Widget.Label({
      class_name: "bar_item",
      label: hyprland.active.client.bind("title"),
    }))
}
