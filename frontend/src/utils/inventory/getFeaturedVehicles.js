import cars from "../../data/inventory/cars";
import bikes from "../../data/inventory/bikes";

export default function getFeaturedVehicles() {

  return [...cars, ...bikes]
    .filter(vehicle => vehicle.featured)
    .slice(0, 8);

}