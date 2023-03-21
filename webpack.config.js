const path = require("path");
const webpack = require("webpack");

module.exports = {
  entry: path.resolve(__dirname, "src", "index.js"),
  resolve: {
    fallback: {
      path: false,
      fs: false,
      buffer: require.resolve("buffer"),
    },
  },
  module: {
    rules: [
      {
        loader: "babel-loader",
        test: /\.js$|jsx/,
        exclude: /node_modules/,
      },
      {
        test: /\.css$/i,
        use: ["css-loader"],
      },
    ],
  },
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "index.js",
  },
  plugins: [
    // Work around for Buffer is undefined:
    // https://github.com/webpack/changelog-v5/issues/10
    new webpack.ProvidePlugin({
      Buffer: ["buffer", "Buffer"],
    }),
  ],
};
