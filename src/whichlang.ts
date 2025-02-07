import { config } from "./config.ts";

type Banner = {
  icon?: HTMLElement;
  language?: string;
  filePath?: string;
};

function codeBlockBanner(bannerData: Banner): HTMLDivElement {
  const banner = document.createElement("div");
  banner.classList.add("wl-banner");

  const icon = document.createElement("span");
  icon.classList.add("wl-icon");

  if (bannerData.icon !== undefined) {
    icon.append(bannerData.icon.cloneNode(true));
  }
  banner.append(icon);

  const filePath = document.createElement("span");
  filePath.classList.add("wl-filepath");

  if (bannerData.filePath !== undefined) {
    filePath.textContent = bannerData.filePath;
  }
  banner.append(filePath);

  return banner;
}

function transformHljsIdentifier(hljsIdentifier: string): string {
  return hljsIdentifier.toUpperCase();
}

function languageNameByHljsClass(className: string): string | undefined {
  const hljsIdentifier = className.replace(/^language-/, "");
  if (className == hljsIdentifier) return undefined;
  return transformHljsIdentifier(hljsIdentifier);
}

function parseAttribute(input: string): [string, string] | undefined {
  return input.split("=", 2) as [string, string];
}

for (const codeBlock of document.querySelectorAll("pre > code")) {
  let language: string | undefined;
  let filePath: string | undefined;
  let icon: HTMLElement | undefined;

  let forceCurrentIcon: boolean = false;

  let createBanner = !config.explicitBanner;

  const classes = codeBlock.classList;
  for (const cls of classes) {
    language ??= languageNameByHljsClass(cls);

    const pair = parseAttribute(cls);
    if (pair === undefined) continue;
    const [key, value] = pair;
    switch (key) {
      case "icon":
        if (value.startsWith("%")) {
          icon = config.icons[value.slice(1)];
        } else if (value.startsWith(".")) {
          const iconClasses = value.split(".").filter((x) => x.trim() !== "");
          icon = document.createElement("i");
          icon.classList.add(...iconClasses);
        } else if (value.startsWith("@")) {
          const url = value.slice(1);
          icon = document.createElement("img");
          icon.setAttribute("src", url);
          icon.setAttribute("width", "20");
          icon.setAttribute("height", "20");
        } else {
          icon = undefined;
        }
        forceCurrentIcon = true;
        break;
      case "fp":
      case "filepath":
        filePath = value;
        break;
      case "banner":
        switch (value) {
          case "yes":
            createBanner = true;
            break;
          case "no":
            createBanner = false;
            break;
          default:
            console.warn(
              `Invalid value for banner attribute of code block: ${value}`,
            );
        }
        break;
      default:
        console.debug(`Ignoring pair ${cls}`);
    }
  }

  if (!createBanner) continue;

  if (icon === undefined && !forceCurrentIcon && language !== undefined) {
    icon = config.icons[language.toLowerCase()];
  }

  if (icon !== undefined || filePath !== undefined) {
    const banner: Banner = { icon, language, filePath };
    const element = codeBlockBanner(banner);
    codeBlock.parentElement?.before(element);
  }
}
