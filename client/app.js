import ReactOnRails from "react-on-rails";

import Map from "./components/Map";
import GeoSearchBox from "./components/GeoSearchBox";
import LocationSearch from "./components/LocationSearch";

ReactOnRails.register({ Map });
ReactOnRails.register({ GeoSearchBox });
ReactOnRails.register({ LocationSearch });

import "./app.scss";
