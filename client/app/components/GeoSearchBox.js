import React, { Component } from "react";
import googleMapsLoader from "react-google-maps-loader";
import GooglePlacesSuggest from "react-google-places-suggest";

class GeoSearchBox extends Component {
  state = {
    search: "",
    latitude: 0,
    longitude: 0
  }

  handleSearchChange = (e) => {
    this.setState({ search: e.target.value });
  }

  handleSelectSuggest = (suggestName, coordinate) => {
    this.setState({
      search: suggestName,
      latitude: coordinate.latitude,
      longitude: coordinate.longitude,
    });
  }

  render() {
    const { search, latitude, longitude } = this.state;
    return (
      <div>
        <GooglePlacesSuggest onSelectSuggest={ this.handleSelectSuggest } search={ search }>
          <input
            name="court[address]"
            type="text"
            value={ search }
            placeholder="Search a location"
            onChange={ this.handleSearchChange }
          />
        </GooglePlacesSuggest>
        <div className="field">
          <input
            name="court[coordinates][latitude]"
            type="number"
            value={ latitude }
          />
        </div>
        <div className="field">
          <input
            name="court[coordinates][longitude]"
            type="number"
            value={ longitude }
          />
        </div>
      </div>
    );
  }
}

export default googleMapsLoader(GeoSearchBox, {
  libraries: ["places", "geometry"],
  key: process.env.GOOGLE_MAPS_API_KEY
});
