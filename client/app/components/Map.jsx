import React, { Component } from "react";

import {
  withGoogleMap,
  GoogleMap,
  Marker
} from "react-google-maps";

import googleMapsLoader from "react-google-maps-loader";

const RJ = { lat: -22.9068467, lng: -43.17289649999998 };

const GoogleMapContainer = withGoogleMap(
  props => (
      <GoogleMap
        ref={props.onMapLoad}
        defaultZoom={11}
        defaultCenter={RJ}
        onClick={props.onMapClick}
      >
        {props.markers.map(marker => (
        <Marker {...marker} onRightClick={() => props.onMarkerRightClick(marker)} />
        ))}
      </GoogleMap>
  )
);

export class Map extends Component {
  static propTypes = {
    markers: React.PropTypes.array,
  };

  render() {
    return (
      <GoogleMapContainer
        loadingElement={ <div style={{ height: "100%" }}>LOADING...</div> }
        containerElement={ <div style={{ height: "450px" }} /> }
        mapElement={ <div style={{ height: "100%" }} /> }
        markers={this.props.markers}
      />
    );
  }
}

export default googleMapsLoader(Map, {
  libraries: ["places", "geometry"],
  key: process.env.GOOGLE_MAPS_API_KEY
});
