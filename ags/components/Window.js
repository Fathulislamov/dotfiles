export const Window = (name, children) => {
  App.addWindow(CreateWindow(name,children))
  App.closeWindow(name)
}

const CreateWindow = (name, children) => {
  return Widget.Window({
    name, // name has to be unique
    class_name: name,

    anchor: ["top", "right"],
    exclusivity: "normal",
    child: children
  })
}
