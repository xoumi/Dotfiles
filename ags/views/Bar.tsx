import { App, Variable, Astal, bind, Gtk, exec } from "astal";
import Mpris from "gi://AstalMpris";
import Network from "gi://AstalNetwork";
import Wp from "gi://AstalWp";

const time = Variable("").poll(60000, 'date +"%k:%M"');
const date = Variable("").poll(60000, 'date +"%a, %d %b %Y"');

function Media() {
  const player = Mpris.get_default().get_players()[0];
  return (
    <box className="Media">
      <box valign={Gtk.Align.CENTER}>
        <box
          className="Cover"
          css={bind(player, "coverArt").as(
            (v) => `background-image: url('${v}');`,
          )}
        />
        <label
          label={bind(player, "title").as(
            (_) => `${player.title} ${player.artist}`,
          )}
        />
      </box>
    </box>
  );
}

function Audio() {
  const audio = Wp.get_default()?.audio;
  return <box>{`VOL: ${audio?.default_speaker.volume}`}</box>;
}

function Wifi() {
  const network = Network.get_default();
  return <box>{`WIFI: ${network.wifi.ssid}`}</box>;
}

export default function Bar() {
  const toggleWallpaper = () => {
    App.toggle_window('wallpaper');
  }
  return (
    <window
      name="bar"
      className="Bar"
      monitor={1}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.LEFT |
        Astal.WindowAnchor.RIGHT
      }
      application={App}
    >
      <centerbox>
        <box>
          <button onClicked={toggleWallpaper}>WALLPAPER</button>
          <Media />
        </box>
        <box>
          <label label={time()} />
        </box>
        <box halign={Gtk.Align.END} className="Right">
          <label label={date()} />
          <Wifi />
          <Audio />
        </box>
      </centerbox>
    </window>
  );
}
