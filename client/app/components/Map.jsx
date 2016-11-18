import React, { Component } from "react";

import {
  withGoogleMap,
  GoogleMap,
  Marker
} from "react-google-maps";

import googleMapsLoader from "react-google-maps-loader";

const Baskeire = { lat: -22.8803052, lng: -43.3749589 };
const GoogleMapContainer = withGoogleMap(
  props => (
      <GoogleMap
        ref={props.onMapLoad}
        defaultZoom={16}
        defaultCenter={Baskeire}
        onClick={props.onMapClick}
      >
        {props.markers.map(marker => (
        <Marker {...marker} onRightClick={() => props.onMarkerRightClick(marker)} />
        ))}
      </GoogleMap>
  )
);

class Map extends Component {
  render() {
    const markers = [
      {
        key: "2",
        position: Baskeire,
        defaultAnimation: 2,
      }
    ];
    return (
      <GoogleMapContainer
        loadingElement={ <div style={{ height: "100%" }}>LOADING...</div> }
        containerElement={ <div style={{ height: "450px" }} /> }
        mapElement={ <div style={{ height: "100%" }} /> }
        markers={markers}
      />
    );
  }
}

export default googleMapsLoader(Map, {
  libraries: ["places", "geometry"],
  key: process.env.GOOGLE_MAPS_API_KEY
});
