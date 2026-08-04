import cars from "../../data/inventory/cars";
import bikes from "../../data/inventory/bikes";

export default function getRelatedVehicles(vehicle) {
  const inventory =
    vehicle.type === "bike"
      ? bikes
      : cars;

  return inventory
    .filter((item) => item.slug !== vehicle.slug)
    .slice(0, 4);
}