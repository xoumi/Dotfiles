import Astal from "gi://Astal";
import { App, GLib, Gtk, exec } from "astal";

type Image = {
  thumbnail: string;
  path: string;
};
export default function Wallpaper(show: boolean) {
  const wallPath = GLib.getenv("WALLPATH");
  const files = exec(`ls /home/soma/.cache/wallpapers`)
    .split("\n")
    .map((path) => ({
      thumbnail: `/home/soma/.cache/wallpapers/${path}`,
      path: `${wallPath}/${path}`,
    }));

  const selectWallpaper = (f: Image) => {
    console.log("clicked", f);
    exec(["/home/soma/str/doc/dot/bin/setWallpaper.sh", f.path]);
  };

  return (
    <window
      name="wallpaper"
      application={App}
      monitor={1}
      margin={14}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT}
    >
      <box className="Bar">
        <scrollable
          className="Wallpaper"
          hscroll={Gtk.PolicyType.NEVER}
          vscroll={Gtk.PolicyType.ALWAYS}
        >
          <box className="window" vertical>
            {files.map((file) => (
              <button
                className="Thumbnail"
                onClick={() => selectWallpaper(file)}
                css={`
                  background-image: url("${file.thumbnail}");
                `}
              />
            ))}
          </box>
        </scrollable>
        </box>
    </window>
  );
}
