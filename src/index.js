import UnlSdk from "unl-map-js";
import iGenesysStyle from "./iGenesysStyle";

const map = new UnlSdk.Map({
  vpmId: "2df374db-1d66-4c08-9fbc-90185e0b9856",
  apiKey: "RnjiJC0e4ANXS8gqrWqDnuV8yvb4SSRq",
  style: iGenesysStyle,
  container: "map",
  maxBounds: [
    [71.71281, 17.73921],
    [74.40293, 20.71617],
  ],
  minZoom: 9,
  maxZoom: 18,
  center: [72.89864092257608, 19.18374883353563],
  zoom: 9,
});

map.addControl(new UnlSdk.NavigationControl(), "bottom-right");
