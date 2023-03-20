import UnlSdk from "unl-map-js";
import iGenesysStyle from "./iGenesysStyle";

const map = new UnlSdk.Map({
  //prod
  apiKey: "oaCR6BL00pzMF7Kq31fq0pLC5706tpA0",
  vpmId: "b89ba327-159b-43c4-8633-34a030c9217e",
  //alpha
  // apiKey: "RnjiJC0e4ANXS8gqrWqDnuV8yvb4SSRq",
  // vpmId: "2df374db-1d66-4c08-9fbc-90185e0b9856",
  style: iGenesysStyle,
  // gridControl: true,
  // indoorMapsControl: true,
  // tilesSelectorControl: true,
  // draftShapesControl: true,
  container: "map",
  attributionControl: false,
  maxBounds: [
    [72.6648266, 18.8343822],
    [73.15381, 19.4118792],
  ],
});

map.addControl(new UnlSdk.NavigationControl(), "bottom-right");
