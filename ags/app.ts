import { App } from "astal"
import style from "inline:./style.css"
import Bar from "./views/Bar"
import Wallpaper from "./views/Wallpaper"

App.start({
    css: style,
    main() {
        Bar(),
        Wallpaper()
    },
})
