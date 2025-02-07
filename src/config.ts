import * as icons from "simple-icons";
import type { SimpleIcon } from "simple-icons";

function svg(icon: SimpleIcon): HTMLElement {
  const domParser = new DOMParser();
  const xml = domParser.parseFromString(icon.svg, "image/svg+xml")
    .documentElement;
  xml.setAttribute("width", "20");
  xml.setAttribute("height", "20");
  xml.setAttribute("fill", `#${icon.hex}`);
  return xml;
}

export type Config = {
  /** Whether banners are only created when banner=yes is set */
  explicitBanner: boolean;

  /** A record of identifiers mapped to SVG icons */
  icons: Record<string, HTMLElement>;
};

export const config: Config = { explicitBanner: false, icons: {} };

for (const icon of Object.values(icons)) {
  const simpleIcon: SimpleIcon = icon as SimpleIcon;
  config.icons[simpleIcon.slug] = svg(simpleIcon);
}
