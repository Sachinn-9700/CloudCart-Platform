import "./SimilarVehicles.css";

import InventoryCard from "../../inventory/InventoryCard/InventoryCard";

export default function SimilarVehicles({
  vehicles,
}) {
  return (
    <section className="similar-vehicles">

      <h2>
        Similar Vehicles
      </h2>

      <div className="similar-grid">

        {vehicles.map((vehicle) => (
          <InventoryCard
            key={vehicle.id}
            vehicle={vehicle}
          />
        ))}

      </div>

    </section>
  );
}