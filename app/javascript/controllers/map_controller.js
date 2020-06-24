import { Controller } from "stimulus"
import mapboxgl from 'mapbox-gl';

export default class extends Controller {

  initialize() {
    // Get data and set API token
    mapboxgl.accessToken = this.data.get('accessToken');
    const { latitude, longitude } = JSON.parse(this.data.get('waypoint'));

    // Initialize map
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v9',
      center: [longitude, latitude],
      zoom: 13
    });
    
    // Add Marker
    new mapboxgl.Marker()
      .setLngLat([longitude, latitude])
      .addTo(map);
  }
}
