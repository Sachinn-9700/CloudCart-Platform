import { useParams } from "react-router-dom";

import useVehicle from "../../hooks/useVehicle";

import VehicleHero from "../../components/vehicle/VehicleHero";
import VehiclePricing from "../../components/vehicle/VehiclePricing";
import VehicleSpecs from "../../components/vehicle/VehicleSpecs";
import VehicleActions from "../../components/vehicle/VehicleActions";
import VehicleDescription from "../../components/vehicle/VehicleDescription";
import SimilarVehicles from "../../components/vehicle/SimilarVehicles";

export default function VehicleDetails() {

  const { slug } = useParams();

  const {
    vehicle,
    relatedVehicles,
  } = useVehicle(slug);

  if (!vehicle) {

    return (

      <main
        style={{
          maxWidth: "1200px",
          margin: "100px auto",
          color: "#fff",
        }}
      >

        <h1>
          Vehicle not found
        </h1>

      </main>

    );

  }

  return (

    <main
      style={{
        maxWidth: "1300px",
        margin: "80px auto",
        padding: "2rem",
      }}
    >

      <VehicleHero
        vehicle={vehicle}
      />

      <VehiclePricing
        vehicle={vehicle}
      />

      <VehicleSpecs
        vehicle={vehicle}
      />

      <VehicleActions />

      <VehicleDescription
        vehicle={vehicle}
      />

      <SimilarVehicles
        vehicles={relatedVehicles}
      />

    </main>

  );

}
