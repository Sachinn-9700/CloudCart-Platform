import getVehicleBySlug from "../utils/vehicle/getVehicleBySlug";
import getRelatedVehicles from "../utils/vehicle/getRelatedVehicles";

export default function useVehicle(slug) {

  const vehicle = getVehicleBySlug(slug);

  const relatedVehicles =
    vehicle
      ? getRelatedVehicles(vehicle)
      : [];

  return {
    vehicle,
    relatedVehicles,
  };

}