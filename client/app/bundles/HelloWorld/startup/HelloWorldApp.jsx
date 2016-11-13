import React from "react";
import ReactOnRails from "react-on-rails";

import HelloWorld from "../containers/HelloWorld";
import Map from "../containers/Map";

const HelloWorldApp = (props) => (
  <HelloWorld {...props} />
);

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ HelloWorldApp });
ReactOnRails.register({ Map });
