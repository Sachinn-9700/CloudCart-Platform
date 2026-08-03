import cars from "../../data/inventory/cars";
import bikes from "../../data/inventory/bikes";

export default function getVehicleBySlug(slug) {
  const vehicles = [...cars, ...bikes];

  return vehicles.find(
    (vehicle) => vehicle.slug === slug
  );
}