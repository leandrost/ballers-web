const webpack = require("webpack");
const path = require("path");

const devBuild = process.env.NODE_ENV !== "production";
const nodeEnv = devBuild ? "development" : "production";

const config = {
  entry: [
    "es5-shim/es5-shim",
    "es5-shim/es5-sham",
    "babel-polyfill",
    path.resolve("client/app.js"),
  ],

  output: {
    filename: "webpack-bundle.js",
    path: "app/assets/webpack",
  },

  resolve: {
    extensions: ["", ".js", ".jsx"],
    alias: {
      react: path.resolve("./node_modules/react"),
      "react-dom": path.resolve("./node_modules/react-dom"),
      "react-google-maps": path.resolve("./node_modules/react-google-maps/lib"),
    },
  },

  plugins: [
    new webpack.DefinePlugin({
      "process.env": {
        NODE_ENV: JSON.stringify(nodeEnv),
        GOOGLE_MAPS_API_KEY: JSON.stringify(process.env.GOOGLE_MAPS_API_KEY),
      },
    }),
  ],

  module: {
    loaders: [
      {
        test: require.resolve("react"),
        loader: "imports?shim=es5-shim/es5-shim&sham=es5-shim/es5-sham",
      },
      {
        test: /\.jsx?$/,
        loader: "babel-loader",
        exclude: /node_modules/,
      },
      {
        test: /\.scss$/,
        loader: "style!css!sass"
      },
      {
        test: /\.css$/,
        loader: "style!css"
      },
    ],
  },

  externals: {
    "react/addons": true,
    "react/lib/ExecutionEnvironment": true,
    "react/lib/ReactContext": true
  },
};

module.exports = config;

if (devBuild) {
  console.log("Webpack dev build for Rails"); // eslint-disable-line no-console
  module.exports.devtool = "eval-source-map";
} else {
  config.plugins.push(
    new webpack.optimize.DedupePlugin()
  );
  console.log("Webpack production build for Rails"); // eslint-disable-line no-console
}
