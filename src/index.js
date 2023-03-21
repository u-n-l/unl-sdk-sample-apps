import UnlSdk from "unl-map-js";
import iGenesysStyle from "./iGenesysStyle";
import MapboxPitchToggleControl from "@watergis/mapbox-gl-pitch-toggle-control";
import "@watergis/mapbox-gl-pitch-toggle-control/css/styles.css";

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
map.addControl(
  new MapboxPitchToggleControl({
    pitch: 60,
    bearing: null,
    minpitchzoom: null,
  }),
  "bottom-right"
);

const handlePitchEnd = () => {
  const buttons2D = document.getElementsByClassName(
    "mapboxgl-ctrl-icon mapboxgl-ctrl-pitchtoggle-2d"
  );

  const buttons3D = document.getElementsByClassName(
    "mapboxgl-ctrl-icon mapboxgl-ctrl-pitchtoggle-3d"
  );

  if (buttons2D.length) {
    buttons2D[0].textContent = "2D";
  } else if (buttons3D.length) {
    buttons3D[0].textContent = "3D";
  }
};

map.on("pitchend", handlePitchEnd);

handlePitchEnd();
