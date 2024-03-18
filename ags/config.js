import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import SystemTray from "resource:///com/github/Aylur/ags/service/systemtray.js";
import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { execAsync } from "resource:///com/github/Aylur/ags/utils.js";
// import { notificationPopup } from './notificationPopup.js';

// widgets can be only assigned as a child in one container
// so to make a reuseable widget, make it a function
// then you can simply instantiate one by calling it

const Workspaces = () => {
  const workspaceNameMap = ['term', 'web', 'media', 'misc'];
  return Widget.Box({
    class_name: "workspaces",
    children: Hyprland.bind("workspaces").transform((ws) => {
      return ws
        .sort((a, b) => a.id - b.id)
        .map(w => {
          return Widget.Button({
            on_clicked: () => Hyprland.sendMessage(`dispatch workspace ${id}`),
            child: Widget.Label(`${workspaceNameMap[w.id - 1]}`),
            class_name: Hyprland.active.workspace
              .bind("id")
              .transform((i) => i === w.id ? "focused" : ""),
          })
        });
    }),
  });
}

const Clock = () =>
  Widget.Label({
    class_name: "clock",
    setup: (self) =>
      self.poll(1000, (self) =>
        execAsync(["date", "+%H:%M %b %e"]).then((date) => (self.label = date)),
      ),
  });

// const Notification = () =>
//   Widget.Box({
//     class_name: "notification",
//     visible: Notifications.bind("popups").transform((p) => p.length > 0),
//     children: [
//       Widget.Icon({
//         icon: "preferences-system-notifications-symbolic",
//       }),
//       Widget.Label({
//         label: Notifications.bind("popups").transform(
//           (p) => p[0]?.summary || "",
//         ),
//       }),
//     ],
//   });

const Volume = () =>
  Widget.Box({
    class_name: "volume",
    css: "min-width: 180px",
    children: [
      Widget.Icon().hook(
        Audio,
        (self) => {
          if (!Audio.speaker) return;

          const category = {
            101: "overamplified",
            67: "high",
            34: "medium",
            1: "low",
            0: "muted",
          };

          const icon = Audio.speaker.is_muted
            ? 0
            : [101, 67, 34, 1, 0].find(
                (threshold) => threshold <= Audio.speaker.volume * 100,
              );

          self.icon = `audio-volume-${category[icon]}-symbolic`;
        },
        "speaker-changed",
      ),
      Widget.Slider({
        hexpand: true,
        draw_value: false,
        on_change: ({ value }) => (Audio.speaker.volume = value),
        setup: (self) =>
          self.hook(
            Audio,
            () => {
              self.value = Audio.speaker?.volume || 0;
            },
            "speaker-changed",
          ),
      }),
    ],
  });

const SysTray = () =>
  Widget.Box({
    children: SystemTray.bind("items").transform((items) => {
      return items.map((item) =>
        Widget.Button({
          child: Widget.Icon({ binds: [["icon", item, "icon"]] }),
          on_primary_click: (_, event) => item.activate(event),
          on_secondary_click: (_, event) => item.openMenu(event),
          binds: [["tooltip-markup", item, "tooltip-markup"]],
        }),
      );
    }),
  });

// layout of the bar
const Left = () =>
  Widget.Box({
    spacing: 16,
    children: [Workspaces()],
  });

const Center = () =>
  Widget.Box({
    spacing: 16,
    // children: [Notification()],
  });

const Right = () =>
  Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [Volume(), Clock(), SysTray()],
  });

const Bar = (monitor = 0) =>
  Widget.Window({
    name: `bar-${monitor}`, // name has to be unique
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });

import { monitorFile } from "resource:///com/github/Aylur/ags/utils.js";

monitorFile(`${App.configDir}/style.css`, function () {
  App.resetCss();
  App.applyCss(`${App.configDir}/style.css`);
});

// exporting the config so ags can manage the windows
export default {
  style: App.configDir + "/style.css",
  windows: [Bar() ],
};
