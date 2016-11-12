import React, { PropTypes, Component } from 'react';

import {
  withGoogleMap,
  GoogleMap,
  Marker
} from "react-google-maps";
import withScriptjs from "react-google-maps/async/withScriptjs";

const Baskeire = { lat: -22.8803052, lng: -43.3749589 };

const AsyncGettingStartedExampleGoogleMap = withScriptjs(
  withGoogleMap(
    props => (
      <div>
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
      </div>
    )
  )
);

export default class Map extends React.Component {
  render() {
    const markers = [
      {
        key: "2",
        position: Baskeire,
        defaultAnimation: 2,
      }
    ];

    return (
      <div>
        <AsyncGettingStartedExampleGoogleMap
          googleMapURL="https://maps.googleapis.com/maps/api/js?v=3.exp"
          loadingElement={ <div style={{ height: `100%` }}>LOADING...</div> }
          containerElement={ <div style={{ height: `450px` }} /> }
          mapElement={ <div style={{ height: `100%` }} /> }
          markers={markers}
        /> </div>
    );
  }
}
