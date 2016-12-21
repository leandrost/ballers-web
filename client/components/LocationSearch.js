import React, { Component, PropTypes } from "react";
import GoogleMapsLoader from "react-google-maps-loader";
import GooglePlacesSuggest from "react-google-places-suggest";

class LocationSearch extends Component {
  static propTypes = {
    action: PropTypes.string,
    googleMaps: PropTypes.object,
  };

  state = {
    search: "",
    latitude: 0,
    longitude: 0
  }

  constructor(props){
    super(props);
  }

  componentDidMount(){
    if (!("geolocation" in navigator)) { return; }
    navigator.geolocation.getCurrentPosition((position) => {
      const coords = position.coords;
      this.setState({ latitude: coords.latitude, longitude: coords.longitude });
    });
  }

  handleSelectSuggest = (suggest, coordinate) => {
    this.setState({
      search: suggest.description,
      latitude: coordinate.latitude,
      longitude: coordinate.longitude,
    });
  }

  handleSearchChange = (e) => {
    this.setState({ search: e.target.value });
  }

  render() {
    const { action, googleMaps } = this.props;
    const { search, latitude, longitude } = this.state;
    return (
      <form action={action} method="get">
        <GooglePlacesSuggest
          googleMaps={ googleMaps }
          onSelectSuggest={ this.handleSelectSuggest }
          search={ search }
        >
          <input
            type="text"
            name="nearby"
            value={ search }
            size="100"
            autoComplete="off"
            placeholder="My location"
            onChange={ this.handleSearchChange }
          />
        </GooglePlacesSuggest>
        <input type="submit" value="browse" />
        <input type="hidden" name="latitude" value={latitude} />
        <input type="hidden" name="longitude" value={longitude} />
      </form>
    );
  }
}

export default GoogleMapsLoader(LocationSearch, {
  libraries: ["places", "geometry"],
  key: process.env.GOOGLE_MAPS_API_KEY
});
