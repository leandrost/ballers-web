import ReactOnRails from "react-on-rails";

import Map from "./components/Map";
import GeoSearchBox from "./components/GeoSearchBox";

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ Map });
ReactOnRails.register({ GeoSearchBox });
