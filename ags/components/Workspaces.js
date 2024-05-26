const hyprland = await Service.import("hyprland")

const activeId = hyprland.active.workspace.bind("id")
const workspaces = hyprland.bind("workspaces").as(ws => filterAndSort(ws))

const filterAndSort = (arr) => {
  const filtered = arr.filter(({ id }) => id !== -98)
  const sorted = filtered.sort((a, b) => a.id - b.id)
  return sorted.map(({ id }) =>  buttons(id))
}

const buttons = (id) => {
  return (
    Widget.Button({
      on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
      child: Widget.Label(`${id}`),
      class_name: activeId.as(i => `workspace_button ${i === id ? "focused" : ""}`),
    })
  )
}

export const Workspaces = () => {
  return (
    Widget.Box({
      class_name: "workspaces",
      children: workspaces,
    })
  )
}
