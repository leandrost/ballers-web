import React, { Component } from "react";
import GoogleMapsLoader from "react-google-maps-loader";
import GooglePlacesSuggest from "react-google-places-suggest";

class GeoSearchBox extends Component {
  static propTypes = {
    googleMaps: React.PropTypes.object,
  };

  state = {
    search: "",
    latitude: 0,
    longitude: 0
  }

  handleSearchChange = (e) => {
    this.setState({ search: e.target.value });
  }

  handleSelectSuggest = (suggest, coordinate) => {
    this.setState({
      search: suggest.description,
      latitude: coordinate.latitude,
      longitude: coordinate.longitude,
    });
  }

  render() {
    const { search, latitude, longitude } = this.state;
    const { googleMaps } = this.props;
    return (
      <div>
        <GooglePlacesSuggest
          googleMaps={ googleMaps }
          onSelectSuggest={ this.handleSelectSuggest }
          search={ search }>
          <input
            name="court[address]"
            type="text"
            value={ search }
            placeholder="Search a location"
            autoComplete="off"
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

export default GoogleMapsLoader(GeoSearchBox, {
  libraries: ["places", "geometry"],
  key: process.env.GOOGLE_MAPS_API_KEY
});
