import { useParams } from "react-router-dom";

import "./VehicleDetails.css";

import useVehicle from "../../hooks/useVehicle";

import VehicleHero from "../../components/vehicle/VehicleHero";
import VehiclePricing from "../../components/vehicle/VehiclePricing";
import VehicleSpecs from "../../components/vehicle/VehicleSpecs";
import VehicleActions from "../../components/vehicle/VehicleActions";
import VehicleOverview from "../../components/vehicle/VehicleOverview";
import VehicleInfoGrid from "../../components/vehicle/VehicleInfoGrid";
import SimilarVehicles from "../../components/vehicle/SimilarVehicles";

export default function VehicleDetails() {

    const { slug } = useParams();

    const {
        vehicle,
        relatedVehicles,
    } = useVehicle(slug);

    if (!vehicle) {

        return (
            <main className="vehicle-page">
                <h1>Vehicle not found.</h1>
            </main>
        );

    }

    return (

        <main className="vehicle-page">

            <VehicleHero
                vehicle={vehicle}
            />

            <VehicleInfoGrid

                left={
                    <>
                        <VehiclePricing vehicle={vehicle} />

                        <VehicleActions />
                    </>
                }

                right={
                    <>
                        <VehicleSpecs vehicle={vehicle} />

                        <VehicleOverview vehicle={vehicle} />
                    </>
                }

            />

            <SimilarVehicles
                vehicles={relatedVehicles}
            />

        </main>

    );

}

