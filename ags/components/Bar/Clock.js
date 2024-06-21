
export const Clock = () => {
  return Widget.Label({
    class_name: "clock, bar_item",
    label: date.bind(),
  })
}
const date = Variable("", {
  // poll: [1000, 'date "+%H:%M:%S %b %e."'],
  poll: [1000, 'date "+%H:%M:%S"'],
})
