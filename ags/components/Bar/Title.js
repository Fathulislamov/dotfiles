const hyprland = await Service.import("hyprland")

export const Title = () => {
  return (
    Widget.Label({
      class_name: "client-title",
      label: hyprland.active.client.bind("title"),
    }))
}
